	;CNOP 0, 4
titlemodBMOD:
	DW   271,   219
	DD     2, titlemod_BLK, titlepg_HDR, _titlepg_CLT

	;CNOP 0, 4
titlemod_BLK:
	DW     7,     6,    64, 00000H,     0
	DW    11,   109,    64, 00000H,     1

	;CNOP 0, 4
titlepg_HDR:
	DW     0,     1,     1,   252,   103
	DW     0,     1,   104,   252,   103
