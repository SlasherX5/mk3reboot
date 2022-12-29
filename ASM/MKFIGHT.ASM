;******************************************************************************
; File: mkfight.s
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III fight Animation Textures
;******************************************************************************/

    ;opt ;CNOP + 

	include win95.i
    include mkchar.i

    EXTERN _FITEYEL_P : DWORD
    EXTERN _MKFIGHT_P : DWORD
    EXTERN _MERCY_P : DWORD
    EXTERN _MRFLASH_P : DWORD

	BEGIN_DATA

;
; FIGHT MESSAGE OVERLAY
;
; f0: group
    ; section .fightintdata

    PUBLIC _fight_fx_anims
_fight_fx_anims:

    ;CNOP 0 , 4
fight_anims:
    PUBLIC _FINFITE1
_FINFITE1:
    DD FINFITE1_IMG - fight_anims
    DW 136 ,  39 ,  0 ,   - 32
    DD   _MKFIGHT_P

    include .\chars\intros\fight\mkbfghtf.psi

;
; FINISH HIM MESSAGE OVERLAY
;
; f1: group
    ; section .finhimdata

    ;CNOP 0 , 4
    PUBLIC _FINHIM1
_FINHIM1:
    DD FINHIM1_IMG - fight_anims
    DW 222 ,  35 ,  0 ,   - 61
    DD _MKFIGHT_P

    include .\chars\intros\finhim\mkbhimf.psi

;
; FINISH HER MESSAGE OVERLAY
;
; f2: group
    ; section .finherdata

    ;CNOP 0 , 4
    PUBLIC _FINHER1
_FINHER1:
    DD FINHER1_IMG - fight_anims
    DW 227 ,  36 ,  0 ,   - 61
    DD  _MKFIGHT_P
    include .\chars\intros\finher\mkbherf.psi

;*************************************************************
; f3: group
    ; section .mercydata

    ;CNOP 0 , 4
;   global mercy_anims
;mercy_anims
;   global a_mercy
;a_mercy
;   DW MERCY_01 - fight_anims
;   DW MERCY_02 - fight_anims
;   DW MERCY_03 - fight_anims
;   DW MERCY_04 - fight_anims
;   DW MERCY_05 - fight_anims
;   DW MERCY_06 - fight_anims
;   DW MERCY_07 - fight_anims
;   DW MERCY_08 - fight_anims
;   DW MERCY_09 - fight_anims
;   DW 0
;   DW MERCY_10 - fight_anims
;   DW MERCY_11 - fight_anims
;   DW MERCY_12 - fight_anims
;   DW MERCY_11 - fight_anims
;   DW MERCY_10 - fight_anims
;   DW MERCY_11 - fight_anims
;   DW MERCY_12 - fight_anims
;   DW MERCY_11 - fight_anims
;   DW MERCY_10 - fight_anims
;   DW 0
;   DW _MERCY_13 - fight_anims
;   DW 0
;
;   global MERCY_01
;MERCY_01
;   DW MERCY_01_IMG - fight_anims
;   DH 68 ,  45 ,  34 ,  0
;   dw _MERCY_P
;MERCY_02
;   DW MERCY_02_IMG - fight_anims
;   DH 75 ,  80 ,  38 ,  0
;MERCY_03
;   DW MERCY_03_IMG - fight_anims
;   DH 78 ,  90 ,  40 ,  0
;MERCY_04
;   DW MERCY_04_IMG - fight_anims
;   DH 82 ,  102 ,  42 ,  0
;MERCY_05
;   DW MERCY_05_IMG - fight_anims
;   DH 86 ,  94 ,  44 ,   - 19
;MERCY_06
;   DW MERCY_06_IMG - fight_anims
;   DH 93 ,  78 ,  47 ,   - 40
;MERCY_07
;   DW MERCY_07_IMG - fight_anims
;   DH 101 ,  64 ,  51 ,   - 59
;MERCY_08
;   DW MERCY_08_IMG - fight_anims
;   DH 110 ,  48 ,  56 ,   - 79
;MERCY_09
;   DW MERCY_09_IMG - fight_anims
;   DH 118 ,  39 ,  60 ,   - 91
;MERCY_10
;   DW MERCY_10_IMG - fight_anims
;   DH 126 ,  61 ,  64 ,   - 83
;   dw   _MRFLASH_P
;MERCY_11
;   DW MERCY_11_IMG - fight_anims
;   DH 182 ,  165 ,  89 ,   - 31
;   dw   _MRFLASH_P
;MERCY_12
;   DW MERCY_12_IMG - fight_anims
;   DH 129 ,  116 ,  64 ,   - 55
;   dw   _MRFLASH_P
    PUBLIC _MERCY_13
