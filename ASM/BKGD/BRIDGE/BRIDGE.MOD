	ALIGN  4
BRIDGE1BMOD:
	DW   860,   231
	DD    32, BRIDGE1_BLK, MKBRIDGE_HDR, _MKBRIDGE_CLT

	ALIGN  4
BRIDGE1_BLK:
	DW    17,    25,    64, 00900h,     7
	DW    17,   159,    64, 00700h,     6
	DW    45,   169,    66, 00800h,    10
	DW    55,    33,    64, 00A00h,    11
	DW    67,   160,    64, 00400h,    12
	DW   138,   171,    64, 00B00h,    16
	DW   147,    12,    64, 00C10h,    18
	DW   147,    93,    64, 00B10h,    17
	DW   172,   160,    60, 00D10h,    21
	DW   183,   164,    64, 00510h,    22
	DW   277,    90,    65, 00E10h,    23
	DW   286,    11,    64, 00E10h,    24
	DW   288,   164,    64, 00510h,    25
	DW   291,   160,    64, 00D10h,    26
	DW   367,   164,    64, 00600h,    27
	DW   409,   107,    65, 00B00h,    28
	DW   419,    13,    64, 00C00h,    29
	DW   431,   164,    64, 00600h,    30
	DW   443,   160,    64, 00D00h,    26
	DW   495,   164,    64, 00500h,    25
	DW   561,    90,    65, 00E00h,    23
	DW   568,    11,    64, 00E00h,    24
	DW   571,   164,    64, 00500h,    22
	DW   574,   160,    60, 00D00h,    21
	DW   675,   160,    64, 00410h,    12
	DW   676,   171,    64, 00B10h,    16
	DW   687,    12,    64, 00C00h,    18
	DW   687,    93,    64, 00B00h,    17
	DW   761,   159,    64, 00710h,     6
	DW   763,    33,    64, 00A10h,    11
	DW   772,   169,    66, 00810h,    10
	DW   805,    25,    64, 00910h,     7

	ALIGN  4
BRIDGE2BMOD:
	DW   303,   187
	DD     9, BRIDGE2_BLK, MKBRIDGE_HDR, _MKBRIDGE_CLT

	ALIGN  4
BRIDGE2_BLK:
	DW    15,     5,    64, 00100h,     0
	DW    15,   137,    64, 00100h,     1
	DW    73,     5,    64, 00100h,     3
	DW    73,   136,    64, 00100h,     4
	DW   124,     5,    64, 00100h,     8
	DW   124,   136,    64, 00100h,     9
	DW   168,    46,    64, 00200h,    14
	DW   213,    68,    64, 00200h,    15
	DW   255,    80,    64, 00300h,    20

	ALIGN  4
BRIDGE3BMOD:
	DW   327,   127
	DD     4, BRIDGE3_BLK, MKBRIDGE_HDR, _MKBRIDGE_CLT

	ALIGN  4
BRIDGE3_BLK:
	DW    16,    15,    64, 00000h,     2
	DW    86,    20,    64, 00000h,     5
	DW   163,    18,    64, 00000h,    13
	DW   245,    30,    64, 00000h,    19

	ALIGN  4
MKBRIDGE_HDR:
	DW     1,    65,   110,    60,   136
	DW     1,   149,    58,    60,    36
	DW     1,    77,     1,    72,   109
	DW     1,   149,    94,    52,   136
	DW     1,     1,   152,    52,    36
	DW     0,     1,    71,    80,   104
	DW     0,     1,     9,    84,    62
	DW     1,   213,     1,    40,   134
	DW     2,    49,     1,    44,   136
	DW     1,   201,   216,    44,    36
	DW     1,     1,   188,    44,    46
	DW     2,    93,     1,    44,   126
	DW     0,   129,     1,   120,    61
	DW     0,   129,   119,    84,   106
	DW     2,     1,     1,    48,   122
	DW     2,   137,     1,    44,   100
	DW     0,    81,   189,    48,    34
	DW     0,    85,    97,    28,    78
	DW     1,   213,   135,    28,    81
	DW     1,     1,     1,    76,    94
	DW     0,    85,     9,    32,    88
	DW     0,     1,     5,   116,     4
	DW     0,   129,    62,   108,    57
	DW     0,   213,   119,    24,   115
	DW     0,   237,   107,     8,    79
	DW     0,     1,   175,    80,    57
	DW     0,     1,     1,   128,     4
	DW     1,   149,     1,    64,    57
	DW     2,   181,     1,    44,    99
	DW     1,   125,   110,    24,    94
	DW     1,     1,    95,    64,    57
