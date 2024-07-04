	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 5
	.globl	_bar                            ; -- Begin function bar
	.p2align	2
_bar:                                   ; @bar
; %bb.0:
Lloh0:
	adrp	x8, _g_bar_off@GOTPAGE
Lloh1:
	ldr	x8, [x8, _g_bar_off@GOTPAGEOFF]
Lloh2:
	ldr	w8, [x8]
	madd	w0, w1, w0, w8
	ret
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
                                        ; -- End function
	.globl	_foo                            ; -- Begin function foo
	.p2align	2
_foo:                                   ; @foo
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x1
	mov	x20, x0
	bl	_bar
	mov	x21, x0
Lloh3:
	adrp	x8, _g_bar_off@GOTPAGE
Lloh4:
	ldr	x8, [x8, _g_bar_off@GOTPAGEOFF]
	mov	w9, #2
Lloh5:
	str	w9, [x8]
Lloh6:
	adrp	x8, _g_obj_a@PAGE
Lloh7:
	ldr	x0, [x8, _g_obj_a@PAGEOFF]
Lloh8:
	adrp	x8, _g_obj_b@PAGE
Lloh9:
	ldr	x2, [x8, _g_obj_b@PAGEOFF]
	bl	"_objc_msgSend$isEqual:"
Lloh10:
	adrp	x8, _g_eq@GOTPAGE
Lloh11:
	ldr	x8, [x8, _g_eq@GOTPAGEOFF]
Lloh12:
	strb	w0, [x8]
	mov	x0, x20
	mov	x1, x19
	bl	_bar
	add	w8, w19, w20
	add	w8, w8, w21
	add	w0, w8, w0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGotStr	Lloh10, Lloh11, Lloh12
	.loh AdrpLdr	Lloh8, Lloh9
	.loh AdrpAdrp	Lloh6, Lloh8
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpLdrGotStr	Lloh3, Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.globl	_eql                            ; -- Begin function eql
	.p2align	2
_eql:                                   ; @eql
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh13:
	adrp	x8, _g_obj_a@PAGE
Lloh14:
	ldr	x0, [x8, _g_obj_a@PAGEOFF]
Lloh15:
	adrp	x8, _g_obj_b@PAGE
Lloh16:
	ldr	x2, [x8, _g_obj_b@PAGEOFF]
	bl	"_objc_msgSend$isEqual:"
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpLdr	Lloh15, Lloh16
	.loh AdrpAdrp	Lloh13, Lloh15
	.loh AdrpLdr	Lloh13, Lloh14
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	cmp	w0, #3
	b.ne	LBB3_2
; %bb.1:
	mov	x19, x1
	ldr	x0, [x1, #8]
	bl	_atoi
	mov	x20, x0
	ldr	x0, [x19, #16]
	bl	_atoi
	mov	x19, x0
	mov	x0, x20
	mov	x1, x19
	bl	_foo
	mov	x21, x0
	adrp	x22, _OBJC_CLASSLIST_REFERENCES_$_@PAGE
	ldr	x0, [x22, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
	mov	x2, x20
	bl	"_objc_msgSend$numberWithInt:"
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	adrp	x23, _g_obj_a@PAGE
	ldr	x8, [x23, _g_obj_a@PAGEOFF]
	str	x0, [x23, _g_obj_a@PAGEOFF]
	mov	x0, x8
	bl	_objc_release
	ldr	x0, [x22, _OBJC_CLASSLIST_REFERENCES_$_@PAGEOFF]
	mov	x2, x19
	bl	"_objc_msgSend$numberWithInt:"
	mov	x29, x29
	bl	_objc_retainAutoreleasedReturnValue
	ldr	x8, [x23, _g_obj_a@PAGEOFF]
	str	x0, [x23, _g_obj_a@PAGEOFF]
	mov	x0, x8
	bl	_objc_release
	mov	x0, x20
	mov	x1, x19
	bl	_foo
	mov	x19, x0
	bl	_eql
	cmp	w0, #0
	cset	w8, ne
	mul	w9, w21, w19
	mov	w10, #51712
	movk	w10, #15258, lsl #16
Lloh17:
	adrp	x11, _g_eq@GOTPAGE
Lloh18:
	ldr	x11, [x11, _g_eq@GOTPAGEOFF]
	mul	w9, w9, w10
	ldrb	w10, [x11]
	add	w10, w10, w10, lsl #2
	orr	w9, w9, w10, lsl #1
	orr	w0, w9, w8
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB3_2:
	bl	_main.cold.1
	.loh AdrpLdrGot	Lloh17, Lloh18
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function main.cold.1
_main.cold.1:                           ; @main.cold.1
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh19:
	adrp	x0, l___func__.main@PAGE
Lloh20:
	add	x0, x0, l___func__.main@PAGEOFF
Lloh21:
	adrp	x1, l_.str@PAGE
Lloh22:
	add	x1, x1, l_.str@PAGEOFF
Lloh23:
	adrp	x3, l_.str.1@PAGE
Lloh24:
	add	x3, x3, l_.str.1@PAGEOFF
	mov	w2, #46
	bl	___assert_rtn
	.loh AdrpAdd	Lloh23, Lloh24
	.loh AdrpAdd	Lloh21, Lloh22
	.loh AdrpAdd	Lloh19, Lloh20
	.cfi_endproc
                                        ; -- End function
	.globl	_g_obj_a                        ; @g_obj_a
.zerofill __DATA,__common,_g_obj_a,8,3
	.globl	_g_obj_b                        ; @g_obj_b
.zerofill __DATA,__common,_g_obj_b,8,3
	.comm	_g_bar_off,4,2                  ; @g_bar_off
	.comm	_g_eq,1,0                       ; @g_eq
	.section	__TEXT,__cstring,cstring_literals
l___func__.main:                        ; @__func__.main
	.asciz	"main"

l_.str:                                 ; @.str
	.asciz	"objc-sel-stub-test.m"

l_.str.1:                               ; @.str.1
	.asciz	"argc == 3"

	.section	__DATA,__objc_classrefs,regular,no_dead_strip
	.p2align	3, 0x0                          ; @"OBJC_CLASSLIST_REFERENCES_$_"
_OBJC_CLASSLIST_REFERENCES_$_:
	.quad	_OBJC_CLASS_$_NSNumber

	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	64

.subsections_via_symbols
