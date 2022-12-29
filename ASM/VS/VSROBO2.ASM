

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
robo2_pieces:
    DW  05cH,035H+01eH,0128H,035H+01eH
    DD rb1gold1a-robo2_pieces,_VRBDYEL_P
    DD rb1gold1b-robo2_pieces,_VRBDYEL_P
    DD rb1gold1c-robo2_pieces,_VRBDYEL_P
    DD rb1gold1d-robo2_pieces,_VRBDYEL_P
    DD rb1gold1e-robo2_pieces,_VRBDYEL_P
    DD rb1grey1a-robo2_pieces,0
    DD rb1grey1b-robo2_pieces,0
    DD rb1grey1c-robo2_pieces,0
    DD rb1grey1d-robo2_pieces,0
    DD rb1grey1e-robo2_pieces,0
    DD rb1grey1f-robo2_pieces,0
    DD rb1grey1g-robo2_pieces,0
    DD 0

rb1gold1a:
    DD  RB1GOLD1A-robo2_pieces,0
rb1gold1b:
    DD  RB1GOLD1B-robo2_pieces,0
rb1gold1c:
    DD  RB1GOLD1C-robo2_pieces,0
rb1gold1d:
    DD  RB1GOLD1D-robo2_pieces,0
rb1gold1e:
    DD  RB1GOLD1E-robo2_pieces,0

rb1grey1a:
    DD  RB1GREY1A-robo2_pieces,0
rb1grey1b:
    DD  RB1GREY1B-robo2_pieces,0
rb1grey1c:
    DD  RB1GREY1C-robo2_pieces,0
rb1grey1d:
    DD  RB1GREY1D-robo2_pieces,0
rb1grey1e:
    DD  RB1GREY1E-robo2_pieces,0
rb1grey1f:
    DD  RB1GREY1F-robo2_pieces,0
rb1grey1g:
    DD  RB1GREY1G-robo2_pieces,0

RB1GREY1A:
    DD  RB1GREY1A_SUB-robo2_pieces,0
RB1GREY1A_SUB:
    DD RB1GREY1A_IMG-robo2_pieces
    DW 54, 43, 56, -1
    DD   _VRB1GRY_P
RB1GREY1B:
    DD  RB1GREY1B_SUB-robo2_pieces,0
RB1GREY1B_SUB:
    DD RB1GREY1B_IMG-robo2_pieces
    DW 22, 27, 66, -47
    DD   _VRB1GRY_P
RB1GREY1C:
    DD  RB1GREY1C_SUB-robo2_pieces,0
RB1GREY1C_SUB:
    DD RB1GREY1C_IMG-robo2_pieces
    DW 54, 125, 59, -44
    DD   _VRB1GRY_P
RB1GREY1D:
    DD  RB1GREY1D_SUB-robo2_pieces,0
RB1GREY1D_SUB:
    DD RB1GREY1D_IMG-robo2_pieces
    DW 23, 27, 5, -142
    DD   _VRB1GRY_P
RB1GREY1E:
    DD  RB1GREY1E_SUB-robo2_pieces,0
RB1GREY1E_SUB:
    DD RB1GREY1E_IMG-robo2_pieces
    DW 54, 82, -4, -1
    DD   _VRB1GRY_P
RB1GREY1F:
    DD  RB1GREY1F_SUB-robo2_pieces,0
RB1GREY1F_SUB:
    DD RB1GREY1F_IMG-robo2_pieces
    DW 25, 41, -22, -87
    DD   _VRB1GRY_P
RB1GREY1G:
    DD  RB1GREY1G_SUB-robo2_pieces,0
RB1GREY1G_SUB:
    DD RB1GREY1G_IMG-robo2_pieces
    DW 67, 65, -29, -88
    DD   _VRB1GRY_P
RB1GOLD1A:
    DD  RB1GOLD1A_SUB-robo2_pieces,0
RB1GOLD1A_SUB:
    DD RB1GOLD1A_IMG-robo2_pieces
    DW 29, 48, 78, -25
    DD   _VRB1YEL_P
RB1GOLD1B:
    DD  RB1GOLD1B_SUB-robo2_pieces,0
RB1GOLD1B_SUB:
    DD RB1GOLD1B_IMG-robo2_pieces
    DW 27, 33, 50, -42
    DD   _VRB1YEL_P
RB1GOLD1C:
    DD  RB1GOLD1C_SUB-robo2_pieces,0
RB1GOLD1C_SUB:
    DD RB1GOLD1C_IMG-robo2_pieces
    DW 62, 16, 45, -153
    DD   _VRB1YEL_P
RB1GOLD1D:
    DD  RB1GOLD1D_SUB-robo2_pieces,0
RB1GOLD1D_SUB:
    DD RB1GOLD1D_IMG-robo2_pieces
    DW 66, 111, 38, -36
    DD   _VRB1YEL_P
RB1GOLD1E:
    DD  RB1GOLD1E_SUB-robo2_pieces,0
RB1GOLD1E_SUB:
    DD RB1GOLD1E_IMG-robo2_pieces
    DW 46, 139, -27, -23
    DD   _VRB1YEL_P

    ;CNOP 0,4
    include ..\attract\vs\vsrobo2.psi




    END_OVERLAY
    end

