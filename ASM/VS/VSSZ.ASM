

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
sz_pieces:
    DW  063H,02dH+27,0125H,02dH+27
    DD szblue1a-sz_pieces,_VSZGRN_P
    DD szblue1b-sz_pieces,_VSZGRN_P
    DD szblue1c-sz_pieces,_VSZGRN_P
    DD szblue1d-sz_pieces,_VSZGRN_P
    DD szflesh1a-sz_pieces,0
    DD szflesh1b-sz_pieces,0
    DD szflesh1c-sz_pieces,0
    DD szflesh1d-sz_pieces,0
    DD szflesh1e-sz_pieces,0
    DD szflesh1f-sz_pieces,0
    DD szflesh1g-sz_pieces,0
    DD szflesh1h-sz_pieces,0
    DD szgrey1a-sz_pieces,0
    DD szgrey1b-sz_pieces,0
    DD szgrey1c-sz_pieces,0
    DD szgrey1d-sz_pieces,0
    DD szgrey1e-sz_pieces,0
    DD szgrey1f-sz_pieces,0
    DD szgrey1g-sz_pieces,0
    DD 0

szblue1a:
    DD  SZBLUE1A-sz_pieces,0
szblue1b:
    DD  SZBLUE1B-sz_pieces,0
szblue1c:
    DD  SZBLUE1C-sz_pieces,0
szblue1d:
    DD  SZBLUE1D-sz_pieces,0
szflesh1a:
    DD  SZFLESH1A-sz_pieces,0
szflesh1b:
    DD  SZFLESH1B-sz_pieces,0
szflesh1c:
    DD  SZFLESH1C-sz_pieces,0
szflesh1d:
    DD  SZFLESH1D-sz_pieces,0
szflesh1e:
    DD  SZFLESH1E-sz_pieces,0
szflesh1f:
    DD  SZFLESH1F-sz_pieces,0
szflesh1g:
    DD  SZFLESH1G-sz_pieces,0
szflesh1h:
    DD  SZFLESH1H-sz_pieces,0
szgrey1a:
    DD  SZGREY1A-sz_pieces,0
szgrey1b:
    DD  SZGREY1B-sz_pieces,0
szgrey1c:
    DD  SZGREY1C-sz_pieces,0
szgrey1d:
    DD  SZGREY1D-sz_pieces,0
szgrey1e:
    DD  SZGREY1E-sz_pieces,0
szgrey1f:
    DD  SZGREY1F-sz_pieces,0
szgrey1g:
    DD  SZGREY1G-sz_pieces,0

SZBLUE1A:
    DD  SZBLUE1A_SUB-sz_pieces,0
SZBLUE1A_SUB:
    DD SZBLUE1A_IMG-sz_pieces
    DW 30, 22, 60, -155
    DD   _VSZBLU_P
SZBLUE1B:
    DD  SZBLUE1B_SUB-sz_pieces,0
SZBLUE1B_SUB:
    DD SZBLUE1B_IMG-sz_pieces
    DW 50, 104, 52, -45
    DD   _VSZBLU_P
SZBLUE1C:
    DD  SZBLUE1C_SUB-sz_pieces,0
SZBLUE1C_SUB:
    DD SZBLUE1C_IMG-sz_pieces
    DW 8, 40, 2, -47
    DD   _VSZBLU_P
SZBLUE1D:
    DD  SZBLUE1D_SUB-sz_pieces,0
SZBLUE1D_SUB:
    DD SZBLUE1D_IMG-sz_pieces
    DW 36, 65, 2, -80
    DD   _VSZBLU_P
SZFLESH1A:
    DD  SZFLESH1A_SUB-sz_pieces,0
SZFLESH1A_SUB:
    DD SZFLESH1A_IMG-sz_pieces
    DW 31, 21, 36, -9
    DD   _VSZSKN_P
SZFLESH1B:
    DD  SZFLESH1B_SUB-sz_pieces,0
SZFLESH1B_SUB:
    DD SZFLESH1B_IMG-sz_pieces
    DW 28, 28, 34, -120
    DD   _VSZSKN_P
SZFLESH1C:
    DD  SZFLESH1C_SUB-sz_pieces,0
SZFLESH1C_SUB:
    DD SZFLESH1C_IMG-sz_pieces
    DW 75, 116, 88, -12
    DD   _VSZSKN_P
SZFLESH1D:
    DD  SZFLESH1D_SUB-sz_pieces,0
SZFLESH1D_SUB:
    DD SZFLESH1D_IMG-sz_pieces
    DW 2, 13, 13, -45
    DD   _VSZSKN_P
SZFLESH1E:
    DD  SZFLESH1E_SUB-sz_pieces,0
SZFLESH1E_SUB:
    DD SZFLESH1E_IMG-sz_pieces
    DW 15, 32, -62, -121
    DD   _VSZSKN_P
SZFLESH1F:
    DD  SZFLESH1F_SUB-sz_pieces,0
SZFLESH1F_SUB:
    DD SZFLESH1F_IMG-sz_pieces
    DW 33, 87, 11, -38
    DD   _VSZSKN_P
SZFLESH1G:
    DD  SZFLESH1G_SUB-sz_pieces,0
SZFLESH1G_SUB:
    DD SZFLESH1G_IMG-sz_pieces
    DW 45, 78, -13, -99
    DD   _VSZSKN_P
SZFLESH1H:
    DD  SZFLESH1H_SUB-sz_pieces,0
SZFLESH1H_SUB:
    DD SZFLESH1H_IMG-sz_pieces
    DW 29, 54, -21, -29
    DD   _VSZSKN_P
SZGREY1A:
    DD  SZGREY1A_SUB-sz_pieces,0
SZGREY1A_SUB:
    DD SZGREY1A_IMG-sz_pieces
    DW 51, 34, 83, -11
    DD   _VSZGRY_P
SZGREY1B:
    DD  SZGREY1B_SUB-sz_pieces,0
SZGREY1B_SUB:
    DD SZGREY1B_IMG-sz_pieces
    DW 38, 60, 94, -117
    DD   _VSZGRY_P
SZGREY1C:
    DD  SZGREY1C_SUB-sz_pieces,0
SZGREY1C_SUB:
    DD SZGREY1C_IMG-sz_pieces
    DW 54, 131, 56, -47
    DD   _VSZGRY_P
SZGREY1D:
    DD  SZGREY1D_SUB-sz_pieces,0
SZGREY1D_SUB:
    DD SZGREY1D_IMG-sz_pieces
    DW 46, 51, -3, -13
    DD   _VSZGRY_P
SZGREY1E:
    DD  SZGREY1E_SUB-sz_pieces,0
SZGREY1E_SUB:
    DD SZGREY1E_IMG-sz_pieces
    DW 6, 20, 2, -67
    DD   _VSZGRY_P
SZGREY1F:
    DD  SZGREY1F_SUB-sz_pieces,0
SZGREY1F_SUB:
    DD SZGREY1F_IMG-sz_pieces
    DW 36, 61, 2, -83
    DD   _VSZGRY_P
SZGREY1G:
    DD  SZGREY1G_SUB-sz_pieces,0
SZGREY1G_SUB:
    DD SZGREY1G_IMG-sz_pieces
    DW 46, 36, -23, -142
    DD   _VSZGRY_P

    ;CNOP 0,4
    include ..\attract\vs\vssz.psi



    END_OVERLAY
    end

