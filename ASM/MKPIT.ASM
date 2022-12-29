;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Pit Module
;******************************************************************************/

     

 	include win95.i  ;: mkpit.s
    include mkchar.i
    include mkbkgd.i

;*********************************
;**         EXTERNALS           **
;*********************************
    EXTERN  _calla_pit : DWORD

;*********************************
;**         PALETTES
;*********************************

    EXTERN _MKTHRONE_CLT : DWORD
    EXTERN  _BGHD3_P : DWORD
    EXTERN _BLDXPD_P : DWORD
    EXTERN  _BODY_P : DWORD
    EXTERN  _CAGE_P : DWORD
    EXTERN  _GBODY_P : DWORD
    EXTERN  _SAW_P : DWORD

	BEGIN_DATA

;*********************************
;**         ANIMATIONS          **
;*********************************
    ALIGN 4
    PUBLIC _pit_anims
_pit_anims:
base_anims:
    DD _a_saw - _pit_anims
    PUBLIC _a_saw
_a_saw:
;   DW SAW1 - _pit_anims
    DD _SAW2 - _pit_anims
;   DW SAW3 - _pit_anims
    DD _SAW4 - _pit_anims
;   DW SAW5 - _pit_anims
    DD _SAW6 - _pit_anims
    DD 0
;SAW1
;   DW SAW1_TPG - _pit_anims
;   DH 167, 79, 85, 79
;   dw _SAW_P
    PUBLIC _SAW2
_SAW2:
    DD _SAW2_TPG - _pit_anims
    DW 151, 79, 65, 79
    DD _SAW_P
_SAW2_TPG:
    DW  2,     1,     1,   0
;SAW3
;   DW SAW3_TPG - _pit_anims
;   DH 155, 77, 71, 77
    PUBLIC _SAW4
_SAW4:
    DD _SAW4_TPG - _pit_anims
    DW 155, 74, 77, 74
_SAW4_TPG:
    DW  0,     1,   143,   0
;SAW5
;   DW SAW5_TPG - _pit_anims
;   DH 155, 76, 80, 76
    PUBLIC _SAW6
_SAW6:
    DD _SAW6_TPG - _pit_anims
    DW 152, 78, 83, 78
_SAW6_TPG:
    DW  1,     1,   122,   0
    PUBLIC _THRONEWALL
_THRONEWALL:
    DD _THRONEWALL_TPG - _pit_anims
    DW 183, 71, 0, 0
    DD _BGHD3_P
_THRONEWALL_TPG:
        DW  0,     1,    72,   0

;*****************************************************
    PUBLIC _a_arm
_a_arm:              ; not used?
    DD _ARM01 - base_anims
    DD ARM02 - base_anims
    DD ARM03 - base_anims
    DD ARM04 - base_anims
    DD ARM05 - base_anims
    DD ARM06 - base_anims
    DD ARM07 - base_anims
    DD ARM08 - base_anims
    DD ARM09 - base_anims
    DD ARM10 - base_anims
    DD ARM11 - base_anims
    DD ARM12 - base_anims
    DD ani_jump
    DD _a_arm - base_anims
    DD 0

    PUBLIC _a_arm_land
_a_arm_land:             ; not used
    DD ARM13 - base_anims
    DD ARM14 - base_anims
    DD ARM15 - base_anims
    DD ARM16 - base_anims
    DD ARM17 - base_anims
    DD ARM18 - base_anims
    DD ARM19 - base_anims
    DD 0

    PUBLIC _a_arm2
_a_arm2:
    DD _ARM_B01 - base_anims
    DD ARM_B02 - base_anims
    DD ARM_B03 - base_anims
    DD ARM_B04 - base_anims
    DD ARM_B05 - base_anims
    DD ARM_B06 - base_anims
    DD ARM_B07 - base_anims
    DD ARM_B08 - base_anims
    DD ARM_B09 - base_anims
    DD ARM_B10 - base_anims
    DD ARM_B11 - base_anims
    DD ARM_B12 - base_anims
    DD ani_jump
    DD _a_arm2 - base_anims
    DD 0

    PUBLIC _a_leg
