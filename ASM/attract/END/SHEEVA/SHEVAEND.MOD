	;CNOP 0, 4
shemodBMOD:
	DW   475,   290
	DD    87, shemod_BLK, shevaend_HDR, shevaend_CLT

	;CNOP 0, 4
shemod_BLK:
	DW    18,    92,    70, 00000H,     0
	DW    18,   111,    70, 00000H,     0
	DW    37,    10,    64, 00000H,     1
	DW    37,    64,    64, 00000H,     1
	DW    37,   118,    64, 00000H,     1
	DW    37,   172,    64, 00000H,     1
	DW    37,   226,    64, 00000H,     1
	DW    49,    92,    70, 00000H,     0
	DW    49,   111,    70, 00000H,     0
	DW    79,    57,    70, 00000H,     4
	DW    79,    83,    70, 00000H,     4
	DW    79,   109,    70, 00000H,     4
	DW    79,   135,    70, 00000H,     4
	DW    79,   161,    70, 00000H,     4
	DW    81,    55,    70, 00000H,     0
	DW    82,   185,    70, 00000H,     0
	DW    87,    64,    64, 00030H,     6
	DW    87,   125,    67, 00030H,     5
	DW    88,    10,    64, 00000H,     1
	DW    88,   115,    64, 00000H,     7
	DW    88,   179,    64, 00000H,     1
	DW    88,   226,    64, 00000H,     1
	DW    91,    67,    64, 00100H,     8
	DW   112,    55,    70, 00000H,     0
	DW   113,   185,    70, 00000H,     0
	DW   139,    10,    64, 00000H,     1
	DW   139,    64,    64, 00000H,    10
	DW   139,   176,    64, 00020H,     9
	DW   139,   179,    64, 00000H,     1
	DW   139,   226,    64, 00000H,     1
	DW   143,    55,    70, 00000H,     0
	DW   144,   185,    70, 00000H,     0
	DW   172,   176,    64, 00020H,     9
	DW   174,    55,    70, 00000H,     0
	DW   175,   185,    70, 00000H,     0
	DW   190,    10,    64, 00000H,     1
	DW   190,    64,    64, 00000H,    10
	DW   190,   179,    64, 00000H,     1
	DW   190,   226,    64, 00000H,     1
	DW   193,    67,    64, 00100H,    11
	DW   197,   176,    64, 00020H,     9
	DW   205,    55,    70, 00000H,     0
	DW   206,   185,    70, 00000H,     0
	DW   218,    64,    64, 00000H,    10
	DW   236,    55,    70, 00000H,     0
	DW   237,   185,    70, 00000H,     0
	DW   241,    10,    64, 00000H,     1
	DW   241,   179,    64, 00000H,     1
	DW   241,   226,    64, 00000H,     1
	DW   247,    64,    64, 00030H,    15
	DW   247,   125,    67, 00030H,    14
	DW   267,    55,    70, 00000H,     0
	DW   268,   185,    70, 00000H,     0
	DW   276,    55,    70, 00000H,     0
	DW   276,   185,    70, 00000H,     0
	DW   292,    10,    64, 00000H,     1
	DW   292,   179,    64, 00000H,     1
	DW   292,   226,    64, 00000H,     1
	DW   296,   115,    64, 00000H,    16
	DW   299,    64,    64, 00000H,     1
	DW   299,   118,    64, 00000H,     1
	DW   299,   131,    63, 00000H,     1
	DW   305,    58,    70, 00000H,     4
	DW   305,    84,    70, 00000H,     4
	DW   305,   110,    70, 00000H,     4
	DW   305,   136,    70, 00000H,     4
	DW   305,   161,    70, 00000H,     4
	DW   307,    92,    70, 00000H,     0
	DW   307,   111,    70, 00000H,     0
	DW   338,    92,    70, 00000H,     0
	DW   338,   111,    70, 00000H,     0
	DW   343,    10,    64, 00000H,     1
	DW   343,   172,    64, 00000H,     1
	DW   343,   226,    64, 00000H,     1
	DW   350,    64,    64, 00000H,     1
	DW   350,   118,    64, 00000H,     1
	DW   369,    92,    70, 00000H,     0
	DW   369,   111,    70, 00000H,     0
	DW   394,    10,    64, 00000H,     1
	DW   394,    64,    64, 00000H,     1
	DW   394,   118,    64, 00000H,     1
	DW   394,   172,    64, 00000H,     1
	DW   394,   226,    64, 00000H,     1
	DW   400,    92,    70, 00000H,     0
	DW   400,   111,    70, 00000H,     0
	DW   431,    92,    70, 00000H,     0
	DW   431,   111,    70, 00000H,     0

	;CNOP 0, 4
shetext1BMOD:
	DW   311,    94
	DD     2, shetext1_BLK, shevaend_HDR, shevaend_CLT

	;CNOP 0, 4
shetext1_BLK:
	DW    13,     7,    70, 00200H,     3
	DW   153,     7,    70, 00200H,    13

	;CNOP 0, 4
shetext2BMOD:
	DW   328,    77
	DD     2, shetext2_BLK, shevaend_HDR, shevaend_CLT

	;CNOP 0, 4
shetext2_BLK:
	DW    10,     5,    70, 00200H,     2
	DW   150,     5,    70, 00200H,    12

	;CNOP 0, 4
shevaend_HDR:
	DW     0,   221,     1,    32,     3
	DW     0,   169,     1,    52,    54
	DW     0,     1,   149,   140,    67
	DW     1,     1,     1,   140,    81
	DW     0,   153,    68,     4,    26
	DW     0,   169,    55,    52,    54
	DW     0,   141,   149,    52,    54
	DW     0,   157,    68,     4,    12
	DW     1,   141,     1,   104,   109
	DW     0,   193,   109,    52,     3
	DW     0,     1,   216,    52,     3
	DW     1,     1,    82,   104,   109
	DW     0,     1,     1,   168,    67
	DW     0,     1,    68,   152,    81
	DW     0,   193,   112,    52,    54
	DW     0,   193,   166,    52,    54
	DW     0,   161,    68,     4,    10
