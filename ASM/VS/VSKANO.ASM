

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
kano_pieces:
    DW  05eH,04dH,012dH,04dH
    DD bgkano1a-kano_pieces,0
    DD bgkano1b-kano_pieces,0
    DD bgkano1c-kano_pieces,0
    DD bgkano1d-kano_pieces,0
    DD bgkano2a-kano_pieces,_BGKNBLU_P
    DD bgkano2b-kano_pieces,_BGKNBLU_P
    DD bgkano2c-kano_pieces,_BGKNBLU_P
    DD bgkano2d-kano_pieces,_BGKNBLU_P
    DD bgkano2e-kano_pieces,_BGKNBLU_P
    DD bgkano3a-kano_pieces,0
    DD bgkano3b-kano_pieces,0
    DD bgkano3c-kano_pieces,0
    DD bgkano3d-kano_pieces,0
    DD bgkano4a-kano_pieces,0
    DD 0

bgkano1a:
    DD  BGKANO1A-kano_pieces,0
bgkano1b:
    DD  BGKANO1B-kano_pieces,0
bgkano1c:
    DD  BGKANO1C-kano_pieces,0
bgkano1d:
    DD  BGKANO1D-kano_pieces,0
bgkano2a:
    DD  BGKANO2A-kano_pieces,0
bgkano2b:
    DD  BGKANO2B-kano_pieces,0
bgkano2c:
    DD  BGKANO2C-kano_pieces,0
bgkano2d:
    DD  BGKANO2D-kano_pieces,0
bgkano2e:
    DD  BGKANO2E-kano_pieces,0
bgkano3a:
    DD  BGKANO3A-kano_pieces,0
bgkano3b:
    DD  BGKANO3B-kano_pieces,0
bgkano3c:
    DD  BGKANO3C-kano_pieces,0
bgkano3d:
    DD  BGKANO3D-kano_pieces,0
bgkano4a:
    DD  BGKANO4A-kano_pieces,0


BGKANO1A:
    DD  BGKANO1A_SUB-kano_pieces,0
BGKANO1A_SUB:
    DD BGKANO1A_IMG-kano_pieces
    DW 45, 67, 66, -35
    DD   _BGKANO1_P
BGKANO1B:
    DD  BGKANO1B_SUB-kano_pieces,0
BGKANO1B_SUB:
    DD BGKANO1B_IMG-kano_pieces
    DW 43, 82, -2, -7
    DD   _BGKANO1_P
BGKANO1C:
    DD  BGKANO1C_SUB-kano_pieces,0
BGKANO1C_SUB:
    DD BGKANO1C_IMG-kano_pieces
    DW 12, 60, -45, -9
    DD   _BGKANO1_P
BGKANO1D:
    DD  BGKANO1D_SUB-kano_pieces,0
BGKANO1D_SUB:
    DD BGKANO1D_IMG-kano_pieces
    DW 38, 65, -31, -93
    DD   _BGKANO1_P
BGKANO2A:
    DD  BGKANO2A_SUB-kano_pieces,0
BGKANO2A_SUB:
    DD BGKANO2A_IMG-kano_pieces
    DW 28, 44, 70, -55
    DD   _BGKANO2_P
BGKANO2B:
    DD  BGKANO2B_SUB-kano_pieces,0
BGKANO2B_SUB:
    DD BGKANO2B_IMG-kano_pieces
    DW 22, 67, 24, -30
    DD   _BGKANO2_P
BGKANO2C:
    DD  BGKANO2C_SUB-kano_pieces,0
BGKANO2C_SUB:
    DD BGKANO2C_IMG-kano_pieces
    DW 2, 9, -1, -79
    DD   _BGKANO2_P
BGKANO2D:
    DD  BGKANO2D_SUB-kano_pieces,0
BGKANO2D_SUB:
    DD BGKANO2D_IMG-kano_pieces
    DW 16, 37, 68, -137
    DD   _BGKANO2_P
BGKANO2E:
    DD  BGKANO2E_SUB-kano_pieces,0
BGKANO2E_SUB:
    DD BGKANO2E_IMG-kano_pieces
    DW 78, 93, 3, -81
    DD   _BGKANO2_P
BGKANO3A:
    DD  BGKANO3A_SUB-kano_pieces,0
BGKANO3A_SUB:
    DD BGKANO3A_IMG-kano_pieces
    DW 25, 36, 68, -59
    DD   _BGKANO3_P
BGKANO3B:
    DD  BGKANO3B_SUB-kano_pieces,0
BGKANO3B_SUB:
    DD BGKANO3B_IMG-kano_pieces
    DW 77, 137, 64, -37
    DD   _BGKANO3_P
BGKANO3C:
    DD  BGKANO3C_SUB-kano_pieces,0
BGKANO3C_SUB:
    DD BGKANO3C_IMG-kano_pieces
    DW 28, 36, -44, -114
    DD   _BGKANO3_P
BGKANO3D:
    DD  BGKANO3D_SUB-kano_pieces,0
BGKANO3D_SUB:
    DD BGKANO3D_IMG-kano_pieces
    DW 46, 117, -12, -23
    DD   _BGKANO3_P
BGKANO4A:
    DD  BGKANO4A_SUB-kano_pieces,0
BGKANO4A_SUB:
    DD BGKANO4A_IMG-kano_pieces
    DW 63, 72, 10, -39
    DD   _BGKANO4_P

    ;CNOP 0,4
    include ..\attract\vs\vskano.psi



    END_OVERLAY
    end