_a_leg:
    DD _LEG01 - base_anims
    DD LEG02 - base_anims
    DD LEG03 - base_anims
    DD LEG04 - base_anims
    DD LEG05 - base_anims
    DD LEG06 - base_anims
    DD LEG07 - base_anims
    DD LEG08 - base_anims
    DD LEG09 - base_anims
    DD LEG10 - base_anims
    DD LEG11 - base_anims
    DD LEG12 - base_anims
    DD ani_jump
    DD _a_leg - base_anims
    DD LEG13 - base_anims
    DD LEG14 - base_anims
    DD LEG15 - base_anims
    DD LEG16 - base_anims
    DD LEG17 - base_anims
    DD LEG18 - base_anims
    DD 0

    PUBLIC _a_leg2   ; not used
_a_leg2:
    DD _LEG_B01 - base_anims
    DD LEG_B02 - base_anims
    DD LEG_B03 - base_anims
    DD LEG_B04 - base_anims
    DD LEG_B05 - base_anims
    DD LEG_B06 - base_anims
    DD LEG_B07 - base_anims
    DD LEG_B08 - base_anims
    DD LEG_B09 - base_anims
    DD LEG_B10 - base_anims
    DD LEG_B11 - base_anims
    DD LEG_B12 - base_anims
    DD ani_jump
    DD _a_leg2 - base_anims
    DD 0

    PUBLIC _a_limb
_a_limb:             ; not used
    DD _XLIMB01 - base_anims
    DD XLIMB02 - base_anims
    DD XLIMB03 - base_anims
    DD XLIMB04 - base_anims
    DD XLIMB05 - base_anims
    DD XLIMB06 - base_anims
    DD XLIMB07 - base_anims
    DD XLIMB08 - base_anims
    DD XLIMB09 - base_anims
    DD XLIMB10 - base_anims
    DD XLIMB11 - base_anims
    DD XLIMB12 - base_anims
    DD ani_jump
    DD _a_limb - base_anims
    DD 0

    PUBLIC _a_bone
_a_bone:
    DD _BONE01 - base_anims
    DD BONE02 - base_anims
    DD BONE03 - base_anims
    DD BONE04 - base_anims
    DD BONE05 - base_anims
    DD BONE06 - base_anims
    DD BONE07 - base_anims
    DD BONE08 - base_anims
    DD BONE09 - base_anims
    DD BONE10 - base_anims
    DD BONE11 - base_anims
    DD BONE12 - base_anims
    DD 0
    DD ani_jump
    DD _a_bone - base_anims
    DD ani_jump
    DD _a_bone - base_anims

    PUBLIC _a_rib_cage
_a_rib_cage:
    DD _CAGE01 - base_anims
    DD CAGE02 - base_anims
    DD CAGE03 - base_anims
    DD CAGE04 - base_anims
    DD CAGE05 - base_anims
    DD CAGE06 - base_anims
    DD CAGE07 - base_anims
    DD CAGE08 - base_anims
    DD CAGE09 - base_anims
    DD CAGE10 - base_anims
    DD CAGE11 - base_anims
    DD CAGE12 - base_anims
    DD ani_jump
    DD _a_rib_cage - base_anims
    DD CAGE13 - base_anims
    DD CAGE14 - base_anims
    DD CAGE15 - base_anims
    DD CAGE16 - base_anims
    DD CAGE17 - base_anims
    DD CAGE18 - base_anims
    DD CAGE19 - base_anims
    DD CAGE20 - base_anims
    DD CAGE21 - base_anims
    DD CAGE22 - base_anims
    DD CAGE23 - base_anims
    DD CAGE24 - base_anims
    DD 0

    PUBLIC _a_blood_explode
_a_blood_explode:
    DD BLDXPD1 - base_anims
    DD BLDXPD2 - base_anims
    DD BLDXPD3 - base_anims
    DD BLDXPD4 - base_anims
    DD BLDXPD5 - base_anims
    DD BLDXPD6 - base_anims
    DD BLDXPD7 - base_anims
    DD BLDXPD8 - base_anims
    DD BLDXPD9 - base_anims
