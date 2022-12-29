
#pragma warning(disable:4703;disable:4996;disable:4146)

// #include <sys/stat.h>		// note had to do this because of systypes.h incompatibility
#define _S_IREAD	0000400 	/* read permission, owner */
#define _S_IWRITE	0000200 	/* write permission, owner */

#include <io.h>
#include <fcntl.h>

#include "wave.h"
#include <stdio.h>
#include <string.h>
#include <stdarg.h>


#define LOADLIST_START( _id, _sym ) \
	{ -1, #_sym },


#define LOADLIST_END( _id, _sym, _size ) \
    { -2, },


#define ID(_num, _def)  _def
#define VAG(_num, _x, _sym)  #_sym

#define TUNE( _id ) \
    { _id, "tracks/"#_id },

#define SEQ( _id, _vag ) \
    { _id, #_vag },

#define SEQUENCE( _id, _patch, _map, _vag, _vag_size, _vag_rate, _vag_pos ) \
    { _id, _vag },

#define SEQUENCE_LL( _id, _patch, _map, _root_fine, _vag, \
                     _vag_size, _vag_rate, _vag_pos, _vag_lcd ) \
	{ _id, _vag },


typedef struct sound_entry {
	int id;	  
	char *fname;
	int data;  // number of entries for index
} SoundEntry;

#include "../code/mk3snd.h"

SoundEntry SoundFileList[] = {

	#include "mk3sound.lst"
	//#include "mk3sel.lst"
	-99,
};


typedef struct _bsfdata {
	int flog;
} Bsfdata; 

void ProcessSoundFiles(Bsfdata *bsd);

static char sourcepath[] = "wav-aif";
static char	destpath[] = "lcd";

void main()
{
	Bsfdata bsf;
	ProcessSoundFiles(&bsf);

	return;
}

#pragma pack(1)
typedef struct _ixentry {
	int id;	    // id of record
	int size;	// size of record (0 if no record)
	int offset;	// offset from start of file
	int sampleRate;
} IndexEntry;

typedef	struct _lcdindex {
	int NumEntries;
	IndexEntry Entry[256];
} LcdIndex;
#pragma pack()

static LcdIndex OutIndex;

void ProcessSoundFiles(Bsfdata *bsd)
{
char path[256];
SoundEntry *se;
int ixmax = -1;
int fwav = -1;
int flcd = -1;
int offset;
int 			align;
static zeros[sizeof(DWORD)];

	// get data for building index record - count for each .lcd file
	int icount = 0;
	int* pisize = 0;
	for( se = &SoundFileList[-1];;)
	{

		++se;
		switch(se->id)
		{
			case -1:  	// new sound file
				pisize = &se->data;
				icount = 0;
				continue;
			case -2:  	// end of sound ile
				*pisize = icount;
				if(icount > ixmax)
					ixmax = icount;
				continue;
			case -99:  // end of list
				//logf(bsd,"max icount = %d\n", ixmax);
				break;
			default:
				++icount;
				continue;
		}
		break;
	}

	IndexEntry* ixentry = 0;  // current index entry 

	for( se = &SoundFileList[-1];;)
	{

		++se;
		switch(se->id)
		{
			case -1:  	// new lcd file
	
				OutIndex.NumEntries = se->data;
				ixentry = &OutIndex.Entry[0];	// start with first one

				sprintf(path,"%s/%s.lcd", destpath, se->fname);
				//logf(bsd,"isize = %d, %s\n", OutIndex.NumEntries, path );
				if((flcd = open( path,
	            	             _O_RDWR|_O_CREAT|_O_BINARY|_O_TRUNC, 
	                     	     _S_IREAD|_S_IWRITE)) < 0)
				{
					//logf(bsd,"Failure to create output file\n    %s - aborting\n", path );
					return;
				}

				// write out place holder for finished index
				write(flcd, &OutIndex, (OutIndex.NumEntries * sizeof(IndexEntry)) + sizeof(int) );

				// align each buffer on DWORD boundry this will speed up the memcpy on reads 
				offset = lseek(flcd,0,SEEK_CUR);
				align = offset%sizeof(DWORD);
				if ( align ) 			
					write(flcd,zeros,align);

				continue;
			case -2:  	// end of lcd file
				if(flcd < 0)
					continue;

				// re-write finished index at head of file				
				lseek(flcd,0,SEEK_SET);
				write(flcd, &OutIndex, (OutIndex.NumEntries * sizeof(IndexEntry)) + sizeof(int) );

				close(flcd);
 				flcd = -1;
				continue;
			case -99:  // end of list
				if(flcd >= 0)
					close(flcd);
				break;
			default:
			{				
  		    UINT    		cbSize;         // Size of data.
			ULONG   		cSamples;
	        WAVEFORMATEX    *pwfxData;
	    	BYTE            *pbRawData;
// All wave file use the save format 
//
//   wFormatTag 		= 1
//   nChannels 			= 1
//   nSamplesPerSec 	= 15625
//   nAvgBytesPerSec 	= 31250
//   nBlockAlign 		= 2
//   wBitsPerSample 	= 16
//   cbSize 			= 0
//
WAVEFORMATEX  pwfx = { 1,1,15625,31250,2,16,0 };
char buffer[256];

				sprintf(path, "%s/%s.wav", sourcepath, se->fname);

				if (strstr(path, "tracks/TUNE_")) {
					sprintf(path, "%s/tracks/%s.wav", sourcepath, se->fname+12);					
				}
				
				//logf(bsd, "id = %d, %s\n", se->id, path );

    			pwfxData = NULL;      // to be safe
    			pbRawData = NULL;     // to be safe

				strlwr(path);

    			if (WaveLoadFile(path, &cbSize, &cSamples, &pwfxData, &pbRawData) != 0)
				{
					//logf(bsd,"  error loading %s\n", path);
					ixentry->size = 0;
					goto wave_done;
			 	}

				if ( pwfx.nSamplesPerSec != pwfxData->nSamplesPerSec )
				{
					sprintf(buffer,"Samples per secon no match %s [%d]\n\r",path, pwfxData->nSamplesPerSec);
//					sprintf(buffer,"copy %s ..\\temp \n\r",path, pwfxData->nSamplesPerSec);
					OutputDebugString(buffer);
				}

//				if ( pwfx.wBitsPerSample != pwfxData->wBitsPerSample )
//				{
//					sprintf(buffer,"Bits per sample no match %s\n\r",path);
//					OutputDebugString(buffer);
//				}

				// get offset, set index entry data and write record.
				ixentry->id     = se->id;
				ixentry->size   = cbSize;
				ixentry->offset = lseek(flcd,0,SEEK_CUR);
				ixentry->sampleRate = pwfxData->nSamplesPerSec;
				write(flcd,pbRawData,cbSize);

				// align each buffer on DWORD boundry this will speed up the memcpy on reads 
				offset = lseek(flcd,0,SEEK_CUR);
				align = offset%sizeof(DWORD);	
				if ( align ) 			
					write(flcd,zeros,align);

				//logf(bsd," size %d oset %d\n", ixentry->size, ixentry->offset);

			wave_done:

				if(pwfxData != NULL)
					GlobalFree(pwfxData);
				if(pbRawData != NULL)
					GlobalFree(pbRawData);

				++ixentry;

				continue;
			}
		}
		break;
	}
	return;
}
