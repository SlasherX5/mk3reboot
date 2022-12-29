

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
tusk_pieces:
    DW  05cH,035H+18,0128H,035H+18
    DD kbflesh1a-tusk_pieces,0
    DD kbflesh1b-tusk_pieces,0
    DD kbflesh1c-tusk_pieces,0
    DD kbflesh1d-tusk_pieces,0
    DD kbflesh1e-tusk_pieces,0
    DD kbgrvest1a-tusk_pieces,0
    DD kbgrvest1b-tusk_pieces,0
    DD kbgrvest1c-tusk_pieces,0
    DD kbgrvest1d-tusk_pieces,0
    DD kbgrvest1e-tusk_pieces,0
    DD kbpants1a-tusk_pieces,_VKBBLU_P
    DD kbpants1b-tusk_pieces,_VKBBLU_P
    DD 0

kbflesh1a:
    DD  KBFLESH1A-tusk_pieces,0
kbflesh1b:
    DD  KBFLESH1B-tusk_pieces,0
kbflesh1c:
    DD  KBFLESH1C-tusk_pieces,0
kbflesh1d:
    DD  KBFLESH1D-tusk_pieces,0
kbflesh1e:
    DD  KBFLESH1E-tusk_pieces,0
kbgrvest1a:
    DD  KBGRVEST1A-tusk_pieces,0
kbgrvest1b:
    DD  KBGRVEST1B-tusk_pieces,0
kbgrvest1c:
    DD  KBGRVEST1C-tusk_pieces,0
kbgrvest1d:
    DD  KBGRVEST1D-tusk_pieces,0
kbgrvest1e:
    DD  KBGRVEST1E-tusk_pieces,0
kbpants1a:
    DD  KBPANTS1A-tusk_pieces,0
kbpants1b:
    DD  KBPANTS1B-tusk_pieces,0

KBFLESH1A:
    DD  KBFLESH1A_SUB-tusk_pieces,0
KBFLESH1A_SUB:
    DD KBFLESH1A_IMG-tusk_pieces
    DW 26, 62, 78, -64
    DD   _VKBSKIN_P
KBFLESH1B:
    DD  KBFLESH1B_SUB-tusk_pieces,0
KBFLESH1B_SUB:
    DD KBFLESH1B_IMG-tusk_pieces
    DW 26, 15, -7, -11
    DD   _VKBSKIN_P
KBFLESH1C:
    DD  KBFLESH1C_SUB-tusk_pieces,0
KBFLESH1C_SUB:
    DD KBFLESH1C_IMG-tusk_pieces
    DW 6, 13, -29, -70
    DD   _VKBSKIN_P
KBFLESH1D:
    DD  KBFLESH1D_SUB-tusk_pieces,0
KBFLESH1D_SUB:
    DD KBFLESH1D_IMG-tusk_pieces
    DW 47, 83, 19, -43
    DD   _VKBSKIN_P
KBFLESH1E:
    DD  KBFLESH1E_SUB-tusk_pieces,0
KBFLESH1E_SUB:
    DD KBFLESH1E_IMG-tusk_pieces
    DW 41, 51, -45, -85
    DD   _VKBSKIN_P
KBGRVEST1A:
    DD  KBGRVEST1A_SUB-tusk_pieces,0
KBGRVEST1A_SUB:
    DD KBGRVEST1A_IMG-tusk_pieces
    DW 21, 31, -68, -58
    DD   _VKBGRAY_P
KBGRVEST1B:
    DD  KBGRVEST1B_SUB-tusk_pieces,0
KBGRVEST1B_SUB:
    DD KBGRVEST1B_IMG-tusk_pieces
    DW 44, 140, 70, -39
    DD   _VKBGRAY_P
KBGRVEST1C:
    DD  KBGRVEST1C_SUB-tusk_pieces,0
KBGRVEST1C_SUB:
    DD KBGRVEST1C_IMG-tusk_pieces
    DW 38, 169, 8, -10
    DD   _VKBGRAY_P
KBGRVEST1D:
    DD  KBGRVEST1D_SUB-tusk_pieces,0
KBGRVEST1D_SUB:
    DD KBGRVEST1D_IMG-tusk_pieces
    DW 18, 152, 26, -27
    DD   _VKBGRAY_P
KBGRVEST1E:
    DD  KBGRVEST1E_SUB-tusk_pieces,0
KBGRVEST1E_SUB:
    DD KBGRVEST1E_IMG-tusk_pieces
    DW 33, 122, -29, -15
    DD   _VKBGRAY_P
KBPANTS1A:
    DD  KBPANTS1A_SUB-tusk_pieces,0
KBPANTS1A_SUB:
    DD KBPANTS1A_IMG-tusk_pieces
    DW 19, 11, 72, -168
    DD   _VKBTAN_P
KBPANTS1B:
    DD  KBPANTS1B_SUB-tusk_pieces,0
KBPANTS1B_SUB:
    DD KBPANTS1B_IMG-tusk_pieces
    DW 30, 27, 41, -152
    DD   _VKBTAN_P

    ;CNOP 0,4
    include ..\attract\vs\vstusk.psi



    END_OVERLAY
    end

