	ALIGN  4
PUBLIC STEELMODBMOD
STEELMODBMOD:
	DW   333,   248
	DD     4, STEELMOD_BLK, steelvsx_HDR, steelvsx_CLT

	ALIGN  4
STEELMOD_BLK:
	DW     2,     2,    64, 00000h,     0
	DW     2,   115,    64, 00000h,     1
	DW   162,     2,    64, 00010h,     0
	DW   162,   115,    64, 00010h,     1

	ALIGN  4
steelvsx_HDR:
	DW     0,     1,     1,   164,   113
	DW     0,     1,   114,   164,   126
