; set if background is active/loadavle (0equno, 1equyes)
ACT_BG_SUB_STREET equ 1
ACT_BG_ROOF   equ 1
ACT_BG_BANK   equ 1
ACT_BG_TOWER  equ 1
ACT_BG_SOUL   equ 1
ACT_BG_BELL   equ 1
ACT_BG_GRAVE  equ 1
ACT_BG_BRIDGE equ 1
ACT_BG_TEMPLE equ 1
ACT_BG_THRONE equ 1

ACT_BG_LADDER equ 1
ACT_BG_BIO  equ 1
ACT_BG_COIN equ 1
ACT_BG_VS equ 1
ACT_BG_BUYIN equ 1


SCX equ 100

; EXTERN EQUATES
NULL_IRQSKYE equ 0
END_LIST equ 0
SKIP_BAKMOD equ 1
FORCE_EXIT equ -1
CENTER_X equ -2

ifndef OVERLAY_SYMBOLS
	
	EXTERN _bakmods              :DWORD
    EXTERN _worldtlx             :DWORD
    EXTERN _worldtlx1            :DWORD
    EXTERN _worldtlx2            :DWORD
    EXTERN _worldtlx3            :DWORD
    EXTERN _worldtlx4            :DWORD
    EXTERN _worldtlx5            :DWORD
    EXTERN _worldtlx6            :DWORD
    EXTERN _worldtlx7            :DWORD
    EXTERN _worldtlx8            :DWORD
    EXTERN _worldtly             :DWORD
    EXTERN _worldtly1            :DWORD
    EXTERN _worldtly2            :DWORD
    EXTERN _worldtly3            :DWORD
    EXTERN _worldtly4            :DWORD
    EXTERN _worldtly5            :DWORD
    EXTERN _worldtly6            :DWORD
    EXTERN _worldtly7            :DWORD
    EXTERN _worldtly8            :DWORD
    EXTERN _scrollx              :DWORD
    EXTERN _scrollx1             :DWORD
    EXTERN _scrollx2             :DWORD
    EXTERN _scrollx3             :DWORD
    EXTERN _scrollx4             :DWORD
    EXTERN _scrollx5             :DWORD
    EXTERN _scrollx6             :DWORD
    EXTERN _scrollx7             :DWORD
    EXTERN _scrollx8             :DWORD
    EXTERN _objlst               :DWORD
    EXTERN _objlst2              :DWORD
    EXTERN _baklst1              :DWORD
    EXTERN _baklst2              :DWORD
    EXTERN _baklst3              :DWORD
    EXTERN _baklst4              :DWORD
    EXTERN _baklst5              :DWORD
    EXTERN _baklst6              :DWORD
    EXTERN _baklst7              :DWORD
    EXTERN _baklst8              :DWORD
    EXTERN _baklst9              :DWORD
    EXTERN _objlst_t             :DWORD
    EXTERN _baklst1_t            :DWORD
    EXTERN _baklst2_t            :DWORD
    EXTERN _baklst3_t            :DWORD
    EXTERN _baklst4_t            :DWORD
    EXTERN _baklst5_t            :DWORD
    EXTERN _baklst6_t            :DWORD
    EXTERN _baklst7_t            :DWORD
    EXTERN _baklst8_t            :DWORD
    EXTERN _worldtlx8_t          :DWORD
    EXTERN _worldtlx7_t          :DWORD
    EXTERN _worldtlx6_t          :DWORD
    EXTERN _worldtlx5_t          :DWORD
    EXTERN _worldtlx4_t          :DWORD
    EXTERN _worldtlx3_t          :DWORD
    EXTERN _worldtlx2_t          :DWORD
    EXTERN _worldtlx1_t          :DWORD
    EXTERN _worldtlx_t           :DWORD
    EXTERN _calla_return         :DWORD
    EXTERN _skew_7               :DWORD
    EXTERN _floor_code           :DWORD
    EXTERN _shadow_p1p2          :DWORD
    EXTERN _use_next_y           :DWORD
    EXTERN _useworldtly_t        :DWORD
    EXTERN _check_only_t         :DWORD
    EXTERN _useworldtly          :DWORD

endif

