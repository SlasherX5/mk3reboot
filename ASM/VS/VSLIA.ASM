

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
lia_pieces:
    DW  05dH,035H+26,012aH,035H+26
    DD liaflesh1a-lia_pieces,0
    DD liaflesh1b-lia_pieces,0
    DD liaflesh1c-lia_pieces,0
    DD liaflesh1d-lia_pieces,0
    DD liaflesh1e-lia_pieces,0
    DD liagrey1a-lia_pieces,0
    DD liagrey1b-lia_pieces,0
    DD liagrey1c-lia_pieces,0
    DD liapurp1a-lia_pieces,_VLIABLU_P
    DD liapurp1b-lia_pieces,_VLIABLU_P
    DD 0

liaflesh1a:
    DD  LIAFLESH1A-lia_pieces,0
liaflesh1b:
    DD  LIAFLESH1B-lia_pieces,0
liaflesh1c:
    DD  LIAFLESH1C-lia_pieces,0
liaflesh1d:
    DD  LIAFLESH1D-lia_pieces,0
liaflesh1e:
    DD  LIAFLESH1E-lia_pieces,0
liagrey1a:
    DD  LIAGREY1A-lia_pieces,0
liagrey1b:
    DD  LIAGREY1B-lia_pieces,0
liagrey1c:
    DD  LIAGREY1C-lia_pieces,0
liapurp1a:
    DD  LIAPURP1A-lia_pieces,0
liapurp1b:
    DD  LIAPURP1B-lia_pieces,0

LIAFLESH1A:
    DD  LIAFLESH1A_SUB-lia_pieces,0
LIAFLESH1A_SUB:
    DD LIAFLESH1A_IMG-lia_pieces
    DW 33, 53, 67, -79
    DD   _VLIASKN_P
LIAFLESH1B:
    DD  LIAFLESH1B_SUB-lia_pieces,0
LIAFLESH1B_SUB:
    DD LIAFLESH1B_IMG-lia_pieces
    DW 25, 72, 34, -61
    DD   _VLIASKN_P
LIAFLESH1C:
    DD  LIAFLESH1C_SUB-lia_pieces,0
LIAFLESH1C_SUB:
    DD LIAFLESH1C_IMG-lia_pieces
    DW 26, 26, -60, -55
    DD   _VLIASKN_P
LIAFLESH1D:
    DD  LIAFLESH1D_SUB-lia_pieces,0
LIAFLESH1D_SUB:
    DD LIAFLESH1D_IMG-lia_pieces
    DW 35, 51, -27, -81
    DD   _VLIASKN_P
LIAFLESH1E:
    DD  LIAFLESH1E_SUB-lia_pieces,0
LIAFLESH1E_SUB:
    DD LIAFLESH1E_IMG-lia_pieces
    DW 35, 115, 10, -36
    DD   _VLIASKN_P
LIAGREY1A:
    DD  LIAGREY1A_SUB-lia_pieces,0
LIAGREY1A_SUB:
    DD LIAGREY1A_IMG-lia_pieces
    DW 66, 166, 59, -8
    DD   _VLIAGRY_P
LIAGREY1B:
    DD  LIAGREY1B_SUB-lia_pieces,0
LIAGREY1B_SUB:
    DD LIAGREY1B_IMG-lia_pieces
    DW 25, 39, -49, -75
    DD   _VLIAGRY_P
LIAGREY1C:
    DD  LIAGREY1C_SUB-lia_pieces,0
LIAGREY1C_SUB:
    DD LIAGREY1C_IMG-lia_pieces
    DW 26, 166, -5, -8
    DD   _VLIAGRY_P
LIAPURP1A:
    DD  LIAPURP1A_SUB-lia_pieces,0
LIAPURP1A_SUB:
    DD LIAPURP1A_IMG-lia_pieces
    DW 15, 42, 38, -95
    DD   _VLIAPRP_P
LIAPURP1B:
    DD  LIAPURP1B_SUB-lia_pieces,0
LIAPURP1B_SUB:
    DD LIAPURP1B_IMG-lia_pieces
    DW 33, 77, 7, -97
    DD   _VLIAPRP_P

    ;CNOP 0,4
    include ..\attract\vs\vslia.psi



    END_OVERLAY
    end

