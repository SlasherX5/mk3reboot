	ALIGN 4 ;CNOP 0, 4
mkcity5BMOD:
	DW   332,   130
	DD     4, mkcity5_BLK, MKCITY_HDR, _MKCITY_CLT

	ALIGN 4 ;CNOP 0, 4
mkcity5_BLK:
	DW     9,    16,    64, 00A00H,    13
	DW     9,    70,    64, 00B00H,    14
	DW   159,    35,    64, 00900H,    24
	DW   159,    83,    64, 00B00H,    23

	ALIGN 4 ;CNOP 0, 4
mkcity4BMOD:
	DW   446,   183
	DD     5, mkcity4_BLK, MKCITY_HDR, _MKCITY_CLT

	ALIGN 4 ;CNOP 0, 4
mkcity4_BLK:
	DW    21,    92,    65, 00C00H,    11
	DW    76,   115,    64, 00C00H,    15
	DW   168,   123,    64, 00600H,    20
	DW   182,    31,    64, 00500H,    22
	DW   362,    30,    64, 00800H,    26

	ALIGN 4 ;CNOP 0, 4
mkcity3BMOD:
	DW   307,    93
	DD     2, mkcity3_BLK, MKCITY_HDR, _MKCITY_CLT

	ALIGN 4 ;CNOP 0, 4
mkcity3_BLK:
	DW   105,    15,    64, 00400H,    19
	DW   204,    38,    64, 00700H,    25

	ALIGN 4 ;CNOP 0, 4
mkcity2BMOD:
	DW   881,    82
	DD    22, mkcity2_BLK, MKCITY_HDR, _MKCITY_CLT

	ALIGN 4 ;CNOP 0, 4
mkcity2_BLK:
	DW    18,    46,    64, 00300H,     2
	DW    64,    46,    64, 00300H,     5
	DW   111,    46,    64, 00300H,     7
	DW   156,    46,    64, 00300H,     8
	DW   172,     9,    65, 00000H,     9
	DW   218,    46,    64, 00300H,    10
	DW   267,    46,    64, 00300H,    12
	DW   312,    46,    64, 00300H,    16
	DW   337,    11,    65, 00100H,    17
	DW   355,    46,    64, 00300H,    18
	DW   402,    46,    64, 00300H,    21
	DW   442,    46,    64, 00310H,    21
	DW   484,    46,    64, 00310H,    18
	DW   505,    11,    65, 00110H,    17
	DW   531,    46,    64, 00310H,    16
	DW   572,    46,    64, 00310H,    12
	DW   617,    46,    64, 00310H,    10
	DW   667,    46,    64, 00310H,     8
	DW   672,    10,    65, 00010H,     9
	DW   728,    46,    64, 00310H,     7
	DW   775,    46,    64, 00310H,     5
	DW   821,    46,    64, 00310H,     2

	ALIGN 4 ;CNOP 0, 4
mkcity1BMOD:
	DW   938,   254
	DD    10, mkcity1_BLK, MKCITY_HDR, _MKCITY_CLT

	ALIGN 4 ;CNOP 0, 4
mkcity1_BLK:
	DW    14,   162,    64, 00200H,     0
	DW    16,    26,    64, 00200H,     1
	DW    25,   129,    64, 00200H,     3
	DW    53,    19,    64, 00200H,     4
	DW    99,    51,    64, 00200H,     6
	DW   785,   162,    64, 00210H,     0
	DW   801,    51,    64, 00210H,     6
	DW   810,   129,    64, 00210H,     3
	DW   815,    18,    64, 00210H,     4
	DW   872,    25,    64, 00210H,     1

	ALIGN 4 ;CNOP 0, 4
MKCITY_HDR:
	DW     2,     1,    91,   128,    73
	DW     4,   133,   115,    40,   104
	DW     3,     1,   121,    48,    26
	DW     1,   157,    66,    92,    33
	DW     3,   109,     1,    60,   111
	DW     3,    49,   121,    48,    26
	DW     3,   225,    71,    28,    56
	DW     3,   109,   204,    48,    26
	DW     0,   181,     1,    64,    26
	DW     4,    93,     1,    44,    52
	DW     2,     1,   215,    52,    26
	DW     0,   173,   152,    60,    82
	DW     3,   157,   194,    48,    26
	DW     1,     1,   117,   152,    54
	DW     1,     1,   171,   152,    55
	DW     0,   181,    27,    64,    59
	DW     3,     1,   224,    44,    26
	DW     4,   137,     1,    44,    48
	DW     3,     1,   147,    48,    26
	DW     3,   169,     1,    60,    70
	DW     2,     1,   164,   128,    51
	DW     3,    45,   227,    44,    26
	DW     2,   153,     1,   100,    92
	DW     0,     1,   110,   172,    42
	DW     0,     1,   152,   172,    48
	DW     1,   165,     1,    88,    47
	DW     4,     1,     1,    48,   144
