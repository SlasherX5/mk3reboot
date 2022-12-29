#include "win_port.h"
///#include <winddsnd.h>

#include "system.h"
#include "psxlib.h"
#include "psxcd.h"
#include "psxsnd.h"
#include "mk3snd.h"

EMSOUNDOBJ sndobj[MAX_SOUND_OBJS] = { 0 };

#define GENERALGRP  0x00000001
#define FIGHTER1GRP 0x00000002
#define FIGHTER2GRP 0x00000004
#define LOGO		0x00000008

typedef const char* LcdList;

LcdList lcdfightlist_arr[] = {
    {"KANO\\KANO.LCD"          },
    {"SONYA\\SONYA.LCD"        },
    {"JAX\\JAX.LCD"           },
    {"INDIAN\\INDIAN.LCD"      },
    {"SUBZERO\\SUBZERO.LCD"    },
    {"SWAT\\SWAT.LCD"          },
    {"LIA\\LIA.LCD"            },
    {"ROBO1\\ROBO1.LCD"        },
    {"ROBO2\\ROBO2.LCD"        },
    {"LAO\\KUNGLAO.LCD"        },
    {"TUSK\\TUSK.LCD"          },
    {"SHEEVA\\SHEEVA.LCD"      },
    {"SHANG\\SHANG.LCD"        },
    {"LKANG\\LIUKANG.LCD"      },
    {"ROBO3\\SMOKE.LCD"        },
    {"MOTARO\\MOTARO.LCD"      },
    {"SHAOKAHN\\SKFIGHT.LCD"   },
    {"KANO\\NOOB.LCD"          },
    {0},
    {0},
    {0}
};

LcdList lcdbaballist_arr[] = {
    {"KANO\\BKANO.LCD"         },
    {"SONYA\\BSONYA.LCD"       },
    {"JAX\\BJAX.LCD"           },
    {"INDIAN\\BINDIAN.LCD"     },
    {"SUBZERO\\BSUBZERO.LCD"   },
    {"SWAT\\BSWAT.LCD"         },
    {"LIA\\BLIA.LCD"           },
    {"ROBO1\\BROBO1.LCD"       },
    {"ROBO2\\BROBO2.LCD"       },
    {"LAO\\BKUNGLAO.LCD"       },
    {"TUSK\\BTUSK.LCD"         },
    {"SHEEVA\\BSHEEVA.LCD"     },
    {"SHANG\\BSHANG.LCD"       },
    {"LKANG\\BLIUKANG.LCD"     },
    {"ROBO3\\BSMOKE.LCD"       },
    {0},
    {0},
    {0},
    {0}
};

LcdList lcdanimalist_arr[] = {
    {"KANO\\AKANO.LCD"         },
    {"SONYA\\ASONYA.LCD"       },
    {"JAX\\AJAX.LCD"           },
    {"INDIAN\\AINDIAN.LCD"     },
    {"SUBZERO\\ASUBZERO.LCD"   },
    {"SWAT\\ASWAT.LCD"         },
    {"LIA\\ALIA.LCD"           },
    {"ROBO1\\AROBO1.LCD"       },
    {"ROBO2\\AROBO2.LCD"       },
    {"LAO\\AKUNGLAO.LCD"       },
    {"TUSK\\ATUSK.LCD"         },
    {"SHEEVA\\ASHEEVA.LCD"     },
    {"SHANG\\ASHANG.LCD"       },
    {"LKANG\\ALIUKANG.LCD"     },
    {"ROBO3\\ASMOKE.LCD"       },
    {0},
    {0},
    {0},
    {0}
};

LcdList lcdfatallist_arr[] = {
    {"KANO\\FKANO.LCD"         },
    {"SONYA\\FSONYA.LCD"       },
    {"JAX\\FJAX.LCD"           },
    {"INDIAN\\FINDIAN.LCD"     },
    {"SUBZERO\\FSUBZERO.LCD"   },
    {"SWAT\\FSWAT.LCD"         },
    {"LIA\\FLIA.LCD"           },
    {"ROBO1\\FROBO1.LCD"       },
    {"ROBO2\\FROBO2.LCD"       },
    {"LAO\\FKUNGLAO.LCD"       },
    {"TUSK\\FTUSK.LCD"         },
    {"SHEEVA\\FSHEEVA.LCD"     },
    {"SHANG\\FSHANG.LCD"       },
    {"LKANG\\FLIUKANG.LCD"     },
    {"ROBO3\\FSMOKE.LCD"       },
    {0},
    {0},
    {0},
    {0}
};

LcdList lcddatalist_arr[] = {
    {"SNDDATA\\SELECT.LCD"     },
    {"SNDDATA\\HIDGAME.LCD"    },
    {"SNDDATA\\RAND.LCD"       },
    {"SNDDATA\\SMOKECOD.LCD"   },
    {"SNDDATA\\LADDER.LCD"     },
    {"SNDDATA\\GAMEOVER.LCD"   },
    {"SNDDATA\\BUYIN.LCD"      },
    {"SNDDATA\\VS.LCD"         },
    {"SNDDATA\\SKSPCIAL.LCD"   },
    {"SNDDATA\\SKPIT.LCD"      },
    {"SNDDATA\\SKBANK.LCD"     },
    {"SNDDATA\\SKTRAIN.LCD"    },
    {"SNDDATA\\SKSTREET.LCD"   },
    {"SNDDATA\\SKBRIDGE.LCD"   },
    {"SNDDATA\\SKBANK.LCD"     },
    {"SNDDATA\\SKROOF.LCD"     },
    {"SNDDATA\\SKSOUL.LCD"     },
    {"SNDDATA\\SKCHURCH.LCD"   },
    {"SNDDATA\\SKGRAVE.LCD"    },
    {"SNDDATA\\SKHID.LCD"      },
    {"SNDDATA\\WIN95GLB.LCD"   },
    {"SNDDATA\\LOGO.LCD"   	   },
    {0}
};