;   DW BLDXPD10 - base_anims
;   DW BLDXPD11 - base_anims
;   DW BLDXPD12 - base_anims
;   DW BLDXPD13 - base_anims
    DD 0

    PUBLIC _a_skull
    PUBLIC _a_pork
_a_pork:
_a_skull:
    DD _SKULL01 - base_anims
    DD SKULL02 - base_anims
    DD SKULL03 - base_anims
    DD SKULL04 - base_anims
    DD SKULL05 - base_anims
    DD SKULL06 - base_anims
    DD SKULL07 - base_anims
    DD SKULL08 - base_anims
    DD SKULL09 - base_anims
    DD SKULL10 - base_anims
    DD SKULL11 - base_anims
    DD SKULL12 - base_anims
    DD ani_jump
    DD _a_skull - base_anims

    PUBLIC _a_goro_arm
_a_goro_arm:
    DD _GOROARM02 - base_anims
    DD GOROARM03 - base_anims
    DD GOROARM04 - base_anims
    DD GOROARM05 - base_anims
    DD GOROARM06 - base_anims
    DD GOROARM07 - base_anims
    DD GOROARM08 - base_anims
    DD GOROARM09 - base_anims
    DD GOROARM10 - base_anims
    DD GOROARM11 - base_anims
    DD GOROARM12 - base_anims
    DD ani_jump
    DD _a_goro_arm - base_anims

    PUBLIC _ARM01
_ARM01:
    DD ARM01_IMG - base_anims
    DW 18, 22, 10, 11
    DD   _BODY_P
ARM02:
    DD ARM02_IMG - base_anims
    DW 11, 21, 6, 10
ARM03:
    DD ARM03_IMG - base_anims
    DW 11, 23, 6, 11
ARM04:
    DD ARM04_IMG - base_anims
    DW 19, 24, 8, 11
ARM05:
    DD ARM05_IMG - base_anims
    DW 23, 26, 9, 11
ARM06:
    DD ARM06_IMG - base_anims
    DW 22, 26, 7, 11
ARM07:
    DD ARM07_IMG - base_anims
    DW 18, 25, 6, 11
ARM08:
    DD ARM08_IMG - base_anims
    DW 10, 23, 4, 11
ARM09:
    DD ARM09_IMG - base_anims
    DW 11, 22, 4, 11
ARM10:
    DD ARM10_IMG - base_anims
    DW 18, 22, 8, 11
ARM11:
    DD ARM11_IMG - base_anims
    DW 22, 22, 11, 11
ARM12:
    DD ARM12_IMG - base_anims
    DW 21, 22, 12, 11
ARM13:
    DD ARM13_IMG - base_anims
    DW 18, 19, 11, 4
ARM14:
    DD ARM14_IMG - base_anims
    DW 11, 17, 6,  - 1
ARM15:
    DD ARM15_IMG - base_anims
    DW 14, 15, 6,  - 6
ARM16:
    DD ARM16_IMG - base_anims
    DW 23, 12, 10,  - 11
ARM17:
    DD ARM17_IMG - base_anims
    DW 28, 8, 11,  - 14
ARM18:
    DD ARM18_IMG - base_anims
    DW 35, 9, 13,  - 15
ARM19:
    DD ARM19_IMG - base_anims
    DW 34, 9, 13,  - 14

    PUBLIC _ARM_B01
_ARM_B01:
    DD ARM_B01_IMG - base_anims
    DW 13, 25, 6, 14
    DD   _BODY_P
ARM_B02:
    DD ARM_B02_IMG - base_anims
    DW 23, 18, 11, 10
ARM_B03:
    DD ARM_B03_IMG - base_anims
    DW 28, 10, 15, 6
ARM_B04:
    DD ARM_B04_IMG - base_anims
    DW 26, 12, 15, 6
ARM_B05:
    DD ARM_B05_IMG - base_anims
    DW 20, 23, 13, 9
ARM_B06:
    DD ARM_B06_IMG - base_anims
    DW 11, 29, 8, 11
ARM_B07:
    DD ARM_B07_IMG - base_anims
    DW 14, 27, 6, 9
