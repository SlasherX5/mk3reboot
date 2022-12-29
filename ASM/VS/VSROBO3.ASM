

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
smoke_pieces:
    DW  05cH,035H+01eH,0128H,035H+01eH
    DD sm1gold1a-smoke_pieces,_VSMOK2_P
    DD sm1gold1b-smoke_pieces,_VSMOK2_P
    DD sm1gold1c-smoke_pieces,_VSMOK2_P
    DD sm1gold1d-smoke_pieces,_VSMOK2_P
    DD sm1gold1e-smoke_pieces,_VSMOK2_P
    DD rb3grey1a-smoke_pieces,0
    DD rb3grey1b-smoke_pieces,0
    DD rb3grey1c-smoke_pieces,0
    DD rb3grey1d-smoke_pieces,0
    DD rb3grey1e-smoke_pieces,0
    DD rb3grey1f-smoke_pieces,0
    DD rb3grey1g-smoke_pieces,0
    DD 0

sm1gold1a:
    DD  SM1GOLD1A-smoke_pieces,0
sm1gold1b:
    DD  SM1GOLD1B-smoke_pieces,0
sm1gold1c:
    DD  SM1GOLD1C-smoke_pieces,0
sm1gold1d:
    DD  SM1GOLD1D-smoke_pieces,0
sm1gold1e:
    DD  SM1GOLD1E-smoke_pieces,0
rb3grey1a:
    DD  RB3GREY1A-smoke_pieces,0
rb3grey1b:
    DD  RB3GREY1B-smoke_pieces,0
rb3grey1c:
    DD  RB3GREY1C-smoke_pieces,0
rb3grey1d:
    DD  RB3GREY1D-smoke_pieces,0
rb3grey1e:
    DD  RB3GREY1E-smoke_pieces,0
rb3grey1f:
    DD  RB3GREY1F-smoke_pieces,0
rb3grey1g:
    DD  RB3GREY1G-smoke_pieces,0

SM1GOLD1A:
    DD  SM1GOLD1A_SUB-smoke_pieces,0
SM1GOLD1A_SUB:
    DD RB3GOLD1A_IMG-smoke_pieces
    DW 29, 48, 78, -25
    DD   _VSMOK1_P
SM1GOLD1B:
    DD  SM1GOLD1B_SUB-smoke_pieces,0
SM1GOLD1B_SUB:
    DD RB3GOLD1B_IMG-smoke_pieces
    DW 27, 33, 50, -42
    DD   _VSMOK1_P
SM1GOLD1C:
    DD  SM1GOLD1C_SUB-smoke_pieces,0
SM1GOLD1C_SUB:
    DD RB3GOLD1C_IMG-smoke_pieces
    DW 62, 16, 45, -153
    DD   _VSMOK1_P
SM1GOLD1D:
    DD  SM1GOLD1D_SUB-smoke_pieces,0
SM1GOLD1D_SUB:
    DD RB3GOLD1D_IMG-smoke_pieces
    DW 66, 111, 38, -36
    DD   _VSMOK1_P
SM1GOLD1E:
    DD  SM1GOLD1E_SUB-smoke_pieces,0
SM1GOLD1E_SUB:
    DD RB3GOLD1E_IMG-smoke_pieces
    DW 46, 139, -27, -23
    DD   _VSMOK1_P

RB3GREY1A:
    DD  RB3GREY1A_SUB-smoke_pieces,0
RB3GREY1A_SUB:
    DD RB3GREY1A_IMG-smoke_pieces
    DW 54, 43, 56, -1
    DD   _VRB1GRY_P
RB3GREY1B:
    DD  RB3GREY1B_SUB-smoke_pieces,0
RB3GREY1B_SUB:
    DD RB3GREY1B_IMG-smoke_pieces
    DW 22, 27, 66, -47
    DD   _VRB1GRY_P
RB3GREY1C:
    DD  RB3GREY1C_SUB-smoke_pieces,0
RB3GREY1C_SUB:
    DD RB3GREY1C_IMG-smoke_pieces
    DW 54, 125, 59, -44
    DD   _VRB1GRY_P
RB3GREY1D:
    DD  RB3GREY1D_SUB-smoke_pieces,0
RB3GREY1D_SUB:
    DD RB3GREY1D_IMG-smoke_pieces
    DW 23, 27, 5, -142
    DD   _VRB1GRY_P
RB3GREY1E:
    DD  RB3GREY1E_SUB-smoke_pieces,0
RB3GREY1E_SUB:
    DD RB3GREY1E_IMG-smoke_pieces
    DW 54, 82, -4, -1
    DD   _VRB1GRY_P
RB3GREY1F:
    DD  RB3GREY1F_SUB-smoke_pieces,0
RB3GREY1F_SUB:
    DD RB3GREY1F_IMG-smoke_pieces
    DW 25, 41, -22, -87
    DD   _VRB1GRY_P
RB3GREY1G:
    DD  RB3GREY1G_SUB-smoke_pieces,0
RB3GREY1G_SUB:
    DD RB3GREY1G_IMG-smoke_pieces
    DW 67, 65, -29, -88
    DD   _VRB1GRY_P

    ;CNOP 0,4
    include ..\attract\vs\vsrobo3.psi




    END_OVERLAY
    end