_MERCY_13:
    DD MERCY_13_IMG - fight_anims
    DW 126 ,  34 ,  64 ,   - 98
    DD   _MERCY_P

    include .\chars\intros\mercy\mercyf.psi

;*************************************************************
;f4 group
;   section .fataldata
;
;   CNOP 0 , 4
;   global fatality_anims
;fatality_anims
;
;   global a_fatality_drip
;a_fatality_drip
;   DW FATALITY01 - fatality_anims
;   DW FATALITY02 - fatality_anims
;   DW FATALITY03 - fatality_anims
;   DW FATALITY04 - fatality_anims
;   DW FATALITY05 - fatality_anims
;   DW FATALITY06 - fatality_anims
;   DW FATALITY07 - fatality_anims
;   DW FATALITY08 - fatality_anims
;j_fatal
;   DW FATALITY09 - fatality_anims
;   DW FATALITY10 - fatality_anims
;   DW FATALITY11 - fatality_anims
;   DW FATALITY12 - fatality_anims
;   DW FATALITY13 - fatality_anims
;   DW FATALITY14 - fatality_anims
;   DW FATALITY15 - fatality_anims
;   DW ani_jump
;   DW j_fatal - fatality_anims
;
;   global FATALITY01
;FATALITY01
;   DW FATALITY01_IMG - fatality_anims
;   DH 102 ,  1 ,   - 1 ,  0
;   dw FATAL_P
;FATALITY02
;   DW FATALITY02_IMG - fatality_anims
;   DH 102 ,  8 ,   - 1 ,  0
;FATALITY03
;   DW FATALITY03_IMG - fatality_anims
;   DH 102 ,  11 ,   - 1 ,  0
;FATALITY04
;   DW FATALITY04_IMG - fatality_anims
;   DH 102 ,  14 ,   - 1 ,  0
;FATALITY05
;   DW FATALITY05_IMG - fatality_anims
;   DH 102 ,  18 ,   - 1 ,  0
;FATALITY06
;   DW FATALITY06_IMG - fatality_anims
;   DH 103 ,  27 ,  0 ,  0
;FATALITY07
;   DW FATALITY07_IMG - fatality_anims
;   DH 103 ,  31 ,  0 ,  0
;FATALITY08
;   DW FATALITY08_IMG - fatality_anims
;   DH 104 ,  31 ,  0 ,  0
;FATALITY09
;   DW FATALITY09_IMG - fatality_anims
;   DH 104 ,  36 ,  0 ,  0
;FATALITY10
;   DW FATALITY10_IMG - fatality_anims
;   DH 104 ,  31 ,  0 ,  0
;FATALITY11
;   DW FATALITY11_IMG - fatality_anims
;   DH 104 ,  31 ,  0 ,  0
;FATALITY12
;   DW FATALITY12_IMG - fatality_anims
;   DH 104 ,  34 ,  0 ,  0
;FATALITY13
;   DW FATALITY13_IMG - fatality_anims
;   DH 104 ,  34 ,  0 ,  0
;FATALITY14
;   DW FATALITY14_IMG - fatality_anims
;   DH 104 ,  31 ,  0 ,  0
;FATALITY15
;   DW FATALITY15_IMG - fatality_anims
;   DH 104 ,  35 ,  0 ,  0
;
;   include .\chars\intros\fatal\fatal.psi
;
;;*************************************************************
;f5 group
;   section .babydata
;
;   CNOP 0 , 4
;   global baby_anims
;baby_anims
;
;   global BABKANO
;BABKANO
;   DW BABKANO_IMG - baby_anims
;   DH 22 ,  37 ,  0 ,  0
;   dw   BABY1_P
;
;   global BABSONYA
;BABSONYA
;   DW BABSONYA_IMG - baby_anims
;   DH 28 ,  46 ,  0 ,  0
;   dw   BABY4_P
;
;   global BABJAX
;BABJAX
;   DW BABJAX_IMG - baby_anims
;   DH 25 ,  41 ,  0 ,  0
;   dw   BABY6_P
;
;   global BABINDIAN
;BABINDIAN
;   DW BABINDIAN_IMG - baby_anims
;   DH 27 ,  43 ,  0 ,  0
;   dw   BABY10P
;
;   global BABZERO
;BABZERO
;   DW BABZERO_IMG - baby_anims
;   DH 22 ,  37 ,  0 ,  0
;   dw   BABY8_P
;
;   global BABSWAT
;BABSWAT
;   DW BABSWAT_IMG - baby_anims
;   DH 26 ,  43 ,  0 ,  0
;   dw   BABY13_P
;
;   global BABWITCH
;BABWITCH
;   DW BABWITCH_IMG - baby_anims
;   DH 29 ,  51 ,  0 ,  0
;   dw   BABY2_P
;
;   global BABKETCH
;BABKETCH
;   DW BABKETCH_IMG - baby_anims
;   DH 22 ,  41 ,  0 ,  0
;   dw   BABY9_P
;
;   global BABMUST
;BABMUST
;   DW BABMUST_IMG - baby_anims
;   DH 22 ,  41 ,  0 ,  0
;   dw   BABY9B_P
;
;   global BABLAO
;BABLAO
;   DW BABLAO_IMG - baby_anims
;   DH 31 ,  41 ,  0 ,  0
;   dw   BABY5_P
;
;   global BABTUSKEN
;BABTUSKEN
;   DW BABTUSKEN_IMG - baby_anims
;   DH 23 ,  39 ,  0 ,  0
;   dw   BABY3_P
;
;   global BABGORO
;BABGORO
;   DW BABGORO_IMG - baby_anims
;   DH 26 ,  44 ,  0 ,  0
;   dw   BABY12_P
;
;   global BABTSUNG
;BABTSUNG
;   DW BABTSUNG_IMG - baby_anims
;   DH 22 ,  41 ,  0 ,  0
;   dw   BABY11_P
;
;   global BABKANG
;BABKANG
;   DW BABKANG_IMG - baby_anims
;   DH 26 ,  43 ,  0 ,  0
;   dw   BABY7_P
;
;   global BABSMOKE
;BABSMOKE
;   DW BABSMOKE_IMG - baby_anims
;   DH 22 ,  41 ,  0 ,  0
;   dw   BABY9C_P
;
;   CNOP 0 , 4
;   include .\chars\babality\mkbaby.psi
;
;   CNOP 0 , 4
;   global baby_text
;baby_text
;   DW BABALITY1
;   DW BABALITY2
;   DW BABALITY3
;   DW BABALITY4
;   DW BABALITY5
;   DW BABALITY6
;   DW BABALITY7
;   DW BABALITY8
;   DW 0
;
;BABALITY1
;   DW BABALITY1_IMG - baby_anims
;   DH 33 ,  29 ,  0 ,  0
;   dw   BABYB_P
;BABALITY2
;   DW BABALITY2_IMG - baby_anims
;   DH 31 ,  29 ,  0 ,  0
;   dw   BABYA_P
;BABALITY3
;   DW BABALITY3_IMG - baby_anims
;   DH 29 ,  29 ,  0 ,  0
;   dw   BABYB_P
;BABALITY4
;   DW BABALITY4_IMG - baby_anims
;   DH 27 ,  29 ,  0 ,  0
;   dw   BABYA_P
;BABALITY5
;   DW BABALITY5_IMG - baby_anims
;   DH 28 ,  29 ,  0 ,  0
;   dw   BABYL_P
;BABALITY6
;   DW BABALITY6_IMG - baby_anims
;   DH 30 ,  30 ,  0 ,  0
;   dw   BABYI_P
;BABALITY7
;   DW BABALITY7_IMG - baby_anims
;   DH 32 ,  29 ,  0 ,  0
;   dw   BABYT_P
;BABALITY8
;   DW BABALITY8_IMG - baby_anims
;   DH 34 ,  29 ,  0 ,  0
;   dw   BABYY_P
;
;   include .\chars\intros\baby\babality.psi
;
;;*************************************************************
;f6 group
;   section .animaldata
;
;   CNOP 0 , 4
;   global animal_anims
;animal_anims
;
;   global a_animality
;a_animality
;   DW ANIMALITY01 - animal_anims
;   DW ANIMALITY02 - animal_anims
;   DW ANIMALITY03 - animal_anims
;   DW ANIMALITY04 - animal_anims
;   DW ANIMALITY05 - animal_anims
;   DW ANIMALITY06 - animal_anims
;   DW ANIMALITY07 - animal_anims
;   DW ANIMALITY08 - animal_anims
;   DW ANIMALITY09 - animal_anims
;   DW ANIMALITY10 - animal_anims
;   DW ANIMALITY11 - animal_anims
;   DW ANIMALITY12 - animal_anims
;   DW 0
;   global ANIMALITY01
;ANIMALITY01
;   DW ANIMALITY01_IMG - animal_anims
;   DH 48 ,  31 ,   - 1 ,   - 2
;   dw ANIMAL_P
;ANIMALITY02
;   DW ANIMALITY02_IMG - animal_anims
;   DH 85 ,  34 ,   - 1 ,  0
;ANIMALITY03
;   DW ANIMALITY03_IMG - animal_anims
;   DH 130 ,  34 ,   - 1 ,  0
;ANIMALITY04
;   DW ANIMALITY04_IMG - animal_anims
;   DH 168 ,  34 ,   - 1 ,  0
;ANIMALITY05
;   DW ANIMALITY05_IMG - animal_anims
;   DH 199 ,  35 ,   - 1 ,  0
;ANIMALITY06
;   DW ANIMALITY06_IMG - animal_anims
;   DH 200 ,  35 ,   - 1 ,  0
;ANIMALITY07
;   DW ANIMALITY07_IMG - animal_anims
;   DH 200 ,  35 ,   - 1 ,  0
;ANIMALITY08
;   DW ANIMALITY08_IMG - animal_anims
;   DH 200 ,  35 ,   - 1 ,  0
;ANIMALITY09
;   DW ANIMALITY09_IMG - animal_anims
;   DH 200 ,  35 ,   - 1 ,  0
;ANIMALITY10
;   DW ANIMALITY10_IMG - animal_anims
;   DH 201 ,  35 ,  0 ,  0
;ANIMALITY11
;   DW ANIMALITY11_IMG - animal_anims
;   DH 201 ,  35 ,  0 ,  0
;ANIMALITY12
;   DW ANIMALITY12_IMG - animal_anims
;   DH 202 ,  35 ,  0 ,  0
;
;   include .\chars\intros\animal\animal.psi
;
;;*************************************************************
;f7 group
;   section .frienddata
;
;   CNOP 0 , 4
;   global friend_anims
;friend_anims
;
;   global a_friend
;a_friend
;   DW FRIEN1 - friend_anims
;   DW FRIEN2 - friend_anims
;   DW FRIEN3 - friend_anims
;   DW FRIEN4 - friend_anims
;   DW FRIEN5 - friend_anims
;   DW FRIEN4 - friend_anims
;   DW FRIEN3 - friend_anims
;   DW FRIEN2 - friend_anims
;   DW FRIEN1 - friend_anims
;   DW FRIEN2 - friend_anims
;   DW FRIEN3 - friend_anims
;   DW FRIEN4 - friend_anims
;   DW FRIEN5 - friend_anims
;   DW FRIEN4 - friend_anims
;   DW FRIEN3 - friend_anims
;   DW FRIEN2 - friend_anims
;   DW FRIEN1 - friend_anims
;   DW FRIEN2 - friend_anims
;   DW FRIEN3 - friend_anims
;   DW FRIEN4 - friend_anims
;   DW FRIEN5 - friend_anims
;   DW 0
;   global a_ship
;a_ship
;   DW DSHIP1 - friend_anims
;   DW DSHIP2 - friend_anims
;   DW DSHIP3 - friend_anims
;   DW DSHIP4 - friend_anims
;   DW DSHIP5 - friend_anims
;   DW DSHIP4 - friend_anims
;   DW DSHIP3 - friend_anims
;   DW DSHIP2 - friend_anims
;   DW DSHIP1 - friend_anims
;   DW DSHIP2 - friend_anims
;   DW DSHIP3 - friend_anims
;   DW DSHIP4 - friend_anims
;   DW DSHIP5 - friend_anims
;   DW DSHIP4 - friend_anims
;   DW DSHIP3 - friend_anims
;   DW DSHIP2 - friend_anims
;   DW DSHIP1 - friend_anims
;   DW DSHIP2 - friend_anims
;   DW DSHIP3 - friend_anims
;   DW DSHIP4 - friend_anims
;   DW DSHIP5 - friend_anims
;   DW 0
;FRIEN1
;   DW FRIEN1_SUB - friend_anims ,  0
;FRIEN1_SUB
;   DW FRIEN1_IMG - friend_anims
;   DH 102 ,  49 ,  102 ,  11
;   dw   FRIEN_P
;FRIEN2
;   DW FRIEN2_SUB - friend_anims ,  0
;FRIEN2_SUB
;   DW FRIEN2_IMG - friend_anims
;   DH 101 ,  45 ,  101 ,  9
;FRIEN3
;   DW FRIEN3_SUB - friend_anims ,  0
;FRIEN3_SUB
;   DW FRIEN3_IMG - friend_anims
;   DH 98 ,  35 ,  98 ,  4
;FRIEN4
;   DW FRIEN4_SUB - friend_anims ,  0
;FRIEN4_SUB
;   DW FRIEN4_IMG - friend_anims
;   DH 95 ,  26 ,  96 ,  0
;FRIEN5
;   DW FRIEN5_SUB - friend_anims ,  0
;FRIEN5_SUB
;   DW FRIEN5_IMG - friend_anims
;   DH 94 ,  23 ,  95 ,   - 1
;   global DSHIP1
;DSHIP1
;   DW DSHIP1_SUB - friend_anims ,  0
;DSHIP1_SUB
;   DW DSHIP1_IMG - friend_anims
;   DH 98 ,  51 ,  0 ,  12
;   dw   DSHIP_P
;DSHIP2
;   DW DSHIP2_SUB - friend_anims ,  0
;DSHIP2_SUB
;   DW DSHIP2_IMG - friend_anims
;   DH 98 ,  46 ,  0 ,  9
;DSHIP3
;   DW DSHIP3_SUB - friend_anims ,  0
;DSHIP3_SUB
;   DW DSHIP3_IMG - friend_anims
;   DH 98 ,  37 ,  0 ,  5
;DSHIP4
;   DW DSHIP4_SUB - friend_anims ,  0
;DSHIP4_SUB
;   DW DSHIP4_IMG - friend_anims
;   DH 98 ,  26 ,  0 ,  0
;DSHIP5
;   DW DSHIP5_SUB - friend_anims ,  0
;DSHIP5_SUB
;   DW DSHIP5_IMG - friend_anims
;   DH 101 ,  23 ,  1 ,   - 1
;
;   include .\chars\intros\friend\friend.psi
;
;*************************************************************
; f9: group
    ; section .starsymboldata

    ;CNOP 0 , 4
wstar_p:
    DD  5
    DW  00000H , 07fffH , 07fffH , 07fffH , 07fffH

    PUBLIC _misc_anims
_misc_anims:
    ;CNOP 0 , 4
    PUBLIC _smstar
_smstar:
    DD star_IMG - _misc_anims
    DW 1 , 1 , 0 , 0
    DD wstar_p

    ;CNOP 0 , 4
star_IMG:
    DB  0 , 0 , 0 , 0 , 1 , 1 , 1 , 1

	END_DATA
	end
