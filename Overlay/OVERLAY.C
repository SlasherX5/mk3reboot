#include <stdio.h>
#include <string.h>
#include "overlay.h"
#include <malloc.h>

#include <io.h>
#include <fcntl.h>

#define LONG long
#define ULONG unsigned int
#define SHORT short
#define USHORT unsigned short

#define ArrayCount(a) (sizeof(a)/sizeof(a[0]))
#define OPTR(p,o) ((unsigned char*)(p)+o)

void BuildFullPath(char* outpath, const char* subpath)
{
	strcpy(outpath, "D:/source_windows_final_7_29_96/Overlay/");
	strcat(outpath, subpath);
}

// buffer modes
enum {
	BM_NORMAL,
	BM_REVERSE,
	BM_ALLOCATE,
};

// build table of overlay "externals" to be plugged into "fixup" locations
// in the overlay file, this matches indices in ovlextrn.i through generated
// .i file

#define OVLEXTERN(sym) extern long sym;

	#include "ovlextrn.h"

#undef OVLEXTERN

#define OVLEXTERN(sym) (void *)&sym,

void *extern_table[] = {
	0
	//#include "ovlextrn.h"

};

#undef OVLEXTERN

static void close_overlay(Ovlfile *mfile);
static int read_overlay(Ovlfile *mfile,void *buf);
static int open_overlay(Ovlfile *mfile, char *path);

// open and read a relocatable executable module
				
static int open_overlay(Ovlfile *mfile, char *path)
{
OEXP_HDR ohdrs;	 /* Old .EXP header */
EXP_HDR *hdrsp;
int err;

    hdrsp = &mfile->exphdr;

	if((mfile->fileno = fopen(path,"rb")) == -1)
		goto io_error;
	if(fread(&ohdrs,1,sizeof(ohdrs), mfile->fileno) < sizeof(ohdrs))
		goto io_error;

	if (ohdrs.exe_sign != REX_OLD)
	{
		err = -1; // Err_file_not_rex;
		goto error;
	}

	/* we convert rex header to new style exp header the way pharlaps sample
	 * code does it */

	memset(hdrsp, 0, sizeof(EXP_HDR)); /* fill new header with zeros */

	/* file offset to load image */
	hdrsp->exp_ldimg = (ohdrs.exe_hsize) << 4;

	/* size of load image in bytes */
	hdrsp->exp_ldisize = ((ohdrs.exe_size)-1) * REX_BLK_SIZE +
		    		      (ohdrs.exe_szrem) - (hdrsp->exp_ldimg);

	/* File offset of relocation table */
	hdrsp->exp_rel = ohdrs.exe_reloff;

	/* Number of bytes in relocation table */
	hdrsp->exp_relsize = (ohdrs.exe_relcnt)*4;

	/* Minimum Data to allocate after load image */
	hdrsp->exp_minext = ohdrs.exe_minpg<<PAGE_SHIFT;

	/* Maximum Data to allocate after load image */
	hdrsp->exp_maxext = ohdrs.exe_maxpg<<PAGE_SHIFT;
	
	/* Initial EIP */
	hdrsp->exp_ieip = ohdrs.exe_eip;

	/* Initial ESP */
	hdrsp->exp_iesp = ohdrs.exe_esp;

	mfile->loadsize = (hdrsp->exp_minext) + (hdrsp->exp_ldisize);

	return(mfile->loadsize);
io_error:
	close_overlay(mfile);
	err = -1;
error:
	return(err);
}
static int read_overlay(Ovlfile *mfile,void *buf)
{
EXP_HDR *hdrsp = &mfile->exphdr;
ULONG load_size;	/* Size of memory to allocate to program code and data */
// LONG err;			/* Function return code */
ULONG *load_addr;	/* Address in which to load program */
ULONG rel_buf[128]; /* work area for relocation tables */
ULONG *rel_entry; 	/* Relocation entry value (offset to be relocated) */
ULONG *rel_max;
LONG relsize;		


	load_size = mfile->loadsize; // (hdrsp->exp_minext) + (hdrsp->exp_ldisize);
	load_addr = (ULONG *)buf;
	
	/* read code and initialized data in from file */

	if(fseek(mfile->fileno,hdrsp->exp_ldimg,SEEK_SET) < 0)
		goto error;
	if(fread(load_addr,hdrsp->exp_ldisize,1, mfile->fileno) < 0) // (long)hdrsp->exp_ldisize)
		goto error;

	/* clear part of module not containing file (uninitialized data) */

	memset(OPTR(load_addr,hdrsp->exp_ldisize),0,load_size - hdrsp->exp_ldisize);

	/* Now that the program is loaded in memory, we must relocate
	   all address that need relocation. The following loop does
	   this. Modified to read it in buffered chunks for speed. */

	if(fseek(mfile->fileno,hdrsp->exp_rel,SEEK_SET) < 0)
		goto error;
	
	relsize = sizeof(rel_buf);

	while(hdrsp->exp_relsize > 0)
	{
		if(hdrsp->exp_relsize < (unsigned long)relsize)
			relsize = hdrsp->exp_relsize;	

		if(fread(rel_buf,1, relsize, mfile->fileno) < relsize)
			goto error;

		hdrsp->exp_relsize -= relsize;
		rel_max = (ULONG *)OPTR(rel_buf,relsize);
		rel_entry = rel_buf;

		while(rel_entry < rel_max)
		{
		long rel_oset;

			if((rel_oset = *rel_entry) & REL32)
			{
			long *pfixup;
			long pfval;

                // this fixup method is changed to substitute indices which have been
				// coded into the software into pointers of 0 -> -sizeof(table).
				// we assume no pointers will represent items outside the overlay which are
				// not coded into the symbol table.

				rel_oset &= ~REL32;

				pfixup = (LONG *)OPTR(load_addr,rel_oset); 
				pfval = *pfixup;

				if(pfval <= 0 && pfval > -ArrayCount(extern_table))
                {				                
					*(void **)pfixup = extern_table[-pfval];
				}
				else
					*pfixup += *((ULONG*)&load_addr);

//				*((ULONG *)OPTR(load_addr,(*rel_entry&(~REL32)))) 
//											+= *((ULONG*)&load_addr);
			}
			else
			{
				*((USHORT *)OPTR(load_addr,rel_oset)) 
											+= (USHORT)*((ULONG*)&load_addr);
			}
			++rel_entry;
		}
	} /* end for loop */

	return(0);
error:
	return(-1);
}	
													  
