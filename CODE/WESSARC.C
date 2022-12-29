    /*------------------------------------------------------------------*/
    /*
                     The Williams Entertainment Sound System
                     Sony Architecture Specific Routines
                            by Scott Patterson
    */
    /*------------------------------------------------------------------*/

#include "win_port.h"


#define BLOCK_SOUND_WESS
#ifndef BLOCK_SOUND_WESS


#include "kernel.h"
#include <libspu.h>


//undeclared SONY prototypes
//WIN95:extern void EnterCriticalSection(void);
//WIN95:extern void ExitCriticalSection(void);
extern long EnableEvent(unsigned long event);
extern long DisableEvent(unsigned long event);
extern long OpenEvent(unsigned long desc,long spec,long mode,long (*func)(void));
extern long CloseEvent(unsigned long event);
extern long SetRCnt(unsigned long spec,unsigned long target,long mode);
extern long StartRCnt(unsigned long spec);

//#include "wessarc.h"
//#include "wessseq.h"

#include "psxspu.h"
#include "psxcd.h"
void (**CmdFuncArr[10])(track_status *) = {
    DrvFunctions,
    drv_cmds,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions,
    DrvFunctions
    };

short         GetIntsPerSec(void);
unsigned long CalcPartsPerInt(short ips,short ppq,short qpm);
static long WessInterruptHandler(void);

int SeqOn = 0;
unsigned long millicount = 0;

int WessTimerActive = 0;

int                     T2counter = 0;
static unsigned long    EV2 = 0;                /* interrupt event var */

// module loader stuff

static Wess_File_IO_Struct module_fileref;

// data loader stuff

static unsigned long addr;
static unsigned long size;

#define MALLOC_MAX 1
char spu_malloc_rec [SPU_MALLOC_RECSIZ * (MALLOC_MAX + 1)];

static Wess_Data_IO_Struct data_fileref;

// sram transfer stuff

#define CHUNKSIZE 2048

static char chunk[CHUNKSIZE];

#define SRAM_TO_ALLOC 520192

// while I thought end of sram should be 524288, it seems to be 520192
#define END_O_SRAM 520192

short GetIntsPerSec(void)
{
    return(120);
}

unsigned long CalcPartsPerInt(short ips,short ppq,short qpm)
{
    unsigned long ppi;
	ppi = ((((unsigned long)qpm*0x10000)+((unsigned long)ips*30)+30)/((unsigned long)ips*60))*(unsigned long)ppq;
	return(ppi);
}

static long WessInterruptHandler(void)
{
    T2counter++;
    psxspu_fadeengine();
    if(SeqOn)
    {
        SeqEngine();
    }
    return(0);
}

void init_WessTimer(void)
{
    EnterCriticalSection_PSX();

    EV2 = OpenEvent(RCntCNT2, EvSpINT, EvMdINTR, WessInterruptHandler);
    EnableEvent(EV2);
    SetRCnt(RCntCNT2, 34722, RCntMdINTR);   /* 33038 is ~120 Hz */
    StartRCnt(RCntCNT2);

    WessTimerActive = 1;

    ExitCriticalSection_PSX();
}

void exit_WessTimer(void)
{
    EnterCriticalSection();

    WessTimerActive = 0;

    DisableEvent(EV2);
    CloseEvent(EV2);

    ExitCriticalSection();
}

static SpuReverbAttr rev_attr;

int Wess_init_for_LoadFileData(char *filename)
{
    SpuInitMalloc (MALLOC_MAX, spu_malloc_rec);
    rev_attr.mask = SPU_REV_MODE;
    rev_attr.mode = SPU_REV_MODE_OFF;
    SpuSetReverbModeParam (&rev_attr);
    SpuSetReverbVoice (SpuOff, SPU_ALLCH);
    SpuReserveReverbWorkArea(SpuOff);
    SpuSetReverb (SpuOff);
    SpuMalloc (520192);
    SpuSetTransMode (SpuTransferByDMA);
    return(1);
}

#if _CD_VERSION_ == 1

/**********************************************************************
    CD routines
    CD routines
    CD routines
***********************************************************************/

Wess_File_IO_Struct *module_open(char *filename)
{
    Wess_File_IO_Struct *fp;

    fp = psxcd_open(filename);

    module_fileref = *fp;

    return(&module_fileref);
}

int module_read(void *destptr,int readbytes,Wess_File_IO_Struct *fileptr)
{
    return(psxcd_read(destptr,readbytes,fileptr));
}

