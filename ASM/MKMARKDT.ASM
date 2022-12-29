;******************************************************************************
;
; By: David Schwartz
;
; Date: Jan 1995
;
; (C) Williams Entertainment
;
; Mortal Kombat III Hidden Game Textures
;******************************************************************************/

     
;
;
;l27: group
    ;section .bkgddata_l27

 	include win95.i  ;: mkmarkdt.s
    include mkchar.i

	BEGIN_DATA

    ALIGN 4
_star_p:
    DD  5
    DW  00000H,07c00H,07c00H,07c00H,07c00H

    ;CNOP 0, 4
enemyp:
    DD 15
    DW 00000H, 05400H, 06108H, 06A29H, 00012H, 01CFFH, 05ADFH, 003FFH, 0294AH, 04631H
    DW 06318H, 07FFFH, 00160H, 01626H, 04B72H

    ;CNOP 0, 4
expldp3:
    DD 15
    DW 00000H, 0002AH, 0048EH, 01153H, 02218H, 02EDAH, 03B5DH, 04BFFH, 0001DH, 004DDH
    DW 00D9DH, 0163EH, 01EDEH, 0277FH, 02FFFH

    ;CNOP 0, 4
shipp1:
    DD 15
    DW 00000H, 05400H, 07CE4H, 07FB4H, 07FFFH, 004F8H, 00010H, 056B5H, 0318CH, 07D4AH
    DW 06ECEH, 04A52H, 0295FH, 06B5AH, 02BFFH

    ;CNOP 0, 4
OSTR_P:
    DD 10
    DW 00000H, 02DF5H, 00088H, 00D0CH, 07DE0H, 02861H, 05820H, 07B9AH, 01000H, 00339H

    ;public on:

    ALIGN 4
PUBLIC _hidden_anims
_hidden_anims:

PUBLIC _expld1
_expld1:
    DD expld1_IMG - _hidden_anims
    DW 12, 11, 0, 0
    DD   expldp3
PUBLIC _expld2
_expld2:
    DD expld2_IMG - _hidden_anims
    DW 16, 21, 0, 0
    DD   expldp3
PUBLIC _expld3
_expld3:
    DD expld3_IMG - _hidden_anims
    DW 16, 21, 0, 0
    DD   expldp3
PUBLIC _expld4
_expld4:
    DD expld4_IMG - _hidden_anims
    DW 16, 21, 0, 0
    DD   expldp3
PUBLIC _expld5
_expld5:
    DD expld5_IMG - _hidden_anims
    DW 16, 20, 0, 0
    DD   expldp3
PUBLIC _expld6
_expld6:
    DD expld6_IMG - _hidden_anims
    DW 10, 10, 0, 0
    DD   expldp3
PUBLIC _expld7
_expld7:
    DD expld7_IMG - _hidden_anims
    DW 11, 11, 0, 0
    DD   expldp3
PUBLIC _expld8
_expld8:
    DD expld8_IMG - _hidden_anims
    DW 11, 11, 0, 0
PUBLIC _ship1
_ship1:
    DD ship1_IMG - _hidden_anims
    DW 14, 21, 0, 0
    DD   shipp1
PUBLIC _ship2
_ship2:
    DD ship2_IMG - _hidden_anims
    DW 14, 21, 0, 0
    DD   shipp1
PUBLIC _ship3
_ship3:
    DD ship3_IMG - _hidden_anims
    DW 15, 15, 0, 0
    DD   shipp1
PUBLIC _ship4
_ship4:
    DD ship4_IMG - _hidden_anims
    DW 15, 15, 0, 0
    DD   shipp1
PUBLIC _enemy1
_enemy1:
    DD enemy1_IMG - _hidden_anims
    DW 11, 11, 0, 0
    DD   enemyp
PUBLIC _enemy2
_enemy2:
    DD enemy2_IMG - _hidden_anims
    DW 11, 11, 0, 0
    DD   enemyp
PUBLIC _enemy3
_enemy3:
    DD enemy3_IMG - _hidden_anims
    DW 11, 11, 0, 0
    DD   enemyp
PUBLIC _enemy4
_enemy4:
    DD enemy4_IMG - _hidden_anims
    DW 8, 11, 0, 0
    DD   enemyp
PUBLIC _enemy5
_enemy5:
    DD enemy5_IMG - _hidden_anims
    DW 11, 11, 0, 0
    DD   enemyp
PUBLIC _enemy6
_enemy6:
    DD enemy6_IMG - _hidden_anims
    DW 11, 8, 0, 0
    DD   enemyp
PUBLIC _enemy7
_enemy7:
    DD enemy7_IMG - _hidden_anims
    DW 11, 11, 0, 0
    DD   enemyp
PUBLIC _enemy8
_enemy8:
    DD enemy8_IMG - _hidden_anims
    DW 11, 11, 0, 0
    DD   enemyp
PUBLIC _enemy9
_enemy9:
    DD enemy9_IMG - _hidden_anims
    DW 11, 11, 0, 0
    DD   enemyp
PUBLIC _enemy10
_enemy10:
    DD enemy10_IMG - _hidden_anims
    DW 11, 8, 0, 0
    DD   enemyp
PUBLIC _star
_star:
    DD _star_IMG - _hidden_anims
    DW 1,1,0,0
    DD _star_p

    ALIGN 4
PUBLIC _star_IMG
_star_IMG:
    DB  0,0,0,0,1,1,1,1

    ;public off:

    ALIGN 4
    include .\attract\arcade\arcade.psi


    END_DATA
    end