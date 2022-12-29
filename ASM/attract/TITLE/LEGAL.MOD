	;CNOP 0, 4
legalmodBMOD:
	DW   337,   249
	DD     4, legalmod_BLK, legal_HDR, _legal_CLT

	;CNOP 0, 4
legalmod_BLK:
	DW     8,     5,    64, 00000H,     0
	DW     8,   135,    64, 00000H,     1
	DW   158,     5,    64, 00000H,     2
	DW   158,   135,    64, 00000H,     3

	;CNOP 0, 4
legal_HDR:
	DW     3,     1,     1,   152,   130
	DW     3,     1,   131,   152,   110
	DW     1,     1,     1,   172,   130
	DW     1,     1,   131,   172,   110
