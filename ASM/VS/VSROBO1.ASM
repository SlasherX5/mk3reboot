

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
robo1_pieces:
    DW  055H,035H+01eH,0130H,035H+01eH
    DD rb2grey1a-robo1_pieces,0
    DD rb2grey1b-robo1_pieces,0
    DD rb2grey1c-robo1_pieces,0
    DD rb2grey1d-robo1_pieces,0
    DD rb2grey1e-robo1_pieces,0
    DD rb2grey1f-robo1_pieces,0
    DD rb2red1a-robo1_pieces,_VRBDRED_P
    DD rb2red1b-robo1_pieces,_VRBDRED_P
    DD rb2red1c-robo1_pieces,_VRBDRED_P
    DD rb2red1d-robo1_pieces,_VRBDRED_P
    DD rb2red1e-robo1_pieces,_VRBDRED_P
    DD rb2red1f-robo1_pieces,_VRBDRED_P
    DD rb2red1g-robo1_pieces,_VRBDRED_P
    DD 0

rb2grey1a:
    DD  RB2GREY1A-robo1_pieces,0
rb2grey1b:
    DD  RB2GREY1B-robo1_pieces,0
rb2grey1c:
    DD  RB2GREY1C-robo1_pieces,0
rb2grey1d:
    DD  RB2GREY1D-robo1_pieces,0
rb2grey1e:
    DD  RB2GREY1E-robo1_pieces,0
rb2grey1f:
    DD  RB2GREY1F-robo1_pieces,0
rb2red1a:
    DD  RB2RED1A-robo1_pieces,0
rb2red1b:
    DD  RB2RED1B-robo1_pieces,0
rb2red1c:
    DD  RB2RED1C-robo1_pieces,0
rb2red1d:
    DD  RB2RED1D-robo1_pieces,0
rb2red1e:
    DD  RB2RED1E-robo1_pieces,0
rb2red1f:
    DD  RB2RED1F-robo1_pieces,0
rb2red1g:
    DD  RB2RED1G-robo1_pieces,0

RB2GREY1A:
    DD  RB2GREY1A_SUB-robo1_pieces,0
RB2GREY1A_SUB:
    DD RB2GREY1A_IMG-robo1_pieces
    DW 37, 43, 4, -133
    DD   _VRB2GRY_P
RB2GREY1B:
    DD  RB2GREY1B_SUB-robo1_pieces,0
RB2GREY1B_SUB:
    DD RB2GREY1B_IMG-robo1_pieces
    DW 50, 66, 59, -50
    DD   _VRB2GRY_P
RB2GREY1C:
    DD  RB2GREY1C_SUB-robo1_pieces,0
RB2GREY1C_SUB:
    DD RB2GREY1C_IMG-robo1_pieces
    DW 50, 60, 54, -116
    DD   _VRB2GRY_P
RB2GREY1D:
    DD  RB2GREY1D_SUB-robo1_pieces,0
RB2GREY1D_SUB:
    DD RB2GREY1D_IMG-robo1_pieces
    DW 22, 52, -56, -70
    DD   _VRB2GRY_P
RB2GREY1E:
    DD  RB2GREY1E_SUB-robo1_pieces,0
RB2GREY1E_SUB:
    DD RB2GREY1E_IMG-robo1_pieces
    DW 38, 51, -16, -84
    DD   _VRB2GRY_P
RB2GREY1F:
    DD  RB2GREY1F_SUB-robo1_pieces,0
RB2GREY1F_SUB:
    DD RB2GREY1F_IMG-robo1_pieces
    DW 51, 82, 9, -7
    DD   _VRB2GRY_P
RB2RED1A:
    DD  RB2RED1A_SUB-robo1_pieces,0
RB2RED1A_SUB:
    DD RB2RED1A_IMG-robo1_pieces
    DW 54, 36, 82, -38
    DD   _VRB2RED_P
RB2RED1B:
    DD  RB2RED1B_SUB-robo1_pieces,0
RB2RED1B_SUB:
    DD RB2RED1B_IMG-robo1_pieces
    DW 12, 13, 42, -156
    DD   _VRB2RED_P
RB2RED1C:
    DD  RB2RED1C_SUB-robo1_pieces,0
RB2RED1C_SUB:
    DD RB2RED1C_IMG-robo1_pieces
    DW 50, 101, 40, -41
    DD   _VRB2RED_P
RB2RED1D:
    DD  RB2RED1D_SUB-robo1_pieces,0
RB2RED1D_SUB:
    DD RB2RED1D_IMG-robo1_pieces
    DW 10, 5, -9, -151
    DD   _VRB2RED_P
RB2RED1E:
    DD  RB2RED1E_SUB-robo1_pieces,0
RB2RED1E_SUB:
    DD RB2RED1E_IMG-robo1_pieces
    DW 24, 21, 21, -155
    DD   _VRB2RED_P
RB2RED1F:
    DD  RB2RED1F_SUB-robo1_pieces,0
RB2RED1F_SUB:
    DD RB2RED1F_IMG-robo1_pieces
    DW 19, 111, -9, -25
    DD   _VRB2RED_P
RB2RED1G:
    DD  RB2RED1G_SUB-robo1_pieces,0
RB2RED1G_SUB:
    DD RB2RED1G_IMG-robo1_pieces
    DW 46, 103, -28, -42
    DD   _VRB2RED_P

    ;CNOP 0,4
    include ..\attract\vs\vsrobo1.psi



    END_OVERLAY
    end