static void close_overlay(Ovlfile *mfile)
{
 	if(mfile->fileno != -1)
		fclose(mfile->fileno);
	mfile->fileno = -1;
}

static int S_LoadOverlay(const char *subpath, void **pbuff, int buffmode)
{
Ovlfile ofile;
int err;
char *buff = NULL;
char Path[256];  // note called on "big stack"


	BuildFullPath(Path,subpath);


	if((err = open_overlay(&ofile,Path)) < 0)
		goto error;

	buff = (char *)(pbuff[0]);

	if(buffmode == BM_REVERSE)
	{
		// subtract and long align buffer size 
	 	buff -= ofile.loadsize;
		err = ((long)buff) & 0x03;	
		buff -= err;
		ofile.loadsize += err;
	}
	else if(buffmode == BM_ALLOCATE)
	{
		if((buff = malloc(ofile.loadsize)) == NULL)
			goto error;
	}

	if((err = read_overlay(&ofile,buff)) < 0)
		goto error;

	err = ofile.loadsize;
	goto done;
error:
	if(buffmode == BM_ALLOCATE && buff)
	{
		free(buff);
		buff = NULL;
	}
done:
	close_overlay(&ofile);
	pbuff[0] = buff;
    return(err);
}

static int S_SizeOverlay(const char *fname)
{
	FILE* fileno;
	int size;
	char Path[256];  // note called on big stack

	BuildFullPath(Path,fname);

	fileno = fopen(Path,"rb");
	if (fileno == 0 || fileno < 0 )
		return 0;

	fseek(fileno, 0, SEEK_END);
	size = ftell(fileno);
	fclose(fileno);
	return size;
}

//**********************************************************
// Entry functions 

int LoadOverlay(const char* path, void* buff)
{
	return S_LoadOverlay(path, & buff, BM_NORMAL);
}

int SizeOverlay(const char *fname)
{
	return S_SizeOverlay(fname);
}


void unsonyRLE(BYTE*, BYTE**);
void expand_simpleRLE(BYTE*, BYTE**);
void unbetterSimpleRLE(BYTE* src, BYTE** dst);

/******************************************************************************
 Function: BYTE *uncompress_image(BYTE *src)

 By: David Schwartz

 Date: Jan 1995

 Parameters: src - src address compressed image

			 Each image has a 32 bit header:
				bits [31..24] = compression type (0=None, 1=64 RLE, 2=256 RLE)
				bits [23..0] = # of bytes in src compress data + 4 bytes for header

 Returns: dest - dest decompression buffer area

 Description:	This routine will uncompress data via the correct routine.  The results
				will be dumped to the current decompress buffer
******************************************************************************/
BYTE* uncompress_image(BYTE* src, BYTE* idcomp_ptr)
{
	BYTE* dest;
	BYTE* start;
	WORD i;

	switch (((*((LONG*)src)) >> 24) & 0x3f)
	{
	case 0:		// no compression
		start = src + sizeof(LONG);
		break;
	case 1:		// 64 color comp
		start = dest = (BYTE*)idcomp_ptr;
		unsonyRLE(src, &dest);
		idcomp_ptr = (LONG*)(((LONG)(dest + 3)) & (~3));
		break;
	case 2:		// 256 color comp
		start = dest = (BYTE*)idcomp_ptr;
		expand_simpleRLE(src, &dest);
		idcomp_ptr = (LONG*)(((LONG)(dest + 3)) & (~3));
		break;
	case 3:
		start = dest = (BYTE*)idcomp_ptr;
		unbetterSimpleRLE(src, &dest);
		idcomp_ptr = (LONG*)(((LONG)(dest + 3)) & (~3));
		break;
	}

	return(start);
}

