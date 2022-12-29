

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
sg_pieces:
    DW  05cH,033H+17,0128H,033H+17
    DD shflesh1a-sg_pieces,0
    DD shflesh1b-sg_pieces,0
    DD shflesh1c-sg_pieces,0
    DD shflesh1d-sg_pieces,0
    DD shflesh1e-sg_pieces,0
    DD shflesh1f-sg_pieces,0
    DD shflesh1g-sg_pieces,0
    DD shflesh1h-sg_pieces,0
    DD shflesh1i-sg_pieces,0
    DD shgrey1a-sg_pieces,0
    DD shgrey1b-sg_pieces,0
    DD shgrey1c-sg_pieces,0
    DD shgrey1d-sg_pieces,0
    DD shgrey1e-sg_pieces,0
    DD shgrey1f-sg_pieces,0
    DD shgrey1g-sg_pieces,0
    DD shred1a-sg_pieces,_VSHBLU_P
    DD shred1b-sg_pieces,_VSHBLU_P
    DD shred1c-sg_pieces,_VSHBLU_P
    DD shred1d-sg_pieces,_VSHBLU_P
    DD  0

shflesh1a:
    DD  SHFLESH1A-sg_pieces,0
shflesh1b:
    DD  SHFLESH1B-sg_pieces,0
shflesh1c:
    DD  SHFLESH1C-sg_pieces,0
shflesh1d:
    DD  SHFLESH1D-sg_pieces,0
shflesh1e:
    DD  SHFLESH1E-sg_pieces,0
shflesh1f:
    DD  SHFLESH1F-sg_pieces,0
shflesh1g:
    DD  SHFLESH1G-sg_pieces,0
shflesh1h:
    DD  SHFLESH1H-sg_pieces,0
shflesh1i:
    DD  SHFLESH1I-sg_pieces,0
shgrey1a:
    DD  SHGREY1A-sg_pieces,0
shgrey1b:
    DD  SHGREY1B-sg_pieces,0
shgrey1c:
    DD  SHGREY1C-sg_pieces,0
shgrey1d:
    DD  SHGREY1D-sg_pieces,0
shgrey1e:
    DD  SHGREY1E-sg_pieces,0
shgrey1f:
    DD  SHGREY1F-sg_pieces,0
shgrey1g:
    DD  SHGREY1G-sg_pieces,0
shred1a:
    DD  SHRED1A-sg_pieces,0
shred1b:
    DD  SHRED1B-sg_pieces,0
shred1c:
    DD  SHRED1C-sg_pieces,0
shred1d:
    DD  SHRED1D-sg_pieces,0

SHFLESH1A:
    DD  SHFLESH1A_SUB-sg_pieces,0
SHFLESH1A_SUB:
    DD SHFLESH1A_IMG-sg_pieces
    DW 17, 27, 21, -155
    DD   _VSHESKIN_P
SHFLESH1B:
    DD  SHFLESH1B_SUB-sg_pieces,0
SHFLESH1B_SUB:
    DD SHFLESH1B_IMG-sg_pieces
    DW 41, 43, 71, -139
    DD   _VSHESKIN_P
SHFLESH1C:
    DD  SHFLESH1C_SUB-sg_pieces,0
SHFLESH1C_SUB:
    DD SHFLESH1C_IMG-sg_pieces
    DW 41, 65, -5, -13
    DD   _VSHESKIN_P
SHFLESH1D:
    DD  SHFLESH1D_SUB-sg_pieces,0
SHFLESH1D_SUB:
    DD SHFLESH1D_IMG-sg_pieces
    DW 21, 41, 64, -8
    DD   _VSHESKIN_P
SHFLESH1E:
    DD  SHFLESH1E_SUB-sg_pieces,0
SHFLESH1E_SUB:
    DD SHFLESH1E_IMG-sg_pieces
    DW 62, 85, 82, -62
    DD   _VSHESKIN_P
SHFLESH1F:
    DD  SHFLESH1F_SUB-sg_pieces,0
SHFLESH1F_SUB:
    DD SHFLESH1F_IMG-sg_pieces
    DW 40, 96, -3, -77
    DD   _VSHESKIN_P
SHFLESH1G:
    DD  SHFLESH1G_SUB-sg_pieces,0
SHFLESH1G_SUB:
    DD SHFLESH1G_IMG-sg_pieces
    DW 40, 85, -43, -93
    DD   _VSHESKIN_P
SHFLESH1H:
    DD  SHFLESH1H_SUB-sg_pieces,0
SHFLESH1H_SUB:
    DD SHFLESH1H_IMG-sg_pieces
    DW 38, 88, 43, -15
    DD   _VSHESKIN_P
SHFLESH1I:
    DD  SHFLESH1I_SUB-sg_pieces,0
SHFLESH1I_SUB:
    DD SHFLESH1I_IMG-sg_pieces
    DW 26, 105, 21, -44
    DD   _VSHESKIN_P
SHGREY1A:
    DD  SHGREY1A_SUB-sg_pieces,0
SHGREY1A_SUB:
    DD SHGREY1A_IMG-sg_pieces
    DW 18, 20, 54, -10
    DD   _VSHEGRY_P
SHGREY1B:
    DD  SHGREY1B_SUB-sg_pieces,0
SHGREY1B_SUB:
    DD SHGREY1B_IMG-sg_pieces
    DW 21, 20, 82, -72
    DD   _VSHEGRY_P
SHGREY1C:
    DD  SHGREY1C_SUB-sg_pieces,0
SHGREY1C_SUB:
    DD SHGREY1C_IMG-sg_pieces
    DW 10, 14, 37, -59
    DD   _VSHEGRY_P
SHGREY1D:
    DD  SHGREY1D_SUB-sg_pieces,0
SHGREY1D_SUB:
    DD SHGREY1D_IMG-sg_pieces
    DW 58, 57, 17, 2
    DD   _VSHEGRY_P
SHGREY1E:
    DD  SHGREY1E_SUB-sg_pieces,0
SHGREY1E_SUB:
    DD SHGREY1E_IMG-sg_pieces
    DW 38, 23, 48, -134
    DD   _VSHEGRY_P
SHGREY1F:
    DD  SHGREY1F_SUB-sg_pieces,0
SHGREY1F_SUB:
    DD SHGREY1F_IMG-sg_pieces
    DW 18, 17, -31, -161
    DD   _VSHEGRY_P
SHGREY1G:
    DD  SHGREY1G_SUB-sg_pieces,0
SHGREY1G_SUB:
    DD SHGREY1G_IMG-sg_pieces
    DW 14, 27, -69, -121
    DD   _VSHEGRY_P
SHRED1A:
    DD  SHRED1A_SUB-sg_pieces,0
SHRED1A_SUB:
    DD SHRED1A_IMG-sg_pieces
    DW 18, 32, 32, -150
    DD   _VSHRED_P
SHRED1B:
    DD  SHRED1B_SUB-sg_pieces,0
SHRED1B_SUB:
    DD SHRED1B_IMG-sg_pieces
    DW 26, 61, -5, -76
    DD   _VSHRED_P
SHRED1C:
    DD  SHRED1C_SUB-sg_pieces,0
SHRED1C_SUB:
    DD SHRED1C_IMG-sg_pieces
    DW 22, 21, 16, -135
    DD   _VSHRED_P
SHRED1D:
    DD  SHRED1D_SUB-sg_pieces,0
SHRED1D_SUB:
    DD SHRED1D_IMG-sg_pieces
    DW 44, 94, 30, -52
    DD   _VSHRED_P

    ;CNOP 0,4
    include ..\attract\vs\vssg.psi




    END_OVERLAY
    end

