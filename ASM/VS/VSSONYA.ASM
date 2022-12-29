

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
sonya_pieces:
    DW  05eH,04fH,012dH,04fH
    DD bgsonya1a-sonya_pieces,0
    DD bgsonya1b-sonya_pieces,0
    DD bgsonya1c-sonya_pieces,0
    DD bgsonya1d-sonya_pieces,0
    DD bgsonya1e-sonya_pieces,0
    DD bgsonya1f-sonya_pieces,0
    DD bgsonya2a-sonya_pieces,_BGSNBLU_P
    DD bgsonya2b-sonya_pieces,_BGSNBLU_P
    DD bgsonya2c-sonya_pieces,_BGSNBLU_P
    DD bgsonya2d-sonya_pieces,_BGSNBLU_P
    DD bgsonya3a-sonya_pieces,0
    DD bgsonya3b-sonya_pieces,0
    DD bgsonya3c-sonya_pieces,0
    DD bgsonya3d-sonya_pieces,0
    DD bgsonya3e-sonya_pieces,0
    DD bgsonya3f-sonya_pieces,0
    DD bgsonya3g-sonya_pieces,0
    DD 0

bgsonya1a:
    DD  BGSONYA1A-sonya_pieces,0
bgsonya1b:
    DD  BGSONYA1B-sonya_pieces,0
bgsonya1c:
    DD  BGSONYA1C-sonya_pieces,0
bgsonya1d:
    DD  BGSONYA1D-sonya_pieces,0
bgsonya1e:
    DD  BGSONYA1E-sonya_pieces,0
bgsonya1f:
    DD  BGSONYA1F-sonya_pieces,0
bgsonya2a:
    DD  BGSONYA2A-sonya_pieces,0
bgsonya2b:
    DD  BGSONYA2B-sonya_pieces,0
bgsonya2c:
    DD  BGSONYA2C-sonya_pieces,0
bgsonya2d:
    DD  BGSONYA2D-sonya_pieces,0
bgsonya3a:
    DD  BGSONYA3A-sonya_pieces,0
bgsonya3b:
    DD  BGSONYA3B-sonya_pieces,0
bgsonya3c:
    DD  BGSONYA3C-sonya_pieces,0
bgsonya3d:
    DD  BGSONYA3D-sonya_pieces,0
bgsonya3e:
    DD  BGSONYA3E-sonya_pieces,0
bgsonya3f:
    DD  BGSONYA3F-sonya_pieces,0
bgsonya3g:
    DD  BGSONYA3G-sonya_pieces,0

BGSONYA1A:
    DD  BGSONYA1A_SUB-sonya_pieces,0
BGSONYA1A_SUB:
    DD BGSONYA1A_IMG-sonya_pieces
    DW 64, 104, 75, -5
    DD   _BGSON1_P
BGSONYA1B:
    DD  BGSONYA1B_SUB-sonya_pieces,0
BGSONYA1B_SUB:
    DD BGSONYA1B_IMG-sonya_pieces
    DW 26, 70, 11, -2
    DD   _BGSON1_P
BGSONYA1C:
    DD  BGSONYA1C_SUB-sonya_pieces,0
BGSONYA1C_SUB:
    DD BGSONYA1C_IMG-sonya_pieces
    DW 20, 53, -13, -9
    DD   _BGSON1_P
BGSONYA1D:
    DD  BGSONYA1D_SUB-sonya_pieces,0
BGSONYA1D_SUB:
    DD BGSONYA1D_IMG-sonya_pieces
    DW 53, 31, 37, -124
    DD   _BGSON1_P
BGSONYA1E:
    DD  BGSONYA1E_SUB-sonya_pieces,0
BGSONYA1E_SUB:
    DD BGSONYA1E_IMG-sonya_pieces
    DW 34, 59, -16, -73
    DD   _BGSON1_P
BGSONYA1F:
    DD  BGSONYA1F_SUB-sonya_pieces,0
BGSONYA1F_SUB:
    DD BGSONYA1F_IMG-sonya_pieces
    DW 36, 39, -49, -93
    DD   _BGSON1_P
BGSONYA2A:
    DD  BGSONYA2A_SUB-sonya_pieces,0
BGSONYA2A_SUB:
    DD BGSONYA2A_IMG-sonya_pieces
    DW 6, 3, 51, -78
    DD   _BGSON2_P
BGSONYA2B:
    DD  BGSONYA2B_SUB-sonya_pieces,0
BGSONYA2B_SUB:
    DD BGSONYA2B_IMG-sonya_pieces
    DW 30, 37, 61, -136
    DD   _BGSON2_P
BGSONYA2C:
    DD  BGSONYA2C_SUB-sonya_pieces,0
BGSONYA2C_SUB:
    DD BGSONYA2C_IMG-sonya_pieces
    DW 34, 64, 22, -64
    DD   _BGSON2_P
BGSONYA2D:
    DD  BGSONYA2D_SUB-sonya_pieces,0
BGSONYA2D_SUB:
    DD BGSONYA2D_IMG-sonya_pieces
    DW 18, 59, -11, -70
    DD   _BGSON2_P
BGSONYA3A:
    DD  BGSONYA3A_SUB-sonya_pieces,0
BGSONYA3A_SUB:
    DD BGSONYA3A_IMG-sonya_pieces
    DW 7, 32, 34, -92
    DD   _BGSON3_P
BGSONYA3B:
    DD  BGSONYA3B_SUB-sonya_pieces,0
BGSONYA3B_SUB:
    DD BGSONYA3B_IMG-sonya_pieces
    DW 20, 70, 30, -57
    DD   _BGSON3_P
BGSONYA3C:
    DD  BGSONYA3C_SUB-sonya_pieces,0
BGSONYA3C_SUB:
    DD BGSONYA3C_IMG-sonya_pieces
    DW 38, 36, 43, -137
    DD   _BGSON3_P
BGSONYA3D:
    DD  BGSONYA3D_SUB-sonya_pieces,0
BGSONYA3D_SUB:
    DD BGSONYA3D_IMG-sonya_pieces
    DW 10, 21, 5, -151
    DD   _BGSON3_P
BGSONYA3E:
    DD  BGSONYA3E_SUB-sonya_pieces,0
BGSONYA3E_SUB:
    DD BGSONYA3E_IMG-sonya_pieces
    DW 16, 84, 10, -29
    DD   _BGSON3_P
BGSONYA3F:
    DD  BGSONYA3F_SUB-sonya_pieces,0
BGSONYA3F_SUB:
    DD BGSONYA3F_IMG-sonya_pieces
    DW 37, 91, -5, -24
    DD   _BGSON3_P
BGSONYA3G:
    DD  BGSONYA3G_SUB-sonya_pieces,0
BGSONYA3G_SUB:
    DD BGSONYA3G_IMG-sonya_pieces
    DW 15, 26, -72, -85
    DD   _BGSON3_P

    ;CNOP 0,4
    include ..\attract\vs\vssonya.psi



    END_OVERLAY
    end