ARM_B08:
    DD ARM_B08_IMG - base_anims
    DW 26, 19, 10, 6
ARM_B09:
    DD ARM_B09_IMG - base_anims
    DW 30, 10, 11, 3
ARM_B10:
    DD ARM_B10_IMG - base_anims
    DW 26, 12, 10, 5
ARM_B11:
    DD ARM_B11_IMG - base_anims
    DW 19, 21, 7, 11
ARM_B12:
    DD ARM_B12_IMG - base_anims
    DW 10, 26, 4, 14

    PUBLIC _LEG01
_LEG01:
    DD LEG01_IMG - base_anims
    DW 15, 29, 7, 11
    DD   _BODY_P
LEG02:
    DD LEG02_IMG - base_anims
    DW 19, 30, 9, 11
LEG03:
    DD LEG03_IMG - base_anims
    DW 21, 31, 10, 11
LEG04:
    DD LEG04_IMG - base_anims
    DW 19, 32, 10, 12
LEG05:
    DD LEG05_IMG - base_anims
    DW 19, 32, 10, 12
LEG06:
    DD LEG06_IMG - base_anims
    DW 14, 32, 7, 12
LEG07:
    DD LEG07_IMG - base_anims
    DW 14, 33, 8, 13
LEG08:
    DD LEG08_IMG - base_anims
    DW 18, 31, 11, 12
LEG09:
    DD LEG09_IMG - base_anims
    DW 20, 31, 11, 12
LEG10:
    DD LEG10_IMG - base_anims
    DW 20, 31, 12, 12
LEG11:
    DD LEG11_IMG - base_anims
    DW 19, 29, 11, 11
LEG12:
    DD LEG12_IMG - base_anims
    DW 14, 29, 8, 11
LEG13:
    DD LEG13_IMG - base_anims
    DW 18, 26, 9, 6
LEG14:
    DD LEG14_IMG - base_anims
    DW 28, 25, 14, 2
LEG15:
    DD LEG15_IMG - base_anims
    DW 31, 25, 16,  - 2
LEG16:
    DD LEG16_IMG - base_anims
    DW 24, 23, 12,  - 5
LEG17:
    DD LEG17_IMG - base_anims
    DW 15, 20, 7,  - 9
LEG18:
    DD LEG18_IMG - base_anims
    DW 25, 14, 17,  - 14

    PUBLIC _LEG_B01
_LEG_B01:
    DD LEG_B01_IMG - base_anims
    DW 18, 31, 9, 15
    DD   _BODY_P
LEG_B02:
    DD LEG_B02_IMG - base_anims
    DW 14, 33, 10, 14
LEG_B03:
    DD LEG_B03_IMG - base_anims
    DW 22, 29, 13, 11
LEG_B04:
    DD LEG_B04_IMG - base_anims
    DW 30, 20, 17, 6
LEG_B05:
    DD LEG_B05_IMG - base_anims
    DW 31, 14, 18, 8
LEG_B06:
    DD LEG_B06_IMG - base_anims
    DW 26, 23, 17, 11
LEG_B07:
    DD LEG_B07_IMG - base_anims
    DW 18, 28, 13, 13
LEG_B08:
    DD LEG_B08_IMG - base_anims
    DW 16, 31, 9, 15
LEG_B09:
    DD LEG_B09_IMG - base_anims
    DW 24, 28, 14, 15
LEG_B10:
    DD LEG_B10_IMG - base_anims
    DW 28, 19, 16, 12
LEG_B11:
    DD LEG_B11_IMG - base_anims
    DW 31, 15, 16, 7
LEG_B12:
    DD LEG_B12_IMG - base_anims
    DW 27, 23, 13, 11

    PUBLIC _XLIMB01
_XLIMB01:
    DD XLIMB01_IMG - base_anims
    DW 25, 23, 12, 9
    DD   _BODY_P
XLIMB02:
    DD XLIMB02_IMG - base_anims
    DW 31, 15, 16, 7
XLIMB03:
    DD XLIMB03_IMG - base_anims
    DW 30, 9, 16, 3
XLIMB04:
    DD XLIMB04_IMG - base_anims
    DW 24, 16, 14, 8
