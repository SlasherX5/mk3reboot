	;CNOP 0, 4
kabalmodBMOD:
	DW   350,   275
	DD    35, kabalmod_BLK, kabalbio_HDR, _kabalbio_CLT

	;CNOP 0, 4
kabalmod_BLK:
	DW    12,     9,    64, 00200H,     1
	DW    12,   116,    64, 00200H,     0
	DW   113,    18,    64, 00030H,     2
	DW   113,   164,    64, 00030H,     3
	DW   114,     9,    64, 00100H,     4
	DW   114,    72,    64, 00000H,     5
	DW   114,   123,    64, 00000H,     5
	DW   114,   145,    64, 00000H,     5
	DW   114,   218,    64, 00100H,     6
	DW   117,    21,    64, 00000H,     7
	DW   117,    75,    64, 00000H,     7
	DW   117,   108,    64, 00000H,     7
	DW   117,   162,    64, 00000H,     7
	DW   136,    22,    70, 00300H,     8
	DW   165,    18,    64, 00000H,     9
	DW   165,   215,    64, 00020H,    10
	DW   168,    21,    64, 00000H,     7
	DW   168,    75,    64, 00000H,     7
	DW   168,   108,    64, 00000H,     7
	DW   168,   162,    64, 00000H,     7
	DW   216,    18,    64, 00000H,     9
	DW   216,   215,    64, 00020H,    10
	DW   219,    21,    64, 00000H,     7
	DW   219,    75,    64, 00000H,     7
	DW   219,   108,    64, 00000H,     7
	DW   219,   162,    64, 00000H,     7
	DW   264,    21,    64, 00000H,     7
	DW   264,    75,    64, 00000H,     7
	DW   264,   108,    64, 00000H,     7
	DW   264,   162,    64, 00000H,     7
	DW   266,    18,    63, 00030H,    11
	DW   266,   164,    64, 00030H,    12
	DW   315,    72,    63, 00000H,    13
	DW   315,   104,    63, 00000H,    13
	DW   315,   140,    63, 00000H,    13

	;CNOP 0, 4
kabalbio_HDR:
	DW     1,     1,     1,   104,   111
	DW     1,   105,     1,   104,   107
	DW     0,   165,     1,    52,    54
	DW     0,    97,   166,    52,    54
	DW     0,     1,   166,    96,     9
	DW     0,   217,     1,     4,    51
	DW     0,     1,   175,    96,     9
	DW     0,   165,    55,    52,    54
	DW     0,     1,     1,   164,   165
	DW     0,    97,   220,    52,     3
	DW     0,   165,   109,    52,     3
	DW     0,     1,   184,    52,    54
	DW     0,   165,   112,    52,    54
	DW     0,   221,     1,     4,    46
