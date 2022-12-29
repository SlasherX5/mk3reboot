

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
swat_pieces:
    DW  063H,025H+29,0125H,025H+29
    DD copblue1a-swat_pieces,_VCOPRED_P
    DD copblue1b-swat_pieces,_VCOPRED_P
    DD copblue1c-swat_pieces,_VCOPRED_P
    DD copflesh1a-swat_pieces,0
    DD copflesh1b-swat_pieces,0
    DD copflesh1c-swat_pieces,0
    DD copflesh1d-swat_pieces,0
    DD copgrey1a-swat_pieces,0
    DD copgrey1b-swat_pieces,0
    DD copgrey1c-swat_pieces,0
    DD copgrey1d-swat_pieces,0
    DD 0

copblue1a:
    DD  COPBLUE1A-swat_pieces,0
copblue1b:
    DD  COPBLUE1B-swat_pieces,0
copblue1c:
    DD  COPBLUE1C-swat_pieces,0
copflesh1a:
    DD  COPFLESH1A-swat_pieces,0
copflesh1b:
    DD  COPFLESH1B-swat_pieces,0
copflesh1c:
    DD  COPFLESH1C-swat_pieces,0
copflesh1d:
    DD  COPFLESH1D-swat_pieces,0
copgrey1a:
    DD  COPGREY1A-swat_pieces,0
copgrey1b:
    DD  COPGREY1B-swat_pieces,0
copgrey1c:
    DD  COPGREY1C-swat_pieces,0
copgrey1d:
    DD  COPGREY1D-swat_pieces,0

COPBLUE1A:
    DD  COPBLUE1A_SUB-swat_pieces,0
COPBLUE1A_SUB:
    DD COPBLUE1A_IMG-swat_pieces
    DW 96, 72, 48, -66
    DD   _VCOPBLU_P
COPBLUE1B:
    DD  COPBLUE1B_SUB-swat_pieces,0
COPBLUE1B_SUB:
    DD COPBLUE1B_IMG-swat_pieces
    DW 10, 9, 42, -150
    DD   _VCOPBLU_P
COPBLUE1C:
    DD  COPBLUE1C_SUB-swat_pieces,0
COPBLUE1C_SUB:
    DD COPBLUE1C_IMG-swat_pieces
    DW 20, 14, 69, -171
    DD   _VCOPBLU_P
COPFLESH1A:
    DD  COPFLESH1A_SUB-swat_pieces,0
COPFLESH1A_SUB:
    DD COPFLESH1A_IMG-swat_pieces
    DW 44, 39, -1, -31
    DD   _VCOPSKN_P
COPFLESH1B:
    DD  COPFLESH1B_SUB-swat_pieces,0
    DD   _VCOPSKN_P
COPFLESH1B_SUB:
    DD COPFLESH1B_IMG-swat_pieces
    DW 55, 35, 69, -97
    DD   _VCOPSKN_P
COPFLESH1C:
    DD  COPFLESH1C_SUB-swat_pieces,0
COPFLESH1C_SUB:
    DD COPFLESH1C_IMG-swat_pieces
    DW 11, 16, 10, -127
    DD   _VCOPSKN_P
COPFLESH1D:
    DD  COPFLESH1D_SUB-swat_pieces,0
COPFLESH1D_SUB:
    DD COPFLESH1D_IMG-swat_pieces
    DW 40, 60, -34, -111
    DD   _VCOPSKN_P
COPGREY1A:
    DD  COPGREY1A_SUB-swat_pieces,0
COPGREY1A_SUB:
    DD COPGREY1A_IMG-swat_pieces
    DW 50, 33, 4, -13
    DD   _VCOPGRY_P
COPGREY1B:
    DD  COPGREY1B_SUB-swat_pieces,0
COPGREY1B_SUB:
    DD COPGREY1B_IMG-swat_pieces
    DW 77, 134, 75, -50
    DD   _VCOPGRY_P
COPGREY1C:
    DD  COPGREY1C_SUB-swat_pieces,0
COPGREY1C_SUB:
    DD COPGREY1C_IMG-swat_pieces
    DW 21, 31, -53, -139
    DD   _VCOPGRY_P
COPGREY1D:
    DD  COPGREY1D_SUB-swat_pieces,0
COPGREY1D_SUB:
    DD COPGREY1D_IMG-swat_pieces
    DW 46, 133, -1, -51
    DD   _VCOPGRY_P

    ;CNOP 0,4
    include ..\attract\vs\vsswat.psi



    END_OVERLAY
    end

