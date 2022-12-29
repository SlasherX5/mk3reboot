	ALIGN  4
logomodBMOD:
	DW   339,   253
	DD     6, logomod_BLK, logobg_HDR, _logobg_CLT

	ALIGN  4
logomod_BLK:
	DW     8,     5,    64, 00000h,     2
	DW     8,    85,    64, 00000h,     0
	DW     8,   165,    64, 00000h,     1
	DW   168,     5,    64, 00000h,     4
	DW   168,    85,    64, 00000h,     3
	DW   168,   165,    64, 00000h,     5

	ALIGN  4
logobg_HDR:
	DW     0,     1,    49,   160,    80
	DW     0,     1,   129,   160,    79
	DW     1,     1,     1,   160,    80
	DW     1,     1,    81,   160,    80
	DW     1,     1,   161,   160,    80
	DW     2,     1,     1,   160,    79
