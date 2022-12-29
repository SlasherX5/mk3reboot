;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Blood Animation Textures
;******************************************************************************/

 	include win95.i  ;: mkbloodt.s
    include mkchar.i

    EXTERN _BLOOD_P : DWORD
    EXTERN _BODY_P : DWORD
    EXTERN _CAGE_P : DWORD
    EXTERN _GBODY_P : DWORD
    EXTERN _SMDRIP_P : DWORD

	BEGIN_DATA

    ALIGN 4
    PUBLIC _blood_anims
_blood_anims:
    PUBLIC _a_face_blood
_a_face_blood:
    DD SPLAT1 - _blood_anims
    DD SPLAT2 - _blood_anims
    DD SPLAT3 - _blood_anims
    DD SPLAT4 - _blood_anims
    DD SPLAT5 - _blood_anims
    DD SPLAT6 - _blood_anims
    DD SPLAT7 - _blood_anims
    DD 0

    PUBLIC _a_decap_spray
_a_decap_spray:
    DD SPRAY1 - _blood_anims
    DD SPRAY2 - _blood_anims
    DD SPRAY3 - _blood_anims
    DD SPRAY4 - _blood_anims
    DD SPRAY5 - _blood_anims
    DD SPRAY6 - _blood_anims
;   DW SPRAY7 - _blood_anims
    DD SPRAY8 - _blood_anims
    DD SPRAY9 - _blood_anims
    DD SPRAY10 - _blood_anims
    DD SPRAY11 - _blood_anims
    DD SPRAY12 - _blood_anims
    DD SPRAY13 - _blood_anims
    DD 0

    PUBLIC _a_skinny_blood
_a_skinny_blood:
    DD SMDRIP1 - _blood_anims
    DD SMDRIP2 - _blood_anims
    DD SMDRIP3 - _blood_anims
    DD 0
    DD SMDRIP4 - _blood_anims
    DD SMDRIP5 - _blood_anims
    DD SMDRIP6 - _blood_anims
    DD SMDRIP7 - _blood_anims
    DD 0
    DD SMDRIP8 - _blood_anims
    DD SMDRIP9 - _blood_anims
    DD 0

    PUBLIC _a_bigger
_a_bigger:
    DD BIGGERBLUD1 - _blood_anims
    DD BIGGERBLUD1 - _blood_anims
    DD BIGGERBLUD2 - _blood_anims
    DD BIGGERBLUD2 - _blood_anims
    DD BIGGERBLUD3 - _blood_anims
    DD BIGGERBLUD4 - _blood_anims
    DD BIGGERBLUD5 - _blood_anims
    DD BIGGERBLUD6 - _blood_anims
    DD 0

    PUBLIC _a_drip
_a_drip:
    DD DRIP1 - _blood_anims
    DD DRIP2 - _blood_anims
    DD DRIP3 - _blood_anims
    DD DRIP4 - _blood_anims
    DD 0

    PUBLIC _a_drip_splat
_a_drip_splat:
    DD DRIP5 - _blood_anims
    DD DRIP6 - _blood_anims
    DD DRIP7 - _blood_anims
    DD 0

    PUBLIC _a_rotate_12
_a_rotate_12:
    DD bludglob1 - _blood_anims
    DD bludglob2 - _blood_anims
    DD bludglob3 - _blood_anims
    PUBLIC _a_rotate_standard
_a_rotate_standard:
    DD bludglob4 - _blood_anims
    DD bludglob5 - _blood_anims
    PUBLIC _a_rotate_9
_a_rotate_9:
    DD bludglob6 - _blood_anims
    DD bludglob7 - _blood_anims
    DD bludglob8 - _blood_anims
    PUBLIC _a_rotate_7
_a_rotate_7:
    DD bludglob9 - _blood_anims
    DD bludglob10 - _blood_anims
    DD bludglob11 - _blood_anims
    DD bludglob12 - _blood_anims
    DD 0

SPLAT1:
    DD SPLAT1_IMG - _blood_anims
    DW 7, 9, 0, 6
SPLAT2:
    DD SPLAT2_IMG - _blood_anims
    DW 15, 15, 0, 13
SPLAT3:
    DD SPLAT3_IMG - _blood_anims
    DW 25, 27, 1, 20
SPLAT4:
    DD SPLAT4_IMG - _blood_anims
    DW 26, 39,  - 3, 29
SPLAT5:
    DD SPLAT5_IMG - _blood_anims
    DW 37, 45,  - 1, 36
SPLAT6:
    DD SPLAT6_IMG - _blood_anims
    DW 39, 51,  - 5, 37
SPLAT7:
    DD SPLAT7_IMG - _blood_anims
    DW 29, 43,  - 12, 27
SPRAY1:
    DD SPRAY1_IMG - _blood_anims
    DW 9, 10,  - 3, 12
SPRAY2:
    DD SPRAY2_IMG - _blood_anims
    DW 19, 20,  - 4, 23
SPRAY3:
    DD SPRAY3_IMG - _blood_anims
    DW 25, 27,  - 4, 30
SPRAY4:
    DD SPRAY4_IMG - _blood_anims
    DW 38, 40,  - 4, 42
SPRAY5:
    DD SPRAY5_IMG - _blood_anims
    DW 52, 57,  - 4, 54
SPRAY6:
    DD SPRAY6_IMG - _blood_anims
    DW 63, 70,  - 4, 60