LcdList lcddatalist2_arr[] = {
    {0},
    {0},
    {0},
    {0},
    {0},
    {0},
    {0},
    {0},
    {0},
    {"SNDDATA\\TUNE_PIT.LCD"      },
    {"SNDDATA\\TUNE_SLOW.LCD"     },
    {"SNDDATA\\TUNE_TRAIN.LCD"    },
    {"SNDDATA\\TUNE_OLD.LCD"      },
    {"SNDDATA\\TUNE_WACKER.LCD"   },
    {"SNDDATA\\TUNE_SLOW.LCD"     },
    {"SNDDATA\\TUNE_COOLT.LCD"    },
    {"SNDDATA\\TUNE_TONG.LCD"     },
    {"SNDDATA\\TUNE_CHURCH.LCD"   },
    {"SNDDATA\\TUNE_GRAVE.LCD"    },
    {0},
    {0},
    {0},
    {0}
};

void DoSoundBlockClear(unsigned long sampblk)
{
    /*
    int numtochk = MAX_SOUND_OBJS;

    while(numtochk)
    {
        numtochk--;

		// Remove this grop ID 
		sndobj[numtochk].group &= ~sampblk;

		// Some one want to keep this sound
		if ( !sndobj[numtochk].group && sndobj[numtochk].data )
		{
			// Delete the buffer 
			 Wav95_ReleaseWav( numtochk );
		}
    }*/
}

void PsxSoundLoadClear(void)
{				
	 Wav95_ReleaseWavAll();
}

void PsxSoundLoadLogo()
{
	Win95_Load_LCD_File( "SNDDATA\\LOGO.LCD", LOGO, FALSE );
}

void PsxSoundLoadDataLoadPerm(int lcdnum)
{
	Win95_Load_LCD_File( lcddatalist_arr[lcdnum], GENERALGRP, TRUE );
}

void PsxSoundLoadData(int lcdnum)
{
	Win95_Load_LCD_File( lcddatalist_arr[lcdnum], GENERALGRP, FALSE );
    if (lcddatalist2_arr[lcdnum]) {
        Win95_Load_LCD_File(lcddatalist2_arr[lcdnum], GENERALGRP, FALSE);
    }
}

extern WORD p1_version,p2_version;
							 		
void PsxSoundLoadFighter1(int lcdnum)
{
    DoSoundBlockClear(FIGHTER1GRP);
	Win95_Load_LCD_File( lcdfightlist_arr[lcdnum], FIGHTER1GRP, FALSE);
}

void PsxSoundLoadFighter2(int lcdnum)
{
    DoSoundBlockClear(FIGHTER2GRP);
	Win95_Load_LCD_File(lcdfightlist_arr[lcdnum], FIGHTER2GRP, FALSE  );
}

void PsxSoundLoadFighter1Babality(int lcdnum)
{
    DoSoundBlockClear(FIGHTER1GRP);
	Win95_Load_LCD_File( lcdbaballist_arr[lcdnum], FIGHTER1GRP, FALSE  );
}

void PsxSoundLoadFighter2Babality(int lcdnum)
{
    DoSoundBlockClear(FIGHTER2GRP);
	Win95_Load_LCD_File( lcdbaballist_arr[lcdnum], FIGHTER2GRP, FALSE  );
}

void PsxSoundLoadFighter1Animality(int lcdnum)
{
    DoSoundBlockClear(FIGHTER1GRP);
	Win95_Load_LCD_File( lcdanimalist_arr[lcdnum], FIGHTER1GRP, FALSE  );
}

void PsxSoundLoadFighter2Animality(int lcdnum)
{
    DoSoundBlockClear(FIGHTER2GRP);
	Win95_Load_LCD_File( lcdanimalist_arr[lcdnum], FIGHTER2GRP, FALSE  );
}

void PsxSoundLoadFighter1Fatality(int lcdnum)
{
    DoSoundBlockClear(FIGHTER1GRP);
	Win95_Load_LCD_File( lcdfatallist_arr[lcdnum], FIGHTER1GRP, FALSE  );
}

void PsxSoundLoadFighter2Fatality(int lcdnum)
{
    DoSoundBlockClear(FIGHTER2GRP);
	Win95_Load_LCD_File( lcdfatallist_arr[lcdnum], FIGHTER2GRP, FALSE );
}

unsigned long PsxSoundInit(char *ptrtowmd)
{
	// Initalize Direct Sound 
	Win95_InitDirectSound();
    PsxSoundLoadData(SOUNDLOADDATA_WIN95GLOB);
	return(0);
}

void PsxSoundExit(void)
{
	// Cleanup Direct Sound
	Win95_DeinitDirectSound();
	return;
}


