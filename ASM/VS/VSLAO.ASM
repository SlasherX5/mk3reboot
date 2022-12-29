

    include overlay.i
    include mkchar.i

    BEGIN_OVERLAY
lao_pieces:
    DW  05cH,035H+14,0128H,035H+14
    DD klflesh1a-lao_pieces,0
    DD klflesh1b-lao_pieces,0
    DD klflesh1c-lao_pieces,0
    DD klflesh1d-lao_pieces,0
    DD klflesh1e-lao_pieces,0
    DD klgrey1a-lao_pieces,0
    DD klgrey1b-lao_pieces,0
    DD klgrey1c-lao_pieces,0
    DD klgrey1d-lao_pieces,0
    DD klgrey1e-lao_pieces,0
    DD klgrey1f-lao_pieces,0
    DD klgrey1g-lao_pieces,0
    DD klpants1a-lao_pieces,_VKLBLU_P
    DD klpants1b-lao_pieces,_VKLBLU_P
    DD 0

klflesh1a:
    DD  KLFLESH1A-lao_pieces,0

klflesh1b:
    DD  KLFLESH1B-lao_pieces,0

klflesh1c:
    DD  KLFLESH1C-lao_pieces,0

klflesh1d:
    DD  KLFLESH1D-lao_pieces,0

klflesh1e:
    DD  KLFLESH1E-lao_pieces,0

klgrey1a:
    DD  KLGREY1A-lao_pieces,0

klgrey1b:
    DD  KLGREY1B-lao_pieces,0

klgrey1c:
    DD  KLGREY1C-lao_pieces,0

klgrey1d:
    DD  KLGREY1D-lao_pieces,0

klgrey1e:
    DD  KLGREY1E-lao_pieces,0

klgrey1f:
    DD  KLGREY1F-lao_pieces,0

klgrey1g:
    DD  KLGREY1G-lao_pieces,0

klpants1a:
    DD  KLPANTS1A-lao_pieces,0

klpants1b:
    DD  KLPANTS1B-lao_pieces,0


KLFLESH1A:
    DD  KLFLESH1A_SUB-lao_pieces,0
KLFLESH1A_SUB:
    DD KLFLESH1A_IMG-lao_pieces
    DW 66, 46, 84, -26
    DD _VKLSKIN_P
KLFLESH1B:
    DD  KLFLESH1B_SUB-lao_pieces,0
KLFLESH1B_SUB:
    DD KLFLESH1B_IMG-lao_pieces
    DW 10, 87, 42, -72
    DD _VKLSKIN_P
KLFLESH1C:
    DD  KLFLESH1C_SUB-lao_pieces,0
KLFLESH1C_SUB:
    DD KLFLESH1C_IMG-lao_pieces
    DW 51, 134, 31, -25
    DD _VKLSKIN_P
KLFLESH1D:
    DD  KLFLESH1D_SUB-lao_pieces,0
KLFLESH1D_SUB:
    DD KLFLESH1D_IMG-lao_pieces
    DW 39, 116, -19, -25
    DD _VKLSKIN_P
KLFLESH1E:
    DD  KLFLESH1E_SUB-lao_pieces,0
KLFLESH1E_SUB:
    DD KLFLESH1E_IMG-lao_pieces
    DW 33, 70, -58, -72
    DD _VKLSKIN_P
KLGREY1A:
    DD  KLGREY1A_SUB-lao_pieces,0
KLGREY1A_SUB:
    DD KLGREY1A_IMG-lao_pieces
    DW 26, 20, 70, -27
    DD _VKLGRAY_P
KLGREY1B:
    DD  KLGREY1B_SUB-lao_pieces,0
KLGREY1B_SUB:
    DD KLGREY1B_IMG-lao_pieces
    DW 47, 137, 42, -6
    DD _VKLGRAY_P
KLGREY1C:
    DD  KLGREY1C_SUB-lao_pieces,0
KLGREY1C_SUB:
    DD KLGREY1C_IMG-lao_pieces
    DW 22, 34, -61, -94
    DD _VKLGRAY_P
KLGREY1D:
    DD  KLGREY1D_SUB-lao_pieces,0
KLGREY1D_SUB:
    DD KLGREY1D_IMG-lao_pieces
    DW 27, 31, 0, -151
    DD _VKLGRAY_P
KLGREY1E:
    DD  KLGREY1E_SUB-lao_pieces,0
KLGREY1E_SUB:
    DD KLGREY1E_IMG-lao_pieces
    DW 59, 83, -4, -1
    DD _VKLGRAY_P
KLGREY1F:
    DD  KLGREY1F_SUB-lao_pieces,0
KLGREY1F_SUB:
    DD KLGREY1F_IMG-lao_pieces
    DW 18, 28, -4, -114
    DD _VKLGRAY_P
KLGREY1G:
    DD  KLGREY1G_SUB-lao_pieces,0
KLGREY1G_SUB:
    DD KLGREY1G_IMG-lao_pieces
    DW 46, 40, 51, -143
    DD _VKLGRAY_P
KLPANTS1A:
    DD  KLPANTS1A_SUB-lao_pieces,0
KLPANTS1A_SUB:
    DD KLPANTS1A_IMG-lao_pieces
    DW 9, 18, 37, -165
    DD _VKLTAN_P
KLPANTS1B:
    DD  KLPANTS1B_SUB-lao_pieces,0
KLPANTS1B_SUB:
    DD KLPANTS1B_IMG-lao_pieces
    DW 32, 25, 6, -158
    DD _VKLTAN_P

    ;CNOP 0,4
    include ..\attract\vs\vslao.psi



    END_OVERLAY
    end

