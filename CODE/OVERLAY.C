
#pragma warning(disable:4703;disable:4996;disable:4146)

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
	//strcpy(outpath, "D:/source_windows_final_7_29_96/Overlay/");
	strcpy(outpath, subpath);
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
	0,
	#include "ovlextrn.h"

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
					*(void **)pfixup = extern_table[-pfval+1];
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
 	if(mfile->fileno && mfile->fileno != -1)
		fclose(mfile->fileno);
	mfile->fileno = -1;
}

int S_LoadOverlay(const char *fname, void **pbuff, int buffmode)
{
 	if (fname[0] == -1) {
 		int bsize = *(int*)(fname + 4);
		memcpy(pbuff[0], fname + 8, bsize);
		return bsize;
	}

	Ovlfile ofile;
	int err;
	char *buff = NULL;
	char Path[256];  // note called on "big stack"

	BuildFullPath(Path, fname);

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

int SizeOverlay(const char *fname)
{
	if (fname[0] == -1) {
		return *(int*)(fname + 4);
	}

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
