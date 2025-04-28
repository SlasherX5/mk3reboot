#pragma once

extern "C"
{
#define STBI_ONLY_PNG
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
};

struct FileCache
{
	struct TCacheEntry
	{
		uint64_t FileName;
		uint32_t SeekPos;
		uint32_t FileSize;
	};

	static bool CacheOnlyMode;
	static constexpr int MAX_CACHE_FILE_ENTRY = 4096;

	const TCHAR* CacheFileNameFormat;
	TCacheEntry* FileEntries;
	uint32_t MaxEntries, NumEntries, FileWritePos;
	FILE* FCacheFile;
	FILE* FCurrentFile;
	int32_t CurrentEntry;
	FileCache* Next;
	uint8_t CacheFileIndex;

	FILE* GetFilePtr() { return FCurrentFile ? FCurrentFile : FCacheFile; }

	void (*ParseFileName)(TCHAR*, uint64_t, uint8_t);

	bool InitCache(bool bAlwaysCreate)
	{
		TCHAR FileNameStr[128];

		sprintf(FileNameStr, CacheFileNameFormat, CacheFileIndex);

		FCacheFile = fopen(FileNameStr, "r+b");
		if (FCacheFile == nullptr)
		{
			if (!bAlwaysCreate) return false;
			FCacheFile = fopen(FileNameStr, "w+b");

			MaxEntries = MAX_CACHE_FILE_ENTRY;
			FileEntries = new TCacheEntry[MaxEntries];
			FileWritePos = sizeof(TCacheEntry) * MaxEntries;
			memset(FileEntries, 0, FileWritePos);
			NumEntries = 0;

			fwrite(&MaxEntries, 1, 4, FCacheFile);
			fwrite(&NumEntries, 1, 4, FCacheFile);
			fwrite(FileEntries, 1, FileWritePos, FCacheFile);
		}
		else
		{
			fseek(FCacheFile, 0, SEEK_END);
			FileWritePos = ftell(FCacheFile);
			fseek(FCacheFile, 0, SEEK_SET);
			fread(&MaxEntries, 4, 1, FCacheFile);

			FileEntries = new TCacheEntry[MaxEntries];
			memset(FileEntries, 0, sizeof(TCacheEntry) * MaxEntries);

			fread(&NumEntries, 4, 1, FCacheFile);
			fread(FileEntries, NumEntries, sizeof(TCacheEntry), FCacheFile);

			fseek(FCacheFile, FileWritePos, SEEK_SET);
		}

		FCurrentFile = nullptr;
		CurrentEntry = -1;
		return true;
	}

	FileCache(const TCHAR* _CacheFileNameFormat, void (*_ParseFileName)(TCHAR*, uint64_t, uint8_t), uint8_t _CacheFileIndex = 0, bool bAlwaysCreate = false) :
		CacheFileNameFormat(_CacheFileNameFormat),
		FileEntries(nullptr),
		FCurrentFile(nullptr),
		Next(nullptr),
		CacheFileIndex(_CacheFileIndex),
		ParseFileName(_ParseFileName)		
	{
		if (InitCache(_CacheFileIndex == 0 || bAlwaysCreate))
		{
			FileCache* NextCache = new FileCache(_CacheFileNameFormat, _ParseFileName, _CacheFileIndex + 1);
			if (NextCache->FCacheFile)
			{
				Next = NextCache;
			}
			else
			{
				delete NextCache;
				Next = nullptr;
			}
		}
	}

	uint32_t Read(void* Buffer, uint32_t Size)
	{
		if (FCurrentFile)
		{
			uint32_t NumRead = 0;

			if (Buffer == nullptr)
			{
				if (CurrentEntry >= 0)
				{
					TCacheEntry& LastEntry = FileEntries[CurrentEntry];
					void* TmpBuffer = malloc(LastEntry.FileSize);
					fseek(FCurrentFile, 0, SEEK_SET);
					NumRead = fread(TmpBuffer, 1, LastEntry.FileSize, FCurrentFile);
					fwrite(TmpBuffer,1, NumRead, FCacheFile);
					LastEntry.FileSize = NumRead;
					free(TmpBuffer);
					return NumRead;
				}
			}
			else
			{
				NumRead = fread(Buffer, 1, Size, FCurrentFile);
				if (CurrentEntry >= 0)
				{
					fwrite(Buffer, 1, Size, FCacheFile);
				}
			}			

			return NumRead;
		}

		return Buffer != nullptr ? fread(Buffer, 1, Size, FCacheFile) : 0;
	}

