#include <stdio.h>
#include "stdstuff.h"
#include <string.h>
#include "overlay.h"
#include <malloc.h>

#include <io.h>
#include <fcntl.h>

#include "bigstack.h"

#define LONG long
#define ULONG u_long
#define SHORT short
#define USHORT u_short

void BuildFullPath(char *outpath, char *subpath);

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

	if((mfile->fileno = open(path,O_RDONLY|O_BINARY)) == -1)
		goto io_error;
	if(read(mfile->fileno, &ohdrs, sizeof(ohdrs)) < sizeof(ohdrs))
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

	if(lseek(mfile->fileno,hdrsp->exp_ldimg,SEEK_SET) < 0)
		goto error;
	if(read(mfile->fileno,load_addr,hdrsp->exp_ldisize) < 0) // (long)hdrsp->exp_ldisize)
		goto error;

	/* clear part of module not containing file (uninitialized data) */

	memset(OPTR(load_addr,hdrsp->exp_ldisize),0,load_size - hdrsp->exp_ldisize);

	/* Now that the program is loaded in memory, we must relocate
	   all address that need relocation. The following loop does
	   this. Modified to read it in buffered chunks for speed. */

	if(lseek(mfile->fileno,hdrsp->exp_rel,SEEK_SET) < 0)
		goto error;
	
	relsize = sizeof(rel_buf);

	while(hdrsp->exp_relsize > 0)
	{
		if(hdrsp->exp_relsize < (u_long)relsize)
			relsize = hdrsp->exp_relsize;	

		if(read(mfile->fileno, rel_buf, relsize) < relsize) 
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
		close(mfile->fileno);
	mfile->fileno = -1;
}

static int _LoadOverlay(char *subpath, void **pbuff, int buffmode)
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

static int _SizeOverlay(char *fname)
{
int fileno;
int size;
char Path[256];  // note called on big stack

	BuildFullPath(Path,fname);

	fileno = open(Path,O_RDONLY|O_BINARY);
	if ( fileno == -1 )
		return 0;

	size = lseek(fileno, 0, 2);
	close(fileno);
	return size;
}

//**********************************************************
// Entry functions 

void psxcd_stop(void);
int LoadOverlay(char *path, void *buff)
{
	psxcd_stop();
	return(CallOnBigStack(_LoadOverlay,path,&buff,BM_NORMAL));
}
int LoadOverlayBelow(char *path, void *buff)
{
	psxcd_stop();
	return(CallOnBigStack(_LoadOverlay,path,&buff,BM_REVERSE));
}
int AllocLoadOverlay(char *path, void **pbuff)
{
	return(CallOnBigStack(_LoadOverlay,path,pbuff,BM_ALLOCATE));
}
void FreeOverlay(void **pbuff)
{
 	if(*pbuff)
	{
		free(*pbuff);
		*pbuff = NULL;
	}
	return;
}
int SizeOverlay(char *fname)
{
	return(CallOnBigStack(_SizeOverlay, fname));
}


