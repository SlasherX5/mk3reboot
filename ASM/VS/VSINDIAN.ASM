

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
ind_pieces:
    DW  063H,025H+19+8,0125H,025H+19+8
    DD ingry1a-ind_pieces,0
    DD ingry1b-ind_pieces,0
    DD ingry1c-ind_pieces,0
    DD ingry1d-ind_pieces,0
    DD ingry1e-ind_pieces,0
    DD inblu1a-ind_pieces,_VINTAN_P
    DD inblu1b-ind_pieces,_VINTAN_P
    DD inblu1c-ind_pieces,_VINTAN_P
    DD inblu1d-ind_pieces,_VINTAN_P
    DD inskin1a-ind_pieces,0
    DD inskin1b-ind_pieces,0
    DD inskin1c-ind_pieces,0
    DD inskin1d-ind_pieces,0
    DD inskin1e-ind_pieces,0
    DD inskin1f-ind_pieces,0
    DD inskin1g-ind_pieces,0
    DD 0

ingry1a:
    DD  INGRY1A-ind_pieces,0
ingry1b:
    DD  INGRY1B-ind_pieces,0
ingry1c:
    DD  INGRY1C-ind_pieces,0
ingry1d:
    DD  INGRY1D-ind_pieces,0
ingry1e:
    DD  INGRY1E-ind_pieces,0
inblu1a:
    DD  INBLU1A-ind_pieces,0
inblu1b:
    DD  INBLU1B-ind_pieces,0
inblu1c:
    DD  INBLU1C-ind_pieces,0
inblu1d:
    DD  INBLU1D-ind_pieces,0
inskin1a:
    DD  INSKIN1A-ind_pieces,0
inskin1b:
    DD  INSKIN1B-ind_pieces,0
inskin1c:
    DD  INSKIN1C-ind_pieces,0
inskin1d:
    DD  INSKIN1D-ind_pieces,0
inskin1e:
    DD  INSKIN1E-ind_pieces,0
inskin1f:
    DD  INSKIN1F-ind_pieces,0
inskin1g:
    DD  INSKIN1G-ind_pieces,0

INGRY1A:
    DD  INGRY1A_SUB-ind_pieces,0
INGRY1A_SUB:
    DD INGRY1A_IMG-ind_pieces
    DW 21, 24, -62, -121
    DD   _VINGRY_P
INGRY1B:
    DD  INGRY1B_SUB-ind_pieces,0
INGRY1B_SUB:
    DD INGRY1B_IMG-ind_pieces
    DW 23, 81, 72, -103
    DD   _VINGRY_P
INGRY1C:
    DD  INGRY1C_SUB-ind_pieces,0
INGRY1C_SUB:
    DD INGRY1C_IMG-ind_pieces
    DW 41, 95, 49, -48
    DD   _VINGRY_P
INGRY1D:
    DD  INGRY1D_SUB-ind_pieces,0
INGRY1D_SUB:
    DD INGRY1D_IMG-ind_pieces
    DW 19, 105, -25, -16
    DD   _VINGRY_P
INGRY1E:
    DD  INGRY1E_SUB-ind_pieces,0
INGRY1E_SUB:
    DD INGRY1E_IMG-ind_pieces
    DW 64, 159, 38, -15
    DD   _VINGRY_P
INBLU1A:
    DD  INBLU1A_SUB-ind_pieces,0
INBLU1A_SUB:
    DD INBLU1A_IMG-ind_pieces
    DW 21, 23, 64, -76
    DD   _VINBLU_P
INBLU1B:
    DD  INBLU1B_SUB-ind_pieces,0
INBLU1B_SUB:
    DD INBLU1B_IMG-ind_pieces
    DW 38, 68, -2, -33
    DD   _VINBLU_P
INBLU1C:
    DD  INBLU1C_SUB-ind_pieces,0
INBLU1C_SUB:
    DD INBLU1C_IMG-ind_pieces
    DW 22, 26, -19, -120
    DD   _VINBLU_P
INBLU1D:
    DD  INBLU1D_SUB-ind_pieces,0
INBLU1D_SUB:
    DD INBLU1D_IMG-ind_pieces
    DW 64, 13, 56, -171
    DD   _VINBLU_P
INSKIN1A:
    DD  INSKIN1A_SUB-ind_pieces,0
INSKIN1A_SUB:
    DD INSKIN1A_IMG-ind_pieces
    DW 34, 77, 88, -69
    DD   _VINSKN_P
INSKIN1B:
    DD  INSKIN1B_SUB-ind_pieces,0
INSKIN1B_SUB:
    DD INSKIN1B_IMG-ind_pieces
    DW 33, 116, 58, -60
    DD   _VINSKN_P
INSKIN1C:
    DD  INSKIN1C_SUB-ind_pieces,0
INSKIN1C_SUB:
    DD INSKIN1C_IMG-ind_pieces
    DW 28, 41, -12, -42
    DD   _VINSKN_P
INSKIN1D:
    DD  INSKIN1D_SUB-ind_pieces,0
INSKIN1D_SUB:
    DD INSKIN1D_IMG-ind_pieces
    DW 18, 31, -67, -98
    DD   _VINSKN_P
INSKIN1E:
    DD  INSKIN1E_SUB-ind_pieces,0
INSKIN1E_SUB:
    DD INSKIN1E_IMG-ind_pieces
    DW 14, 24, -25, -99
    DD   _VINSKN_P
INSKIN1F:
    DD  INSKIN1F_SUB-ind_pieces,0
INSKIN1F_SUB:
    DD INSKIN1F_IMG-ind_pieces
    DW 54, 48, -19, -126
    DD   _VINSKN_P
INSKIN1G:
    DD  INSKIN1G_SUB-ind_pieces,0
INSKIN1G_SUB:
    DD INSKIN1G_IMG-ind_pieces
    DW 44, 89, 26, -69
    DD   _VINSKN_P

    ;CNOP 0,4
    include ..\attract\vs\vsindian.psi



    END_OVERLAY
    end

