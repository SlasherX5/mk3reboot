	ALIGN  4
coinmodBMOD:
	DW   426,   671
	
PUBLIC _CoinModObjCount
_CoinModObjCount:
	DD    28, coinmod_BLK, mk3coin_HDR, _mk3coin_CLT

PUBLIC _CoinModNologoObjCount
_CoinModNologoObjCount:
	DD    24
	
PUBLIC _CoinModNormalObjCount
_CoinModNormalObjCount:
	DD    28

	ALIGN  4
coinmod_BLK:
	DW     8,     8,    64, 00000h,     0
	DW     8,   117,    64, 00000h,     0
	DW     8,   226,    64, 00000h,     0
	DW     8,   335,    64, 00000h,     0
	DW     8,   444,    64, 00000h,     0
	DW     8,   553,    64, 00000h,     0
	DW   110,     8,    64, 00000h,     0
	DW   110,   117,    64, 00000h,     0
	DW   110,   226,    64, 00000h,     0
	DW   110,   335,    64, 00000h,     0
	DW   110,   444,    64, 00000h,     0
	DW   110,   553,    64, 00000h,     0
	DW   212,     8,    64, 00000h,     0
	DW   212,   117,    64, 00000h,     0
	DW   212,   226,    64, 00000h,     0
	DW   212,   335,    64, 00000h,     0
	DW   212,   444,    64, 00000h,     0
	DW   212,   553,    64, 00000h,     0
	DW   314,     8,    64, 00000h,     0
	DW   314,   117,    64, 00000h,     0
	DW   314,   226,    64, 00000h,     0
	DW   314,   335,    64, 00000h,     0
	DW   314,   444,    64, 00000h,     0
	DW   314,   553,    64, 00000h,     0
	DW    77,   144,    70, 00100h,     1
	DW    79,   148,    69, 00000h,     2
	DW   218,   143,    69, 00000h,     4
	DW   200,   141,    70, 00100h,     3

	ALIGN  4
mk3coin_HDR:
	DW     2,   125,   130,   104,   109
	DW     2,     1,   130,   124,    39
	DW     0,     1,   208,   140,    45
	DW     0,     1,     1,   172,    48
	DW     2,     1,    80,   156,    50
