#pragma once

#include <d3d11_1.h>
#include <d3dcompiler.h>
#include <DirectXMath.h>
#include <directxcolors.h>
#include "resource.h"

using namespace DirectX;

struct SimpleVertex
{
	XMFLOAT3 Pos;
	XMFLOAT2 UV;
};

struct ConstantBuffer
{
	XMMATRIX mWorld;
	XMMATRIX mProjection;

	XMFLOAT4 mUVParams;
	XMFLOAT4 mPalParams;
	XMFLOAT4 mColor;
	XMFLOAT4 mExtraParams;
};

/* background block */
typedef struct o_block {
	uint16_t xoffset;						/* x offset within module */
	uint16_t yoffset;						/* y offset within module */
	uint16_t zdepth;						/* z priority within module */
	uint16_t flags;							/* block flags, bit 0 = hflip, bit 1 = v flip, upper byte=CLUT offset*/
	uint16_t hdr_index;						/* index into header array, indexes correct header (tile) */
} OBLOCK;

/* background header/tile */
typedef struct o_header {
	uint16_t tpage;							/* texture page */
	uint16_t t_xoffset;						/* x offset within texture page */
	uint16_t t_yoffset;						/* y offset within texture page */
	uint16_t t_width;						/* texture width */
	uint16_t t_height;						/* texture height */
} OHEADER;

/* background animation header */
typedef struct obg_header {
	uint16_t tpage;							/* texture page */
	uint16_t t_xoffset;						/* x offset within texture page */
	uint16_t t_yoffset;						/* y offset within texture page */
	uint16_t padding;
} OBGHEADER;

/* background module header definition */
typedef struct o_module {
	uint16_t xsize;							/* width of module */
	uint16_t ysize;							/* height of module */
	uint32_t blockcnt;						/* # of blocks in module */
	OBLOCK* block_ptr;					/* ptr to array of blocks */
	OHEADER* header_ptr;				/* ptr to array of headers */
	uint16_t** clut_ptr;					/* ptr to table of cluts */
} OMODULE;


template <typename T> class StaticArray 
{
private:
	T* Ptr;
	uint32_t Count,FixedSize;

	inline void Alloc()
	{
		if (Ptr) return;
		Ptr = (T*)calloc(FixedSize, sizeof(T));
	}

public:
	StaticArray(uint32_t Capacity) : 
		Ptr(nullptr),
		Count(0),
		FixedSize(Capacity)
	{

	}

	~StaticArray()
	{
		if (Ptr) free(Ptr);
	}
	
	inline T& operator[](int Index)
	{
		Alloc();
		return Ptr[Index];
	}

	int Add(T& Element)
	{
		Alloc();
		if (Count >= FixedSize) return -1;
		Ptr[Count++] = Element;
		return Count - 1;
	}

	T* AddEmpty()
	{
		Alloc();
		if (Count >= FixedSize) return nullptr;
		return &Ptr[Count++];
	}

	void Zero()
	{
		if (Ptr) memset(Ptr, 0, sizeof(T) * FixedSize);
	}

	void Clear()
	{
		Count = 0;
	}

	int AddUnique(const T& Value)
	{
		Alloc();
		if (Count >= FixedSize) return -1;

		for (int i = 0; i < Count; i++)
		{
			if (Ptr[i] == Value) return i;
		}

		Ptr[Count++] = Value;
		return Count - 1;
	}

	int Find(const T& Value)
	{
		for (int i = 0; i < Count; i++)
		{
			if (Ptr[i] == Value) return i;
		}

		return -1;
	}

	int Find(const T& Value, const T& Mask)
	{
		T ValueC = Value & Mask;

		for (int i = 0; i < Count; i++)
		{
			if ((Ptr[i]&Mask) == ValueC) return i;
		}

		return -1;
	}

	inline operator T* ()
	{
		Alloc();
		return Ptr;
	}

	int Num() { return Count; }
};

template <typename K, typename V, int BlockSize = 256, int MaxDepth = 16> class HashMap
{
private:

	typedef struct _KeyValueBlock
	{
		K keys[BlockSize];
		V vals[BlockSize];
		_KeyValueBlock* Next;
		uint16_t Size;
	}KeyValueBlock;

	V ZeroValue;
	KeyValueBlock* Dict;
	KeyValueBlock* DictLinFirst, *DictLinLast;
	uint8_t Depth;
	uint32_t TotalAllocatedKeyValues, TotalUsed;

	inline KeyValueBlock* NewBlock()
	{
		TotalAllocatedKeyValues += BlockSize;
		return (KeyValueBlock*)calloc(1, sizeof(KeyValueBlock));
	}

public:
	HashMap() :
		Dict(nullptr),
		DictLinFirst(nullptr),
		DictLinLast(nullptr),
		Depth(0), TotalAllocatedKeyValues(0), TotalUsed(0)
	{

	}

	V* Find(K Key)
	{
		if (Key == 0) return &ZeroValue;

		K dictkey = Key;

		_KeyValueBlock* dict = Dict;

		uint16_t dictIndex = dictkey % BlockSize;

		while (dict)
		{
			if (dict->keys[dictIndex] == Key)
			{
				return &dict->vals[dictIndex];
			}

			dict = dict->Next;
			dictkey /= BlockSize;
			if (dictkey == 0) dictkey = Key;
			dictIndex = dictkey % BlockSize;			
		}

		dict = DictLinFirst;

		while (dict)
		{
			for (int i = 0;i<BlockSize;i++)
			{
				if (dict->keys[i] == Key)
				{
					return &dict->vals[i];
				}
			}

			dict = dict->Next;
		}

		return nullptr;
	}

	V* AddEmpty(K Key)
	{
		if (Key == 0)
		{
			return &ZeroValue;
		}

		if (Dict == nullptr)
		{
			Dict = NewBlock();
			Depth = 1;
		}

		K dictkey = Key;

		_KeyValueBlock* dict = Dict;
		
		uint16_t dictIndex = dictkey % BlockSize;		

		while (dict->keys[dictIndex])
		{
			if (dict->Next == nullptr)
			{
				if (Depth < MaxDepth)
				{
					dict->Next = NewBlock();
					Depth++;
				}
				else
				{
					if (DictLinFirst == nullptr)
					{
						DictLinFirst = NewBlock();
						DictLinLast = DictLinFirst;
					}
					else
					if (DictLinLast->Size == BlockSize)
					{
						DictLinLast->Next = NewBlock();
						DictLinLast = DictLinLast->Next;
					}

					TotalUsed++;
					DictLinLast->keys[DictLinLast->Size] = Key;
					return &DictLinLast->vals[DictLinLast->Size++];
				}
			}

			dict = dict->Next;
			dictkey /= BlockSize;
			if (dictkey == 0) dictkey = Key;
			dictIndex = dictkey % BlockSize;
		}

		TotalUsed++;
		dict->keys[dictIndex] = Key;
		return &dict->vals[dictIndex];
	}

	void Add(K Key, const V& Value)
	{
		if (V* ValPtr = AddEmpty(Key))
		{
			*ValPtr = Value;
		}
	}

	~HashMap()
	{
		_KeyValueBlock* dict = Dict;

		while (dict)
		{
			KeyValueBlock* next = dict->Next;
			free(dict);
			dict = next;
		}

		dict = DictLinFirst;

		while (dict)
		{
			KeyValueBlock* next = dict->Next;
			free(dict);
			dict = next;
		}
	}

	inline float GetOccupancy()
	{
		return (float)TotalUsed / (float)TotalAllocatedKeyValues;
	}
};