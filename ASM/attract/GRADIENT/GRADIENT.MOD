	;CNOP 0, 4
blumodBMOD:
	DW   500,   256
	DD     6, blumod_BLK, gradient_HDR, _gradientb_CLT

	;CNOP 0, 4
greenmodBMOD:
	DW   500,   256
	DD     6, blumod_BLK, gradient_HDR, _gradientg_CLT

	;CNOP 0, 4
redmodBMOD:
	DW   500,   256
	DD     6, blumod_BLK, gradient_HDR, _gradientr_CLT

	;CNOP 0, 4
blumod_BLK:
	DW     9,     8,    64, 00200H,     0
	DW     9,   128,    64, 00220H,     0
	DW   169,     8,    64, 00200H,     0
	DW   169,   128,    64, 00220H,     0
	DW   329,     8,    64, 00200H,     0
	DW   329,   128,    64, 00220H,     0

	;CNOP 0, 4
gradient_HDR:
	DW     0,     1,     1,   160,   120
