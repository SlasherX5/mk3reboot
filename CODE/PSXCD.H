    /*------------------------------------------------------------------*/
    /*
                     Sony CD Architecture Specific Routines
                            by Scott Patterson
                                7/6/95
    */
    /*------------------------------------------------------------------*/

#ifndef _PSXCD_H
#define _PSXCD_H

    /*
        The following functions will pause for a short CD volume fade if
        the CD volume is not zero (and _CD_SPU_LINK_ == 1):

        psxcd_async_read()
        psxcd_read()
        psxcd_stop()
        psxcd_pause()

        To asyncronously fade the CD volume beforehand so these functions
        will not have any delays see comments in "psxspu.h"
    */

#include <sys/types.h>
///#include <libcd.h>

//WIN95: Set all of these to zero 
#define _CD_VERSION_  0
#define _CD_SPU_LINK_ 0
#define _CD_ABS_OPEN_ 0

#define PSXCD_SEEK_SET    0
#define PSXCD_SEEK_CUR    1
#define PSXCD_SEEK_END    2

#if _CD_VERSION_ == 0
///#include <libsn.h>
#endif

typedef struct PsxCd_File {
    ///CdlFILE       file;
    ///CdlLOC        new_io_loc;
    unsigned long io_block_offset;
    unsigned char io_result[8];
}PsxCd_File;

#if _CD_ABS_OPEN_ == 1

typedef struct PsxCd_MapTbl {
    int           abs;
    u_long        size;
}PsxCd_MapTbl;

extern PsxCd_MapTbl cdmaptbl[];

#endif

// CD-data read stuff
#define CD_ROM_SECTOR_SIZE 2048
#define SECTORS_PER_SECOND 75
#define SECONDS_PER_MINUTE 60

/*
    Asyncronous read function: psxcd_async_on()

    is non-zero during asyncronous reading

    to code an asyncronous read:

    psxcd_async_read(destptr,readbytes,fileptr);

    // do your other shit here
    // (don't mess with the RAM you are reading to!)

    // to check for completion
    if(!psxcd_async_on())
    {
        // psxcd_async_read is complete
    }

    // to wait for completion:
    while(psxcd_async_on()); // wait for completion of psxcd_async_read
*/

extern int           psxcd_async_on(void);

/*
    CD-DA play seek variable: seeking_for_play

    after psxcd_seek_for_play(track) call is made

    this variable is non-zero until seeking is done
*/

extern int           psxcd_seeking_for_play(void);

/*
    CD-DA play stop/pause variable: waiting_for_pause

    after psxcd_stop/psxcd_pause call is made

    this variable is non-zero until pause operation is done
*/

extern int           psxcd_waiting_for_pause(void);

extern int           cdl_insetmode;
extern int           cdl_intr;
extern unsigned char cdl_stat;
extern unsigned char cdl_com;

extern int           cdl_errcount;
extern int           cdl_errintr;
extern unsigned char cdl_errstat;
extern unsigned char cdl_errcom;
extern int readcount;
extern int playcount;


// PSX CD-AUDIO commands

extern void psxcd_stop(void);

extern void psxcd_pause(void);

extern void psxcd_restart(int vol);

int psxcd_elapsed_sectors(void);


#endif

