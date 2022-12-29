

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
jax_pieces:
    DW  063H,020H+32,0125H,020H+32
    DD jxflesh1a-jax_pieces,0
    DD jxpurp1a-jax_pieces,_VJXGRN_P
    DD jxpurp1b-jax_pieces,_VJXGRN_P
    DD jxgry1a-jax_pieces,0
    DD jxgry1b-jax_pieces,0
    DD jxgry1c-jax_pieces,0
    DD 0

jxflesh1a:
    DD  JXFLESH1A-jax_pieces,0
jxpurp1a:
    DD  JXPURP1A-jax_pieces,0
jxpurp1b:
    DD  JXPURP1B-jax_pieces,0
jxgry1a:
    DD  JXGRY1A-jax_pieces,0
jxgry1b:
    DD  JXGRY1B-jax_pieces,0
jxgry1c:
    DD  JXGRY1C-jax_pieces,0

JXFLESH1A:
    DD  JXFLESH1A_SUB-jax_pieces,0
JXFLESH1A_SUB:
    DD JXFLESH1A_IMG-jax_pieces
    DW 88, 158, 44, -13
    DD   _VJXFLSH_P
JXPURP1A:
    DD  JXPURP1A_SUB-jax_pieces,0
JXPURP1A_SUB:
    DD JXPURP1A_IMG-jax_pieces
    DW 27, 15, 57, -168
    DD   _VJXPURP_P
JXPURP1B:
    DD  JXPURP1B_SUB-jax_pieces,0
JXPURP1B_SUB:
    DD JXPURP1B_IMG-jax_pieces
    DW 6, 6, -16, -178
    DD   _VJXPURP_P
JXGRY1A:
    DD  JXGRY1A_SUB-jax_pieces,0
JXGRY1A_SUB:
    DD JXGRY1A_IMG-jax_pieces
    DW 77, 96, 84, -50
    DD   _VJXGRY_P
JXGRY1B:
    DD  JXGRY1B_SUB-jax_pieces,0
JXGRY1B_SUB:
    DD JXGRY1B_IMG-jax_pieces
    DW 72, 31, 50, -153
    DD   _VJXGRY_P
JXGRY1C:
    DD  JXGRY1C_SUB-jax_pieces,0
JXGRY1C_SUB:
    DD JXGRY1C_IMG-jax_pieces
    DW 34, 106, -32, -77
    DD   _VJXGRY_P

    ;CNOP 0,4
    include ..\attract\vs\vsjax.psi



    END_OVERLAY
    end

