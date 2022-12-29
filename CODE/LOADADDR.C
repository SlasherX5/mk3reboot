/******************************************************************************
; File: heaparea.s
;
; By: David Schwartz
;
; Date: Mar 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Main Heap Area (Overlay Area)

	opt c+

main_ovl group
	section	.text_main

	xdef	player_heap

	;player_heap 	dsb	1140000 	; define heap area
player_heap 	dsb	494500*2 	; define heap area

/***************************************************
 File: LOADADDR.S
  
	opt c+

	section	.text
	xdef	check_start
	xdef	check_end
check_start dw sect(.text)

	section	.data
check_end		dw sect(.data)

l0	group
	section .text

	xdef	level_loadaddr
level_loadaddr	dw group(l0)

p0	group
	section	.text

	xdef	palette_loadaddr
palette_loadaddr	dw $80010000				;-DHS- this is a hack because we could
												; not figure out why the damn linker wouldnt
												; put the correct address when we used group(p0)
f0 group
 	section	.text

	xdef	fightint_loadaddr
fightint_loadaddr dw group(f0)

main_ovl group
	section .text

	xdef pheap_loadaddr
pheap_loadaddr	dw	group(main_ovl)

*********************/
#include "win_port.h"
#include "loadaddr.h"

//WIN95: Used only by check sum
//void*check_start;
//void*check_end;

#pragma data_seg( "PLAYER_HEAP", "DATA" )

#ifndef BLOCK_MEMOVERFLOW_CHECK
int pheap_beginmark = 0xFFFFFFFF;
#endif

unsigned char player_heap[494500*2];

#ifndef BLOCK_MEMOVERFLOW_CHECK
int pheap_endmark   = 0xFFFFFFFF;
#endif

char*pheap_loadaddr = (char*)player_heap;
char*level_loadaddr;
void*palette_loadaddr;
void*fightint_loadaddr;

//WIN95: The folowing are additional load addresses to  
//       conpesate for the removal of the Overlay system.
// Load address of current bkgd_texture
char*bkgd_texture_loadaddr;
char*permanent_art_loadaddr0;


