	;CNOP 0, 4
citymodBMOD:
	DW   355,   161
	DD     4, citymod_BLK, MKSHAO1_HDR, _MKSHAO1_CLT

	;CNOP 0, 4
citymod_BLK:
	DW    11,    72,    65, 00000H,     0
	DW    74,    84,    66, 00400H,     4
	DW   200,   107,    66, 00700H,     9
	DW   287,    10,    65, 00800H,    10

	;CNOP 0, 4
towermodBMOD:
	DW   355,   143
	DD     2, towermod_BLK, MKSHAO1_HDR, _MKSHAO1_CLT

	;CNOP 0, 4
towermod_BLK:
	DW   133,    85,    65, 00600H,     5
	DW   147,     5,    65, 00500H,     6

	;CNOP 0, 4
bgcityBMOD:
	DW   355,   120
	DD     5, bgcity_BLK, MKSHAO1_HDR, _MKSHAO1_CLT

	;CNOP 0, 4
bgcity_BLK:
	DW    29,     8,    64, 00200H,     1
	DW    29,    62,    64, 00100H,     2
	DW    65,    58,    65, 00000H,     3
	DW   179,    27,    64, 00300H,     7
	DW   179,    75,    64, 00100H,     8

	;CNOP 0, 4
MKSHAO1_HDR:
	DW     1,   173,     1,    60,    82
	DW     2,     1,   117,   152,    54
	DW     2,     1,   171,   152,    55
	DW     0,   185,     1,    64,    59
	DW     0,   173,   181,    60,    70
	DW     3,     1,    62,   128,    51
	DW     3,   153,     1,   100,    80
	DW     0,     1,   181,   172,    48
	DW     1,     1,     1,   172,    42
	DW     2,   165,     1,    88,    47
	DW     4,     1,     1,    48,   144