int module_seek(Wess_File_IO_Struct *fileptr,int seekpos,int seekmode)
{
    return(psxcd_seek(fileptr,seekpos,seekmode));
}

unsigned long module_tell(Wess_File_IO_Struct *fileptr)
{
    return(psxcd_tell(fileptr));
}

void module_close(Wess_File_IO_Struct *fileptr)
{
    psxcd_close(fileptr);
}

int get_num_Wess_Sound_Drivers(int **settings_tag_lists)
{
    return(1);
}

Wess_Data_IO_Struct *data_open(char *filename)
{
    Wess_File_IO_Struct *fp;

    fp = psxcd_open(filename);

    data_fileref = *fp;

    return(&data_fileref);
}

int data_read(Wess_Data_IO_Struct *fileptr,void *destptr,int readbytes,int filepos)
{
    int totaltogo;
    unsigned long spuptr;

    totaltogo = readbytes;
    spuptr = (unsigned long)destptr;

    if((END_O_SRAM - spuptr)<readbytes)
    {
        return(0);
    }

    psxcd_seek(fileptr, filepos, SEEK_SET);

    while(CHUNKSIZE<=totaltogo)
    {
        psxcd_read(chunk, CHUNKSIZE, fileptr);
        addr = SpuSetTransferStartAddr (spuptr);
        size = SpuWrite (chunk, CHUNKSIZE);

        totaltogo -= CHUNKSIZE;
        spuptr += CHUNKSIZE;

        SpuIsTransferCompleted (SPU_TRANSFER_WAIT);
    }
    if(totaltogo)
    {
        psxcd_read(chunk, totaltogo, fileptr);
        addr = SpuSetTransferStartAddr (spuptr);
        size = SpuWrite (chunk, totaltogo);

        totaltogo -= totaltogo;
        spuptr += totaltogo;

        SpuIsTransferCompleted (SPU_TRANSFER_WAIT);
    }

    return(readbytes);
}

void data_close(Wess_Data_IO_Struct *fileptr)
{
    psxcd_close(fileptr);
}

#else

/**********************************************************************
    PC read routines
    PC read routines
    PC read routines
***********************************************************************/

Wess_File_IO_Struct *module_open(char *filename)
{
    module_fileref = PCopen(filename,0,0);
    return(&module_fileref);
}

int module_read(void *destptr,int readbytes,Wess_File_IO_Struct *fileptr)
{
    return(PCread(*fileptr, destptr, readbytes));
}

int module_seek(Wess_File_IO_Struct *fileptr,int seekpos,int seekmode)
{
    PClseek(*fileptr, seekpos, seekmode);
    return(0);
}

unsigned long module_tell(Wess_File_IO_Struct *fileptr)
{
    return(PClseek(*fileptr, 0, SEEK_CUR));
}

void module_close(Wess_File_IO_Struct *fileptr)
{
    PCclose(*fileptr);
}

int get_num_Wess_Sound_Drivers(int **settings_tag_lists)
{
    return(1);
}

Wess_Data_IO_Struct *data_open(char *filename)
{
    data_fileref = PCopen(filename,0,0);
    return(&data_fileref);
}

int data_read(Wess_Data_IO_Struct *fileptr,void *destptr,int readbytes,int filepos)
{
    int totaltogo;
    unsigned long spuptr;

    totaltogo = readbytes;
    spuptr = (unsigned long)destptr;

    if((END_O_SRAM - spuptr)<readbytes)
    {
        return(0);
    }

    PClseek(*fileptr, filepos, SEEK_SET);

    while(CHUNKSIZE<=totaltogo)
    {
        PCread(*fileptr, chunk, CHUNKSIZE);
        addr = SpuSetTransferStartAddr (spuptr);
        size = SpuWrite (chunk, CHUNKSIZE);

        totaltogo -= CHUNKSIZE;
        spuptr += CHUNKSIZE;

        SpuIsTransferCompleted (SPU_TRANSFER_WAIT);
    }
    if(totaltogo)
    {
        PCread(*fileptr, chunk, totaltogo);
        addr = SpuSetTransferStartAddr (spuptr);
        size = SpuWrite (chunk, totaltogo);

        totaltogo -= totaltogo;
        spuptr += totaltogo;

        SpuIsTransferCompleted (SPU_TRANSFER_WAIT);
    }

    return(readbytes);
}

void data_close(Wess_Data_IO_Struct *fileptr)
{
    PCclose(*fileptr);
}

#endif

#endif // BLOCK_SOUND_WESS