XLIMB05:
    DD XLIMB05_IMG - base_anims
    DW 13, 21, 8, 10
XLIMB06:
    DD XLIMB06_IMG - base_anims
    DW 16, 24, 9, 11
XLIMB07:
    DD XLIMB07_IMG - base_anims
    DW 26, 20, 14, 9
XLIMB08:
    DD XLIMB08_IMG - base_anims
    DW 32, 13, 17, 5
XLIMB09:
    DD XLIMB09_IMG - base_anims
    DW 31, 10, 17, 4
XLIMB10:
    DD XLIMB10_IMG - base_anims
    DW 25, 18, 14, 7
XLIMB11:
    DD XLIMB11_IMG - base_anims
    DW 14, 24, 7, 10
XLIMB12:
    DD XLIMB12_IMG - base_anims
    DW 15, 26, 8, 11

    PUBLIC _BONE01
_BONE01:
    DD BONE01_IMG - base_anims
    DW 8, 21, 5, 12
    DD   _BODY_P
BONE02:
    DD BONE02_IMG - base_anims
    DW 11, 14, 5, 8
BONE03:
    DD BONE03_IMG - base_anims
    DW 19, 5, 9, 3
BONE04:
    DD BONE04_IMG - base_anims
    DW 23, 15, 11, 8
BONE05:
    DD BONE05_IMG - base_anims
    DW 22, 22, 10, 11
BONE06:
    DD BONE06_IMG - base_anims
    DW 17, 23, 8, 12
BONE07:
    DD BONE07_IMG - base_anims
    DW 9, 21, 4, 11
BONE08:
    DD BONE08_IMG - base_anims
    DW 11, 13, 6, 7
BONE09:
    DD BONE09_IMG - base_anims
    DW 18, 6, 9, 3
BONE10:
    DD BONE10_IMG - base_anims
    DW 22, 15, 11, 8
BONE11:
    DD BONE11_IMG - base_anims
    DW 22, 22, 11, 11
BONE12:
    DD BONE12_IMG - base_anims
    DW 17, 25, 9, 13

    PUBLIC _CAGE01
_CAGE01:
    DD CAGE01_IMG - base_anims
    DW 21, 21, 12, 8
    DD _CAGE_P
CAGE02:
    DD CAGE02_IMG - base_anims
    DW 23, 20, 14, 7
CAGE03:
    DD CAGE03_IMG - base_anims
    DW 23, 17, 14, 8
CAGE04:
    DD CAGE04_IMG - base_anims
    DW 22, 20, 13, 9
CAGE05:
    DD CAGE05_IMG - base_anims
    DW 19, 21, 11, 9
CAGE06:
    DD CAGE06_IMG - base_anims
    DW 19, 20, 9, 11
CAGE07:
    DD CAGE07_IMG - base_anims
    DW 23, 21, 11, 12
CAGE08:
    DD CAGE08_IMG - base_anims
    DW 24, 19, 11, 10
CAGE09:
    DD CAGE09_IMG - base_anims
    DW 22, 17, 10, 8
CAGE10:
    DD CAGE10_IMG - base_anims
    DW 22, 20, 10, 10
CAGE11:
    DD CAGE11_IMG - base_anims
    DW 18, 21, 9, 10
CAGE12:
    DD CAGE12_IMG - base_anims
    DW 18, 21, 10, 9
CAGE13:
    DD CAGE13_IMG - base_anims
    DW 20, 21, 12, 5
CAGE14:
    DD CAGE14_IMG - base_anims
    DW 22, 21, 13, 1
CAGE15:
    DD CAGE15_IMG - base_anims
    DW 22, 20, 13,  - 3
CAGE16:
    DD CAGE16_IMG - base_anims
    DW 23, 19, 14,  - 9
CAGE17:
    DD CAGE17_IMG - base_anims
    DW 24, 19, 14,  - 14
CAGE18:
    DD CAGE18_IMG - base_anims
    DW 23, 17, 14,  - 19
CAGE19:
    DD CAGE19_IMG - base_anims
    DW 24, 16, 14,  - 19
