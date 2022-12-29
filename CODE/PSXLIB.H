
typedef unsigned char u_byte;
typedef unsigned int u_long;
typedef unsigned short u_short;
typedef unsigned int u_int;

typedef struct 
{
	void* next;
	short x, y, w, h;
	short u, v, uw, vw;
	WORD clut, tpage;
	BYTE color[3],flags;
	WORD semialpha;
} POLY_F4, POLY_FT4, DR_MODE, BLK_FILL, SPRT;


typedef struct
{
	short x, y, w, h;
}RECT_PSX;

typedef struct
{
	int isbg;
}DRAWENV;

typedef struct
{
	int dummy;
}DISPENV;

typedef struct
{
	void* next;
}OTOBJ;


#define OTSIZE	250								/* size of ording table */

#define OBJPRIM_SIZE 220						/* # of drawing primitives per buffer */

#define BOXPRIM_SIZE 10							/* number of box prim to draw */

#define SCORE_RAM_CNT	22				/* # of sprites needed for the control panel */

#define CLUT_ID_SHIFT	4	//2									/* shift conversion factor id->palram index */


/* draw buffer primitive */
typedef struct {
	DRAWENV	draw;					/* draw environment */
	DISPENV disp;					/* display environment */
	OTOBJ ot[OTSIZE];				/* ordering table */
	OTOBJ* ot_ptr;					/* ordering table ptr */
	POLY_FT4 obj_prim[OBJPRIM_SIZE];	/* drawing primitives */
	POLY_FT4* curr_prim;
	BLK_FILL clear;
	LONG primcnt;

	DR_MODE	dm_score;						/* needed to change tpage during draw */
	SPRT cp[SCORE_RAM_CNT];

	DR_MODE dm_floor;						/* change tpage for floor */
	SPRT floor[2];							/* floor left/right buffers */

	POLY_F4	box_prim[BOXPRIM_SIZE];	/* used to draw box primitives */
	POLY_F4* box_ptr;

#if DEBUG_GRID
	LINE_F2 lines[22];
#endif
} DB;

void AddPrim(OTOBJ* optr, void* ptr);
void setXY4(POLY_FT4* p, int x, int y, int w, int h, int flip);

typedef struct
{
	int group,size,rate;
	BYTE* data;
}EMSOUNDOBJ;

#define MAX_SOUND_OBJS 1024

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

void Wav95_ReleaseWav(int id);
void Wav95_ReleaseWavAll();
void Win95_Load_LCD_File(const char* filename, int group, int flags);
void Win95_InitDirectSound();
void Win95_DeinitDirectSound();



