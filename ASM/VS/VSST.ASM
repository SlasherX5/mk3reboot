

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
st_pieces:
    DW  058H,035H+30,0135H,035H+30
TSFLESH1:
    DD tsflesh1a-st_pieces,0
    DD tsflesh1b-st_pieces,0
    DD tsflesh1c-st_pieces,0
    DD tsflesh1d-st_pieces,0
    DD tsflesh1e-st_pieces,0
    DD tsgrey1a-st_pieces,0
    DD tsgrey1b-st_pieces,0
    DD tsgrey1c-st_pieces,0
    DD tsgrey1d-st_pieces,0
    DD tsgrey1e-st_pieces,0
    DD tspant1a-st_pieces,_VTSRED_P
    DD tspant1b-st_pieces,_VTSRED_P
    DD 0

tsflesh1a:
    DD  TSFLESH1A-st_pieces,0
tsflesh1b:
    DD  TSFLESH1B-st_pieces,0
tsflesh1c:
    DD  TSFLESH1C-st_pieces,0
tsflesh1d:
    DD  TSFLESH1D-st_pieces,0
tsflesh1e:
    DD  TSFLESH1E-st_pieces,0
tsgrey1a:
    DD  TSGREY1A-st_pieces,0
tsgrey1b:
    DD  TSGREY1B-st_pieces,0
tsgrey1c:
    DD  TSGREY1C-st_pieces,0
tsgrey1d:
    DD  TSGREY1D-st_pieces,0
tsgrey1e:
    DD  TSGREY1E-st_pieces,0
tspant1a:
    DD  TSPANT1A-st_pieces,0
tspant1b:
    DD  TSPANT1B-st_pieces,0

TSFLESH1A:
    DD  TSFLESH1A_SUB-st_pieces,0
TSFLESH1A_SUB:
    DD TSFLESH1A_IMG-st_pieces
    DW 18, 49, 13, -93
    DD   _VTSKIN_P
TSFLESH1B:
    DD  TSFLESH1B_SUB-st_pieces,0
TSFLESH1B_SUB:
    DD TSFLESH1B_IMG-st_pieces
    DW 63, 142, 64, -7
    DD   _VTSKIN_P
TSFLESH1C:
    DD  TSFLESH1C_SUB-st_pieces,0
TSFLESH1C_SUB:
    DD TSFLESH1C_IMG-st_pieces
    DW 6, 14, -4, -94
    DD   _VTSKIN_P
TSFLESH1D:
    DD  TSFLESH1D_SUB-st_pieces,0
TSFLESH1D_SUB:
    DD TSFLESH1D_IMG-st_pieces
    DW 31, 105, -3, -47
    DD   _VTSKIN_P
TSFLESH1E:
    DD  TSFLESH1E_SUB-st_pieces,0
TSFLESH1E_SUB:
    DD TSFLESH1E_IMG-st_pieces
    DW 59, 119, -34, -51
    DD   _VTSKIN_P
TSGREY1A:
    DD  TSGREY1A_SUB-st_pieces,0
TSGREY1A_SUB:
    DD TSGREY1A_IMG-st_pieces
    DW 18, 18, 44, -5
    DD   _VTSGRY_P
TSGREY1B:
    DD  TSGREY1B_SUB-st_pieces,0
TSGREY1B_SUB:
    DD TSGREY1B_IMG-st_pieces
    DW 18, 24, -60, -124
    DD   _VTSGRY_P
TSGREY1C:
    DD  TSGREY1C_SUB-st_pieces,0
TSGREY1C_SUB:
    DD TSGREY1C_IMG-st_pieces
    DW 60, 147, 43, -23
    DD   _VTSGRY_P
TSGREY1D:
    DD  TSGREY1D_SUB-st_pieces,0
TSGREY1D_SUB:
    DD TSGREY1D_IMG-st_pieces
    DW 42, 105, -16, -16
    DD   _VTSGRY_P
TSGREY1E:
    DD  TSGREY1E_SUB-st_pieces,0
TSGREY1E_SUB:
    DD TSGREY1E_IMG-st_pieces
    DW 10, 19, -16, -149
    DD   _VTSGRY_P
TSPANT1A:
    DD  TSPANT1A_SUB-st_pieces,0
TSPANT1A_SUB:
    DD TSPANT1A_IMG-st_pieces
    DW 18, 15, 39, -155
    DD   _VTSYEL_P
TSPANT1B:
    DD  TSPANT1B_SUB-st_pieces,0
TSPANT1B_SUB:
    DD TSPANT1B_IMG-st_pieces
    DW 17, 13, -13, -157
    DD   _VTSYEL_P

    ;CNOP 0,4
    include ..\attract\vs\vsst.psi


    END_OVERLAY
    end