CAGE20:
    DD CAGE20_IMG - base_anims
    DW 26, 17, 15,  - 19
CAGE21:
    DD CAGE21_IMG - base_anims
    DW 26, 17, 15,  - 19
CAGE22:
    DD CAGE22_IMG - base_anims
    DW 26, 17, 15,  - 19
CAGE23:
    DD CAGE23_IMG - base_anims
    DW 26, 17, 15,  - 19
CAGE24:
    DD CAGE24_IMG - base_anims
    DW 26, 18, 15,  - 19

    PUBLIC _PORK01
_PORK01:
    PUBLIC _SKULL01
_SKULL01:
    DD SKULL01_IMG - base_anims
    DW 15, 14, 8, 8
    DD   _BODY_P
SKULL02:
    DD SKULL02_IMG - base_anims
    DW 17, 14, 9, 8
SKULL03:
    DD SKULL03_IMG - base_anims
    DW 16, 14, 8, 7
SKULL04:
    DD SKULL04_IMG - base_anims
    DW 14, 15, 6, 8
SKULL05:
    DD SKULL05_IMG - base_anims
    DW 14, 17, 6, 9
SKULL06:
    DD SKULL06_IMG - base_anims
    DW 15, 16, 8, 8
SKULL07:
    DD SKULL07_IMG - base_anims
    DW 15, 13, 9, 4
SKULL08:
    DD SKULL08_IMG - base_anims
    DW 17, 14, 9, 5
SKULL09:
    DD SKULL09_IMG - base_anims
    DW 16, 14, 9, 7
SKULL10:
    DD SKULL10_IMG - base_anims
    DW 14, 15, 9, 7
SKULL11:
    DD SKULL11_IMG - base_anims
    DW 14, 17, 9, 8
SKULL12:
    DD SKULL12_IMG - base_anims
    DW 15, 16, 8, 8

    PUBLIC _GOROARM02
_GOROARM02:
    DD GOROARM02_IMG - base_anims
    DW 23, 22, 13, 7
    DD   _GBODY_P

GOROARM03:
    DD GOROARM03_IMG - base_anims
    DW 26, 10, 15, 2
GOROARM04:
    DD GOROARM04_IMG - base_anims
    DW 24, 15, 15, 4
GOROARM05:
    DD GOROARM05_IMG - base_anims
    DW 18, 27, 13, 11
GOROARM06:
    DD GOROARM06_IMG - base_anims
    DW 10, 34, 7, 16
GOROARM07:
    DD GOROARM07_IMG - base_anims
    DW 18, 32, 11, 18
GOROARM08:
    DD GOROARM08_IMG - base_anims
    DW 30, 23, 15, 14
GOROARM09:
    DD GOROARM09_IMG - base_anims
    DW 31, 8, 15, 3
GOROARM10:
    DD GOROARM10_IMG - base_anims
    DW 27, 22, 13, 10
GOROARM11:
    DD GOROARM11_IMG - base_anims
    DW 19, 35, 8, 15
GOROARM12:
    DD GOROARM12_IMG - base_anims
    DW 10, 37, 4, 15
BLDXPD1:
    DD BLDXPD1_SUB - base_anims, 0
BLDXPD1_SUB:
    DD BLDXPD1_IMG - base_anims
    DW 45, 40, 22, 20
    DD _BLDXPD_P
BLDXPD2:
    DD BLDXPD2_SUB - base_anims, 0
BLDXPD2_SUB:
    DD BLDXPD2_IMG - base_anims
    DW 56, 49, 28, 25
BLDXPD3:
    DD BLDXPD3_SUB - base_anims, 0
BLDXPD3_SUB:
    DD BLDXPD3_IMG - base_anims
    DW 67, 59, 34, 29
BLDXPD4:
    DD BLDXPD4_SUB - base_anims, 0
BLDXPD4_SUB:
    DD BLDXPD4_IMG - base_anims
    DW 77, 66, 38, 33
BLDXPD5:
    DD BLDXPD5_SUB - base_anims, 0
BLDXPD5_SUB:
    DD BLDXPD5_IMG - base_anims
    DW 85, 77, 42, 37