/******************************************************************************
 Function: void unsonyRLE(BYTE *src, BYTE **dst)

 By: David Schwartz

 Date: Jan 1995

 Parameters: src - src address compressed image
			 dest - ptr to dest decompression buffer area

 Returns: None

 Description:	This routine will uncompression a src image into a decomp buffer (256 color)
******************************************************************************/
void expand_simpleRLE(BYTE* src, BYTE** dst)
{
	int i;
	signed char* s, * d, ch;
	long srcBytes;

	s = (signed char*)src + sizeof(long);
	d = (signed char*)(*dst);
	srcBytes = (*(long*)src & 0x00FFFFFF) - sizeof(long);
	while (srcBytes > 0)
		if ((i = *s++) < 0)
		{               					/* if < 0 then zero based count */
			ch = *s++;                      /* byte to be repeated */
			for (srcBytes -= 2; i <= 0; i++)
				*d++ = ch;
		}
		else
			for (srcBytes -= i + 2; i >= 0; i--)
				*d++ = *s++;                /* zero based bytes of data */

	*dst = d;
}  /* expand_simpleRLE */

/******************************************************************************
 Function: void unsonyRLE(BYTE *src, BYTE **dst)

 By: David Schwartz

 Date: Jan 1995

 Parameters: src - src address compressed image
			 dest - ptr to dest decompression buffer area

 Returns: None

 Description:	This routine will uncompression a src image into a decomp buffer (64 color)
******************************************************************************/
void unsonyRLE(BYTE* src, BYTE** dst)
{
	short someshort;
	long Lrunlen;
	int complete, partial;
	BYTE* packdata, * packlen;
	WORD* buffer;

	packdata = src;
	packlen = packdata + (*((long*)packdata) & 0x00FFFFFF);
	buffer = (WORD*)(*dst);

	for (packdata += 4; packdata < packlen; ) {
		someshort = *(((WORD*)packdata)++);

		if (someshort & 0x8000) {
			Lrunlen = someshort & 0x01FF;
			someshort &= 0x7E00;
			someshort = (someshort >> 1) | (someshort >> 9);
			complete = Lrunlen >> 6;
			partial = Lrunlen & 63;

			if (!partial) {
				partial = 64;
				complete--;
			}

			int count = (partial >> 1);

			for (size_t i = 0; i < count; i++)
			{
				*(((WORD*)buffer)++) = someshort;
			}

			while (complete--) {
				for (size_t i = 0; i < 32; i++){
					*(((WORD*)buffer)++) = someshort;
				}				
			}

		}
		else *(((WORD*)buffer)++) = someshort;
	}

	*dst = (BYTE*)buffer;
}  /* unsonyRLE */

/******************************************************************************
 Function: void unbetterSimpleRLE(BYTE *src, BYTE **dst)

 By: David Schwartz

 Date: Jan 1995

 Parameters: src - src address compressed image
			 dest - ptr to dest decompression buffer area

 Returns: None

 Description:	This routine will uncompression a src image into a decomp buffer (64 color)
******************************************************************************/

#define NEXTBYTE(var)   \
switch (state++) {      \
	case 0:                                     \
		c1 = *src++;                            \
		c2 = *src++;                            \
		c3 = *src++;                            \
		var = c1 >> 2;                          \
		break;                                  \
	case 1:                                     \
		var = (c2 >> 4) | ((c1 << 4) & 0x30);   \
		break;                                  \
	case 2:                                     \
		var = ((c2 << 2) & 0x3C) | (c3 >> 6);   \
		break;                                  \
	case 3:                                     \
		var = c3 & 0x3F;                        \
		state = 0;                              \
		break;                                  \
}

void unbetterSimpleRLE(BYTE* src, BYTE** dst)
{
	int i, state;
	BYTE ch, c1, c2, c3;
	long srcBytes;
	BYTE* buffer;

	srcBytes = (*(long*)src & 0x00FFFFFF) - (sizeof(long));
	srcBytes = srcBytes + (srcBytes / 3) - (src[3] >> 6);
	src += sizeof(long);
	buffer = *dst;
	state = 0;
	while (srcBytes > 0)
	{
		NEXTBYTE(i);
		if (i < 32)
		{                       			/* if < 32 then zero based count */
			NEXTBYTE(ch);                   /* byte to be repeated */
			for (srcBytes -= 2; i >= 0; i--)
				*buffer++ = ch;
		}
		else
		{
			i -= 32;
			for (srcBytes -= i + 2; i >= 0; i--)
				NEXTBYTE(*buffer++);           /* zero based bytes of data */
		}
	}

	*dst = buffer;
}  /* unbetterSimpleRLE */

