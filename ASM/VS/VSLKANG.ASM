

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
lk_pieces:
    DW 060H,035H+30,012cH,035H+30
    DD lkflesh1a-lk_pieces,0
    DD lkflesh1b-lk_pieces,0
    DD lkflesh1c-lk_pieces,0
    DD lkflesh1d-lk_pieces,0
    DD lkflesh1e-lk_pieces,0
    DD lkgrey1a-lk_pieces,0
    DD lkgrey1b-lk_pieces,0
    DD lkgrey1c-lk_pieces,0
    DD lkgrey1d-lk_pieces,0
    DD lkgrey1e-lk_pieces,0
    DD lkred1a-lk_pieces,_VLKYEL_P
    DD lkred1b-lk_pieces,_VLKYEL_P
    DD lkred1c-lk_pieces,_VLKYEL_P
    DD 0

lkflesh1a:
    DD  LKFLESH1A-lk_pieces,0
lkflesh1b:
    DD  LKFLESH1B-lk_pieces,0
lkflesh1c:
    DD  LKFLESH1C-lk_pieces,0
lkflesh1d:
    DD  LKFLESH1D-lk_pieces,0
lkflesh1e:
    DD  LKFLESH1E-lk_pieces,0
lkgrey1a:
    DD  LKGREY1A-lk_pieces,0
lkgrey1b:
    DD  LKGREY1B-lk_pieces,0
lkgrey1c:
    DD  LKGREY1C-lk_pieces,0
lkgrey1d:
    DD  LKGREY1D-lk_pieces,0
lkgrey1e:
    DD  LKGREY1E-lk_pieces,0
lkred1a:
    DD  LKRED1A-lk_pieces,0
lkred1b:
    DD  LKRED1B-lk_pieces,0
lkred1c:
    DD  LKRED1C-lk_pieces,0

LKFLESH1A:
    DD  LKFLESH1A_SUB-lk_pieces,0
LKFLESH1A_SUB:
    DD LKFLESH1A_IMG-lk_pieces
    DW 28, 73, 73, -66
    DD   _VLKSKIN_P
LKFLESH1B:
    DD  LKFLESH1B_SUB-lk_pieces,0
LKFLESH1B_SUB:
    DD LKFLESH1B_IMG-lk_pieces
    DW 35, 98, 45, -57
    DD   _VLKSKIN_P
LKFLESH1C:
    DD  LKFLESH1C_SUB-lk_pieces,0
LKFLESH1C_SUB:
    DD LKFLESH1C_IMG-lk_pieces
    DW 15, 26, -65, -79
    DD   _VLKSKIN_P
LKFLESH1D:
    DD  LKFLESH1D_SUB-lk_pieces,0
LKFLESH1D_SUB:
    DD LKFLESH1D_IMG-lk_pieces
    DW 38, 78, -28, -76
    DD   _VLKSKIN_P
LKFLESH1E:
    DD  LKFLESH1E_SUB-lk_pieces,0
LKFLESH1E_SUB:
    DD LKFLESH1E_IMG-lk_pieces
    DW 38, 124, 10, -28
    DD   _VLKSKIN_P
LKGREY1A:
    DD  LKGREY1A_SUB-lk_pieces,0
LKGREY1A_SUB:
    DD LKGREY1A_IMG-lk_pieces
    DW 28, 80, 18, 0
    DD   _VLKGRAY_P
LKGREY1B:
    DD  LKGREY1B_SUB-lk_pieces,0
LKGREY1B_SUB:
    DD LKGREY1B_IMG-lk_pieces
    DW 18, 67, -9, 0
    DD   _VLKGRAY_P
LKGREY1C:
    DD  LKGREY1C_SUB-lk_pieces,0
LKGREY1C_SUB:
    DD LKGREY1C_IMG-lk_pieces
    DW 22, 36, -54, -98
    DD   _VLKGRAY_P
LKGREY1D:
    DD  LKGREY1D_SUB-lk_pieces,0
LKGREY1D_SUB:
    DD LKGREY1D_IMG-lk_pieces
    DW 51, 48, 56, -121
    DD   _VLKGRAY_P
LKGREY1E:
    DD  LKGREY1E_SUB-lk_pieces,0
LKGREY1E_SUB:
    DD LKGREY1E_IMG-lk_pieces
    DW 11, 18, 5, -152
    DD   _VLKGRAY_P
LKRED1A:
    DD  LKRED1A_SUB-lk_pieces,0
LKRED1A_SUB:
    DD LKRED1A_IMG-lk_pieces
    DW 53, 56, 24, -19
    DD   _VLKRED_P
LKRED1B:
    DD  LKRED1B_SUB-lk_pieces,0
LKRED1B_SUB:
    DD LKRED1B_IMG-lk_pieces
    DW 17, 27, 58, -143
    DD   _VLKRED_P
LKRED1C:
    DD  LKRED1C_SUB-lk_pieces,0
LKRED1C_SUB:
    DD LKRED1C_IMG-lk_pieces
    DW 51, 23, 38, -147
    DD   _VLKRED_P

    ;CNOP 0,4
    include ..\attract\vs\vslkang.psi




    END_OVERLAY
    end