BLDXPD6:
    DD BLDXPD6_SUB - base_anims, 0
BLDXPD6_SUB:
    DD BLDXPD6_IMG - base_anims
    DW 96, 86, 48, 41
BLDXPD7:
    DD BLDXPD7_SUB - base_anims, 0
BLDXPD7_SUB:
    DD BLDXPD7_IMG - base_anims
    DW 107, 97, 54, 47
BLDXPD8:
    DD BLDXPD8_SUB - base_anims, 0
BLDXPD8_SUB:
    DD BLDXPD8_IMG - base_anims
    DW 118, 106, 59, 51
BLDXPD9:
    DD BLDXPD9_SUB - base_anims, 0
BLDXPD9_SUB:
    DD BLDXPD9_IMG - base_anims
    DW 130, 116, 65, 55
BLDXPD10:
    DD BLDXPD10_SUB - base_anims, 0
BLDXPD10_SUB:
    DD BLDXPD10_IMG - base_anims
    DW 144, 127, 72, 61
BLDXPD11:
    DD BLDXPD11_SUB - base_anims, 0
BLDXPD11_SUB:
    DD BLDXPD11_IMG - base_anims
    DW 162, 139, 81, 68
BLDXPD12:
    DD BLDXPD12_SUB - base_anims, 0
BLDXPD12_SUB:
    DD BLDXPD12_IMG - base_anims
    DW 182, 143, 91, 69
BLDXPD13:
    DD BLDXPD13_SUB - base_anims, 0
BLDXPD13_SUB:
    DD BLDXPD13_IMG - base_anims
    DW 157, 150, 78, 77

    ALIGN 4
    include chars\blood\mkguts.psi

    ALIGN 4
    include bkgd\throne\saw7075.psi
    ;include bkgd\bgani\pit\pitfatal.psi
    ALIGN 4
    include bkgd\bgani\pit\wall80.psi

;*********************************
;**      MODULE DATA            **
;*********************************
    ALIGN 4
    include bkgd\throne\mkthrone.mod

    ALIGN 4
    PUBLIC _pit_module
_pit_module:
    DW  0               ; autoerase color
    DW  000H            ; initial world y
    DW  0d4H                ; ground y offset
    DW  320             ; initial world x
    DW  0               ; scroll left limit
    DW  640             ; scroll right limit

    DD  _calla_pit           ; routine to call
    DD  pit_scroll          ; scroll table
    DD  dlists_pit

    DD  _bakmods
    DD  MKPIT1BMOD          ; _baklst1 = floor
    DW  018H,0ffe2H
    DD  MKPIT2BMOD          ; _baklst2 = side nose
    DW  000H,004H
    DD  MKPIT3BMOD          ; _baklst3 = lights
    DW  0fff8H,066H
    DD  MKPIT4BMOD          ; _baklst4 = backplane
    DW  0fff0H,01eH + 10

    DD  CENTER_X
    DD  MKPIT1BMOD,_worldtlx1
    DD  MKPIT2BMOD,_worldtlx2
    DD  MKPIT3BMOD,_worldtlx3
    DD  MKPIT4BMOD,_worldtlx4
    DD  0,0

pit_scroll:
    DD  0*SCX/100               ; 8
    DD  0*SCX/100               ; 7
    DD  000H*SCX/100                ; 6
    DD  000H*SCX/100                ; 5
    DD  0*SCX/100           ; 4
    DD  08000H*SCX/100          ; 3
    DD  0c000H*SCX/100          ; 2
    DD  020000H*SCX/100         ; 1
    DD  020000H*SCX/100         ; player list

dlists_pit:
    DD  _baklst4,_worldtlx4 + 16/8
    DD  _baklst3,_worldtlx3 + 16/8
    DD  _baklst2,_worldtlx2 + 16/8
    DD  _baklst1,_worldtlx1 + 16/8
;   dw   - 1,_floor_code
    DD  _objlst,_worldtlx + 16/8
    DD  _objlst2,_worldtlx + 16/8
    DD  0

;*********************************
;**         FLOOR DATA          **
;*********************************
    ALIGN 4


    END_DATA
    end