;SPRAY7
;   DW SPRAY7_IMG - _blood_anims
;   DH 78, 85,  - 4, 63
SPRAY8:
    DD SPRAY8_IMG - _blood_anims
    DW 90, 89,  - 5, 60
SPRAY9:
    DD SPRAY9_IMG - _blood_anims
    DW 66, 64,  - 6, 57
SPRAY10:
    DD SPRAY10_IMG - _blood_anims
    DW 76, 54,  - 9, 52
SPRAY11:
    DD SPRAY11_IMG - _blood_anims
    DW 70, 51,  - 9, 44
SPRAY12:
    DD SPRAY12_IMG - _blood_anims
    DW 54, 47,  - 17, 37
SPRAY13:
    DD SPRAY13_IMG - _blood_anims
    DW 52, 38,  - 23, 27
BIGGERBLUD1:
    DD BIGGERBLUD1_IMG - _blood_anims
    DW 21, 12, 11,  - 20
BIGGERBLUD2:
    DD BIGGERBLUD2_IMG - _blood_anims
    DW 22, 20, 18,  - 17
BIGGERBLUD3:
    DD BIGGERBLUD3_IMG - _blood_anims
    DW 16, 24, 22,  - 14
BIGGERBLUD4:
    DD BIGGERBLUD4_IMG - _blood_anims
    DW 20, 27, 30,  - 12
BIGGERBLUD5:
    DD BIGGERBLUD5_IMG - _blood_anims
    DW 18, 25, 36,  - 13
BIGGERBLUD6:
    DD BIGGERBLUD6_IMG - _blood_anims
    DW 18, 22, 42,  - 14
DRIP1:
    DD DRIP1_IMG - _blood_anims
    DW 18, 12, 0, 11
DRIP2:
    DD DRIP2_IMG - _blood_anims
    DW 11, 17, 0, 17
DRIP3:
    DD DRIP3_IMG - _blood_anims
    DW 8, 20, 2, 20
DRIP4:
    DD DRIP4_IMG - _blood_anims
    DW 6, 23, 2, 22
DRIP5:
    DD DRIP5_IMG - _blood_anims
    DW 18, 11, 8, 9
DRIP6:
    DD DRIP6_IMG - _blood_anims
    DW 24, 11, 12, 8
DRIP7:
    DD DRIP7_IMG - _blood_anims
    DW 28, 9, 14, 5
    PUBLIC _STAB1
_STAB1:
    DD STAB1_IMG - _blood_anims
    DW 6, 9, 0, 5
    DD   _BLOOD_P
    PUBLIC _BIGBLD1
_BIGBLD1:
    DD BIGBLD1_IMG - _blood_anims
    DW 14, 9, 5,  - 22
    DD   _BLOOD_P
bludglob1:
    DD bludglob1_IMG - _blood_anims
    DW 6, 18, 0, 0
bludglob2:
    DD bludglob2_IMG - _blood_anims
    DW 7, 20, 0, 0
bludglob3:
    DD bludglob3_IMG - _blood_anims
    DW 10, 17, 0, 0
bludglob4:
    DD bludglob4_IMG - _blood_anims
    DW 14, 16, 0, 0
bludglob5:
    DD bludglob5_IMG - _blood_anims
    DW 19, 12, 0, 0
bludglob6:
    DD bludglob6_IMG - _blood_anims
    DW 21, 7, 0, 0
bludglob7:
    DD bludglob7_IMG - _blood_anims
    DW 21, 9, 0, 3
bludglob8:
    DD bludglob8_IMG - _blood_anims
    DW 19, 12, 0, 6
bludglob9:
    DD bludglob9_IMG - _blood_anims
    DW 15, 15, 0, 9
bludglob10:
    DD bludglob10_IMG - _blood_anims
    DW 11, 17, 0, 10
bludglob11:
    DD bludglob11_IMG - _blood_anims
    DW 8, 20, 0, 14
bludglob12:
    DD bludglob12_IMG - _blood_anims
    DW 6, 23, 0, 15
SMDRIP1:
    DD SMDRIP1_IMG - _blood_anims
    DW 2, 5, 0, 0
    DD   _SMDRIP_P
SMDRIP2:
    DD SMDRIP2_IMG - _blood_anims
    DW 2, 9, 0, 0
    DD   _SMDRIP_P
SMDRIP3:
    DD SMDRIP3_IMG - _blood_anims
    DW 2, 13, 0, 0
    DD   _SMDRIP_P
SMDRIP4:
    DD SMDRIP4_IMG - _blood_anims
    DW 2, 13, 0, 0
    DD   _SMDRIP_P
SMDRIP5:
    DD SMDRIP5_IMG - _blood_anims
    DW 2, 13, 0, 0
    DD   _SMDRIP_P
SMDRIP6:
    DD SMDRIP6_IMG - _blood_anims
    DW 2, 13, 0, 0
    DD   _SMDRIP_P
SMDRIP7:
    DD SMDRIP7_IMG - _blood_anims
    DW 2, 13, 0, 0
    DD   _SMDRIP_P
SMDRIP8:
    DD SMDRIP8_IMG - _blood_anims
    DW 7, 10, 3,  - 3
    DD   _SMDRIP_P
SMDRIP9:
    DD SMDRIP9_IMG - _blood_anims
    DW 14, 4, 6,  - 9
    DD   _SMDRIP_P

    include .\chars\blood\mkblood.psi


    END_DATA
    end