	uint32_t Write(void* Buffer, uint32_t Size)
	{
		if (FCurrentFile)
		{
			uint32_t NumWritten = fwrite(Buffer, 1, Size, FCurrentFile);

			if (CurrentEntry >= 0)
			{
				fwrite(Buffer, 1, Size, FCacheFile);
			}

			return NumWritten;
		}

		return fwrite(Buffer, 1, Size, FCacheFile);
	}

	void Close(bool WithError)
	{
		if (FCurrentFile)
		{
			fclose(FCurrentFile);
			FCurrentFile = nullptr;

			if (WithError)
			{
				fseek(FCacheFile, FileWritePos, SEEK_SET);
			}
			else
			if (CurrentEntry >= 0)
			{
				TCacheEntry& LastEntry = FileEntries[CurrentEntry];

				uint32_t EndOfFilePos = LastEntry.SeekPos + LastEntry.FileSize;
				if (EndOfFilePos > FileWritePos)
				{
					FileWritePos = EndOfFilePos;
				}

				fseek(FCacheFile, 8 + CurrentEntry * sizeof(TCacheEntry), SEEK_SET);
				fwrite(&LastEntry, sizeof(TCacheEntry), 1, FCacheFile);

				if (CurrentEntry == NumEntries)
				{
					NumEntries++;
					fseek(FCacheFile, 4, SEEK_SET);
					fwrite(&NumEntries, 4, 1, FCacheFile);
					fseek(FCacheFile, FileWritePos, SEEK_SET);
				}

				CurrentEntry = -1;
			}
		}
	}

	FileCache* Open(uint64_t FileName, uint8_t Hint, bool ReadMode)
	{
		uint64_t FileID = (FileName << 2) | (Hint >> 1);

		CurrentEntry = -1;

		for (size_t i = 0; i < NumEntries; i++)
		{
			if (FileEntries[i].FileName == FileID)
			{
				CurrentEntry = i;
				fseek(FCacheFile, FileEntries[i].SeekPos, SEEK_SET);
				if (CacheOnlyMode) return this;
				break;
			}
		}

		if (CurrentEntry < 0 && Next)
		{
			if (FileCache* Found = Next->Open(FileName, Hint, ReadMode))
			{
				return Found;
			}
		}

		if (CacheOnlyMode) return nullptr;

		TCHAR FileNameStr[256];
		ParseFileName(FileNameStr, FileName, Hint);

		if (ReadMode)
		{
			FCurrentFile = fopen(FileNameStr, "rb");
		}
		else
		{
			FCurrentFile = fopen(FileNameStr, "wb");
		}

		if (CurrentEntry >= 0)
		{
			if (FCurrentFile == nullptr)
			{
				CurrentEntry = -1;
				return this;
			}
			else
			{
				// check file sizes
				fseek(FCurrentFile, 0, SEEK_END);
				uint32_t DestFileSize = ftell(FCurrentFile);
				fseek(FCurrentFile, 0, SEEK_SET);

				if ((DestFileSize - 2) > FileEntries[CurrentEntry].FileSize)
				{
					FileEntries[CurrentEntry].FileSize = DestFileSize;
					FileEntries[CurrentEntry].SeekPos = FileWritePos;
					fseek(FCacheFile, FileWritePos, SEEK_SET);
				}
				else
				{
					fseek(FCacheFile, FileEntries[CurrentEntry].SeekPos, SEEK_SET);
				}

				return this;
			}
		}

		if (FCurrentFile)
		{
			if (NumEntries >= MaxEntries)
			{
				fclose(FCurrentFile);
				FCurrentFile = nullptr;
				Next = new FileCache(CacheFileNameFormat, ParseFileName, CacheFileIndex + 1, true);
				return Next->Open(FileName, Hint, ReadMode);
			}

			fseek(FCurrentFile, 0, SEEK_END);
			uint32_t DestFileSize = ftell(FCurrentFile);
			fseek(FCurrentFile, 0, SEEK_SET);

			CurrentEntry = NumEntries;
			FileEntries[CurrentEntry].FileName = FileID;
			FileEntries[CurrentEntry].SeekPos = FileWritePos;
			FileEntries[CurrentEntry].FileSize = DestFileSize;

			fseek(FCacheFile, FileWritePos, SEEK_SET);
			return this;
		}

		return nullptr;
	}

	bool Cache(uint64_t FileName, uint8_t Hint)
	{
		if (FileCache* FileCache = Open(FileName, Hint, true))
		{
			FileCache->Read(nullptr, -1);
			FileCache->Close(false);
			return true;
		}

		return false;
	}

	~FileCache()
	{
		if (FCacheFile) fclose(FCacheFile);
		if (FCurrentFile) fclose(FCurrentFile);
		if (FileEntries) delete FileEntries;
	}
};

bool FileCache::CacheOnlyMode = false;
