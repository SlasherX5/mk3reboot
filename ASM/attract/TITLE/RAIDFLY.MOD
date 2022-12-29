	;CNOP 0, 4
raid2modBMOD:
	DW   317,   237
	DD     3, raid2mod_BLK, raidfly_HDR, _raidfly_CLT

	;CNOP 0, 4
raid2mod_BLK:
	DW    14,     8,    64, 00000H,     1
	DW    14,   115,    64, 00000H,     0
	DW   140,    16,    64, 00200H,     2

	;CNOP 0, 4
raidfly_HDR:
	DW     4,     1,     1,   124,   111
	DW     4,   125,     1,   124,   107
	DW     2,     1,     1,   160,   205
