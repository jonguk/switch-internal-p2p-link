	.build_version macos, 15, 0	sdk_version 15, 5
	.section	__TEXT,__StaticInit,regular,pure_instructions
	.p2align	2                               ; -- Begin function __cxx_global_var_init
___cxx_global_var_init:                 ; @__cxx_global_var_init
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x0, __ZN7sc_coreL17api_version_checkE@PAGE
	add	x0, x0, __ZN7sc_coreL17api_version_checkE@PAGEOFF
	mov	w8, #0                          ; =0x0
	mov	x1, x8
	and	w2, w8, #0x1
	bl	__ZN7sc_core31sc_api_version_3_0_1_cxx201703LC1ENS_16sc_writer_policyEb
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sc_main                        ; -- Begin function sc_main
	.p2align	2
_sc_main:                               ; @sc_main
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #1552
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	sub	x8, x29, #32
	add	x9, sp, #836
	str	x9, [sp]                        ; 8-byte Folded Spill
	str	w0, [x8, #12]
	str	x1, [x8]
	add	x0, sp, #1008
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	fmov	d0, #10.00000000
	mov	w2, #2                          ; =0x2
	fmov	d1, #0.50000000
	bl	__ZN7sc_core8sc_clockC1EPKcdNS_12sc_time_unitEd
Ltmp0:
	add	x0, sp, #848
	bl	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEC1Ev
Ltmp1:
	b	LBB1_1
LBB1_1:
Ltmp3:
	add	x0, sp, #696
	bl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEC1Ev
Ltmp4:
	b	LBB1_2
LBB1_2:
Ltmp6:
	add	x0, sp, #16
	adrp	x1, l_.str.1@PAGE
	add	x1, x1, l_.str.1@PAGEOFF
	bl	__ZN7sc_core14sc_module_nameC1EPKc
Ltmp7:
	b	LBB1_3
LBB1_3:
Ltmp8:
	add	x0, sp, #80
	add	x1, sp, #16
	bl	__ZN14simple_counterC1EN7sc_core14sc_module_nameE
Ltmp9:
	b	LBB1_4
LBB1_4:
Ltmp14:
	add	x0, sp, #16
	bl	__ZN7sc_core14sc_module_nameD1Ev
Ltmp15:
	b	LBB1_5
LBB1_5:
	add	x8, sp, #80
	add	x0, x8, #232
Ltmp17:
	add	x1, sp, #1008
	bl	__ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE
Ltmp18:
	b	LBB1_6
LBB1_6:
	add	x8, sp, #80
	add	x0, x8, #360
Ltmp19:
	add	x1, sp, #848
	bl	__ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE
Ltmp20:
	b	LBB1_7
LBB1_7:
	add	x8, sp, #80
	add	x0, x8, #488
Ltmp21:
	add	x1, sp, #696
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEclERS2_
Ltmp22:
	b	LBB1_8
LBB1_8:
	add	x1, sp, #15
	mov	w8, #1                          ; =0x1
	strb	w8, [sp, #15]
Ltmp23:
	add	x0, sp, #848
	bl	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb
Ltmp24:
	b	LBB1_9
LBB1_9:
Ltmp25:
	mov	w0, #20                         ; =0x14
	mov	w1, #2                          ; =0x2
	mov	w2, #1                          ; =0x1
	bl	__ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE
Ltmp26:
	b	LBB1_10
LBB1_10:
	add	x1, sp, #14
	strb	wzr, [sp, #14]
Ltmp27:
	add	x0, sp, #848
	bl	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb
Ltmp28:
	b	LBB1_11
LBB1_11:
Ltmp29:
	mov	w0, #100                        ; =0x64
	mov	w1, #2                          ; =0x2
	mov	w2, #1                          ; =0x1
	bl	__ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE
Ltmp30:
	b	LBB1_12
LBB1_12:
	add	x0, sp, #80
	bl	__ZN14simple_counterD1Ev
	add	x0, sp, #696
	bl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	add	x0, sp, #848
	bl	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev
	add	x0, sp, #1008
	bl	__ZN7sc_core8sc_clockD1Ev
	mov	w0, #0                          ; =0x0
	add	sp, sp, #1552
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB1_13:
Ltmp2:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	stur	x0, [x9, #4]
	mov	x8, x1
	str	w8, [x9]
	b	LBB1_21
LBB1_14:
Ltmp5:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	stur	x0, [x9, #4]
	mov	x8, x1
	str	w8, [x9]
	b	LBB1_20
LBB1_15:
Ltmp16:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	stur	x0, [x9, #4]
	mov	x8, x1
	str	w8, [x9]
	b	LBB1_19
LBB1_16:
Ltmp10:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	stur	x0, [x9, #4]
	mov	x8, x1
	str	w8, [x9]
Ltmp11:
	add	x0, sp, #16
	bl	__ZN7sc_core14sc_module_nameD1Ev
Ltmp12:
	b	LBB1_17
LBB1_17:
	b	LBB1_19
LBB1_18:
Ltmp31:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	stur	x0, [x9, #4]
	mov	x8, x1
	str	w8, [x9]
	add	x0, sp, #80
	bl	__ZN14simple_counterD1Ev
	b	LBB1_19
LBB1_19:
	add	x0, sp, #696
	bl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	b	LBB1_20
LBB1_20:
	add	x0, sp, #848
	bl	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev
	b	LBB1_21
LBB1_21:
	add	x0, sp, #1008
	bl	__ZN7sc_core8sc_clockD1Ev
	b	LBB1_22
LBB1_22:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldur	x0, [x8, #4]
	bl	__Unwind_Resume
LBB1_23:
Ltmp13:
	bl	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table1:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0             ;   Call between Lfunc_begin0 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp4-Ltmp3                    ;   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0             ;     jumps to Ltmp5
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin0             ; >> Call Site 4 <<
	.uleb128 Ltmp7-Ltmp6                    ;   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp16-Lfunc_begin0            ;     jumps to Ltmp16
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp8-Lfunc_begin0             ; >> Call Site 5 <<
	.uleb128 Ltmp9-Ltmp8                    ;   Call between Ltmp8 and Ltmp9
	.uleb128 Ltmp10-Lfunc_begin0            ;     jumps to Ltmp10
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp14-Lfunc_begin0            ; >> Call Site 6 <<
	.uleb128 Ltmp15-Ltmp14                  ;   Call between Ltmp14 and Ltmp15
	.uleb128 Ltmp16-Lfunc_begin0            ;     jumps to Ltmp16
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp17-Lfunc_begin0            ; >> Call Site 7 <<
	.uleb128 Ltmp30-Ltmp17                  ;   Call between Ltmp17 and Ltmp30
	.uleb128 Ltmp31-Lfunc_begin0            ;     jumps to Ltmp31
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin0            ; >> Call Site 8 <<
	.uleb128 Ltmp12-Ltmp11                  ;   Call between Ltmp11 and Ltmp12
	.uleb128 Ltmp13-Lfunc_begin0            ;     jumps to Ltmp13
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp12-Lfunc_begin0            ; >> Call Site 9 <<
	.uleb128 Lfunc_end0-Ltmp12              ;   Call between Ltmp12 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEC1Ev ; -- Begin function _ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEC1Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEC1Ev
	.p2align	2
__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEC1Ev: ; @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEC1Ev
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZN7sc_core12sc_interfaceC2Ev
Ltmp32:
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	mov	w8, #0                          ; =0x0
	and	w1, w8, #0x1
	bl	__ZN7sc_core18sc_gen_unique_nameEPKcb
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp33:
	b	LBB2_1
LBB2_1:
	ldr	x2, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	sub	x3, x29, #21
	sturb	wzr, [x29, #-21]
Ltmp34:
	adrp	x8, __ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	add	x1, x8, #8
	bl	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEC2EPKcRKb
Ltmp35:
	b	LBB2_2
LBB2_2:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	add	x9, x8, #48
	mov	x10, x9
	str	x10, [x0]
	str	x9, [x0]
	add	x9, x8, #264
	str	x9, [x0, #8]
	add	x8, x8, #328
	str	x8, [x0, #16]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0, #136]
	str	xzr, [x0, #144]
	str	xzr, [x0, #152]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB2_3:
Ltmp36:
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	stur	x8, [x29, #-16]
	mov	x8, x1
	stur	w8, [x29, #-20]
	bl	__ZN7sc_core12sc_interfaceD2Ev
	b	LBB2_4
LBB2_4:
	ldur	x0, [x29, #-16]
	bl	__Unwind_Resume
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table2:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Lfunc_begin1-Lfunc_begin1      ; >> Call Site 1 <<
	.uleb128 Ltmp32-Lfunc_begin1            ;   Call between Lfunc_begin1 and Ltmp32
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp32-Lfunc_begin1            ; >> Call Site 2 <<
	.uleb128 Ltmp35-Ltmp32                  ;   Call between Ltmp32 and Ltmp35
	.uleb128 Ltmp36-Lfunc_begin1            ;     jumps to Ltmp36
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp35-Lfunc_begin1            ; >> Call Site 3 <<
	.uleb128 Lfunc_end1-Ltmp35              ;   Call between Ltmp35 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEC1Ev ; -- Begin function _ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEC1Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEC1Ev
	.p2align	2
__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEC1Ev: ; @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEC1Ev
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZN7sc_core12sc_interfaceC2Ev
Ltmp37:
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	mov	w8, #0                          ; =0x0
	and	w1, w8, #0x1
	bl	__ZN7sc_core18sc_gen_unique_nameEPKcb
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp38:
	b	LBB3_1
LBB3_1:
	ldr	x2, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	add	x3, sp, #24
	str	wzr, [sp, #24]
Ltmp39:
	adrp	x8, __ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	add	x1, x8, #8
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi
Ltmp40:
	b	LBB3_2
LBB3_2:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	add	x9, x8, #48
	mov	x10, x9
	str	x10, [x0]
	str	x9, [x0]
	add	x9, x8, #216
	str	x9, [x0, #8]
	add	x8, x8, #280
	str	x8, [x0, #16]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB3_3:
Ltmp41:
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	stur	x8, [x29, #-16]
	mov	x8, x1
	stur	w8, [x29, #-20]
	bl	__ZN7sc_core12sc_interfaceD2Ev
	b	LBB3_4
LBB3_4:
	ldur	x0, [x29, #-16]
	bl	__Unwind_Resume
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table3:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Lfunc_begin2-Lfunc_begin2      ; >> Call Site 1 <<
	.uleb128 Ltmp37-Lfunc_begin2            ;   Call between Lfunc_begin2 and Ltmp37
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp37-Lfunc_begin2            ; >> Call Site 2 <<
	.uleb128 Ltmp40-Ltmp37                  ;   Call between Ltmp37 and Ltmp40
	.uleb128 Ltmp41-Lfunc_begin2            ;     jumps to Ltmp41
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp40-Lfunc_begin2            ; >> Call Site 3 <<
	.uleb128 Lfunc_end2-Ltmp40              ;   Call between Ltmp40 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN14simple_counterC1EN7sc_core14sc_module_nameE ; -- Begin function _ZN14simple_counterC1EN7sc_core14sc_module_nameE
	.weak_def_can_be_hidden	__ZN14simple_counterC1EN7sc_core14sc_module_nameE
	.p2align	2
__ZN14simple_counterC1EN7sc_core14sc_module_nameE: ; @_ZN14simple_counterC1EN7sc_core14sc_module_nameE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	mov	x8, x1
	str	x8, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZN14simple_counterC2EN7sc_core14sc_module_nameE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_definition	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE ; -- Begin function _ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE
	.weak_definition	__ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE
	.p2align	2
__ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE: ; @_ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	ldr	x8, [x0]
	ldr	x8, [x8, #192]
	blr	x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEclERS2_ ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEclERS2_
	.weak_definition	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEclERS2_
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEclERS2_: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEclERS2_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	ldr	x8, [x0]
	ldr	x8, [x8, #176]
	blr	x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE ; -- Begin function _ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE
	.weak_definition	__ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE
	.p2align	2
__ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE: ; @_ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	stur	w2, [x29, #-12]
	ldur	s1, [x29, #-4]
                                        ; implicit-def: $d0
	fmov	s0, s1
	sshll.2d	v0, v0, #0
                                        ; kill: def $d0 killed $d0 killed $q0
	scvtf	d0, d0
	ldur	w1, [x29, #-8]
	add	x0, sp, #8
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core7sc_timeC1EdNS_12sc_time_unitE
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldur	w1, [x29, #-12]
	bl	__ZN7sc_core8sc_startERKNS_7sc_timeENS_20sc_starvation_policyE
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN14simple_counterD1Ev        ; -- Begin function _ZN14simple_counterD1Ev
	.weak_def_can_be_hidden	__ZN14simple_counterD1Ev
	.p2align	2
__ZN14simple_counterD1Ev:               ; @_ZN14simple_counterD1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN14simple_counterD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	adrp	x1, __ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x1, [x1, __ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	bl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZN7sc_core12sc_interfaceD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN14simple_counterC2EN7sc_core14sc_module_nameE ; -- Begin function _ZN14simple_counterC2EN7sc_core14sc_module_nameE
	.weak_def_can_be_hidden	__ZN14simple_counterC2EN7sc_core14sc_module_nameE
	.p2align	2
__ZN14simple_counterC2EN7sc_core14sc_module_nameE: ; @_ZN14simple_counterC2EN7sc_core14sc_module_nameE
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
; %bb.0:
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __ZN14simple_counter13count_processEv@GOTPAGE
	ldr	x8, [x8, __ZN14simple_counter13count_processEv@GOTPAGEOFF]
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #40]                   ; 8-byte Folded Spill
	bl	__ZN7sc_core9sc_moduleC2Ev
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	adrp	x9, __ZTV14simple_counter@GOTPAGE
	ldr	x9, [x9, __ZTV14simple_counter@GOTPAGEOFF]
	add	x10, x9, #16
	str	x10, [x8]
	add	x9, x9, #168
	str	x9, [x8, #112]
Ltmp42:
	add	x0, x8, #232
	bl	__ZN7sc_core5sc_inIbEC1Ev
Ltmp43:
	b	LBB11_1
LBB11_1:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x0, x8, #360
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
Ltmp45:
	bl	__ZN7sc_core5sc_inIbEC1Ev
Ltmp46:
	b	LBB11_2
LBB11_2:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x0, x8, #488
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp48:
	bl	__ZN7sc_core6sc_outIiEC1Ev
Ltmp49:
	b	LBB11_3
LBB11_3:
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	str	wzr, [x0, #608]
	str	x8, [sp, #48]
	mov	x8, #-224                       ; =0xffffffffffffff20
	str	x8, [sp, #56]
	ldr	x1, [sp, #48]
	ldr	x2, [sp, #56]
Ltmp51:
	adrp	x3, l_.str.2@PAGE
	add	x3, x3, l_.str.2@PAGEOFF
	bl	__ZN7sc_core9sc_module22declare_method_processEMNS_15sc_process_hostEFvvEPKc
Ltmp52:
	b	LBB11_4
LBB11_4:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x9, x8, #120
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #232
Ltmp53:
	bl	__ZNK7sc_core5sc_inIbE3posEv
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
Ltmp54:
	b	LBB11_5
LBB11_5:
Ltmp55:
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZN7sc_core12sc_sensitivelsERNS_15sc_event_finderE
Ltmp56:
	b	LBB11_6
LBB11_6:
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB11_7:
Ltmp44:
	stur	x0, [x29, #-24]
	mov	x8, x1
	stur	w8, [x29, #-28]
	b	LBB11_13
LBB11_8:
Ltmp47:
	stur	x0, [x29, #-24]
	mov	x8, x1
	stur	w8, [x29, #-28]
	b	LBB11_12
LBB11_9:
Ltmp50:
	stur	x0, [x29, #-24]
	mov	x8, x1
	stur	w8, [x29, #-28]
	b	LBB11_11
LBB11_10:
Ltmp57:
	mov	x8, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	stur	x8, [x29, #-24]
	mov	x8, x1
	stur	w8, [x29, #-28]
	bl	__ZN7sc_core6sc_outIiED1Ev
	b	LBB11_11
LBB11_11:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	bl	__ZN7sc_core5sc_inIbED1Ev
	b	LBB11_12
LBB11_12:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x0, x8, #232
	bl	__ZN7sc_core5sc_inIbED1Ev
	b	LBB11_13
LBB11_13:
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	bl	__ZN7sc_core9sc_moduleD2Ev
	b	LBB11_14
LBB11_14:
	ldur	x0, [x29, #-24]
	bl	__Unwind_Resume
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table11:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Lfunc_begin3-Lfunc_begin3      ; >> Call Site 1 <<
	.uleb128 Ltmp42-Lfunc_begin3            ;   Call between Lfunc_begin3 and Ltmp42
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp42-Lfunc_begin3            ; >> Call Site 2 <<
	.uleb128 Ltmp43-Ltmp42                  ;   Call between Ltmp42 and Ltmp43
	.uleb128 Ltmp44-Lfunc_begin3            ;     jumps to Ltmp44
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp45-Lfunc_begin3            ; >> Call Site 3 <<
	.uleb128 Ltmp46-Ltmp45                  ;   Call between Ltmp45 and Ltmp46
	.uleb128 Ltmp47-Lfunc_begin3            ;     jumps to Ltmp47
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp48-Lfunc_begin3            ; >> Call Site 4 <<
	.uleb128 Ltmp49-Ltmp48                  ;   Call between Ltmp48 and Ltmp49
	.uleb128 Ltmp50-Lfunc_begin3            ;     jumps to Ltmp50
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp51-Lfunc_begin3            ; >> Call Site 5 <<
	.uleb128 Ltmp56-Ltmp51                  ;   Call between Ltmp51 and Ltmp56
	.uleb128 Ltmp57-Lfunc_begin3            ;     jumps to Ltmp57
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp56-Lfunc_begin3            ; >> Call Site 6 <<
	.uleb128 Lfunc_end3-Ltmp56              ;   Call between Ltmp56 and Lfunc_end3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end3:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core5sc_inIbEC1Ev       ; -- Begin function _ZN7sc_core5sc_inIbEC1Ev
	.weak_def_can_be_hidden	__ZN7sc_core5sc_inIbEC1Ev
	.p2align	2
__ZN7sc_core5sc_inIbEC1Ev:              ; @_ZN7sc_core5sc_inIbEC1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core5sc_inIbEC2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core6sc_outIiEC1Ev      ; -- Begin function _ZN7sc_core6sc_outIiEC1Ev
	.weak_def_can_be_hidden	__ZN7sc_core6sc_outIiEC1Ev
	.p2align	2
__ZN7sc_core6sc_outIiEC1Ev:             ; @_ZN7sc_core6sc_outIiEC1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core6sc_outIiEC2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN14simple_counter13count_processEv ; -- Begin function _ZN14simple_counter13count_processEv
	.weak_definition	__ZN14simple_counter13count_processEv
	.p2align	2
__ZN14simple_counter13count_processEv:  ; @_ZN14simple_counter13count_processEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #360
	bl	__ZNK7sc_core5sc_inIbE4readEv
	ldrb	w8, [x0]
	tbz	w8, #0, LBB14_2
	b	LBB14_1
LBB14_1:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	str	wzr, [x8, #608]
	b	LBB14_3
LBB14_2:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	w8, [x9, #608]
	add	w8, w8, #1
	str	w8, [x9, #608]
	b	LBB14_3
LBB14_3:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x0, x8, #488
	add	x1, x8, #608
	bl	__ZN7sc_core8sc_inoutIiE5writeERKi
	adrp	x0, __ZNSt3__14coutE@GOTPAGE
	ldr	x0, [x0, __ZNSt3__14coutE@GOTPAGEOFF]
	adrp	x1, l_.str.13@PAGE
	add	x1, x1, l_.str.13@PAGEOFF
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	w1, [x8, #608]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	adrp	x1, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGE
	add	x1, x1, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGEOFF
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core5sc_inIbE3posEv    ; -- Begin function _ZNK7sc_core5sc_inIbE3posEv
	.weak_definition	__ZNK7sc_core5sc_inIbE3posEv
	.p2align	2
__ZNK7sc_core5sc_inIbE3posEv:           ; @_ZNK7sc_core5sc_inIbE3posEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x1, [x29, #-8]
	mov	x8, #40                         ; =0x28
	str	x8, [sp, #8]
	mov	x8, #1                          ; =0x1
	str	x8, [sp, #16]
	ldr	x2, [sp, #8]
	ldr	x3, [sp, #16]
	mov	x8, x1
	add	x0, x8, #120
	bl	__ZN7sc_core15sc_event_finder13cached_createINS_15sc_signal_in_ifIbEEEERS0_RPS0_RKNS_12sc_port_baseEMT_KFRKNS_8sc_eventEvE
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core6sc_outIiED1Ev      ; -- Begin function _ZN7sc_core6sc_outIiED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core6sc_outIiED1Ev
	.p2align	2
__ZN7sc_core6sc_outIiED1Ev:             ; @_ZN7sc_core6sc_outIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core6sc_outIiED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core5sc_inIbED1Ev       ; -- Begin function _ZN7sc_core5sc_inIbED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core5sc_inIbED1Ev
	.p2align	2
__ZN7sc_core5sc_inIbED1Ev:              ; @_ZN7sc_core5sc_inIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core5sc_inIbED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_module4kindEv  ; -- Begin function _ZNK7sc_core9sc_module4kindEv
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_module4kindEv
	.p2align	2
__ZNK7sc_core9sc_module4kindEv:         ; @_ZNK7sc_core9sc_module4kindEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	adrp	x0, l_.str.16@PAGE
	add	x0, x0, l_.str.16@PAGEOFF
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core14sc_object_host16get_child_eventsEv ; -- Begin function _ZNK7sc_core14sc_object_host16get_child_eventsEv
	.weak_def_can_be_hidden	__ZNK7sc_core14sc_object_host16get_child_eventsEv
	.p2align	2
__ZNK7sc_core14sc_object_host16get_child_eventsEv: ; @_ZNK7sc_core14sc_object_host16get_child_eventsEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #56
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core14sc_object_host17get_child_objectsEv ; -- Begin function _ZNK7sc_core14sc_object_host17get_child_objectsEv
	.weak_def_can_be_hidden	__ZNK7sc_core14sc_object_host17get_child_objectsEv
	.p2align	2
__ZNK7sc_core14sc_object_host17get_child_objectsEv: ; @_ZNK7sc_core14sc_object_host17get_child_objectsEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #80
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN14simple_counterD0Ev        ; -- Begin function _ZN14simple_counterD0Ev
	.weak_def_can_be_hidden	__ZN14simple_counterD0Ev
	.p2align	2
__ZN14simple_counterD0Ev:               ; @_ZN14simple_counterD0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN14simple_counterD1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x1, #616                        ; =0x268
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn112_N14simple_counterD1Ev ; -- Begin function _ZThn112_N14simple_counterD1Ev
	.weak_def_can_be_hidden	__ZThn112_N14simple_counterD1Ev
	.p2align	2
__ZThn112_N14simple_counterD1Ev:        ; @_ZThn112_N14simple_counterD1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	subs	x0, x8, #112
	add	sp, sp, #16
	b	__ZN14simple_counterD1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn112_N14simple_counterD0Ev ; -- Begin function _ZThn112_N14simple_counterD0Ev
	.weak_def_can_be_hidden	__ZThn112_N14simple_counterD0Ev
	.p2align	2
__ZThn112_N14simple_counterD0Ev:        ; @_ZThn112_N14simple_counterD0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #112
	add	sp, sp, #16
	b	__ZN14simple_counterD0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core5sc_inIbEC2Ev       ; -- Begin function _ZN7sc_core5sc_inIbEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core5sc_inIbEC2Ev
	.p2align	2
__ZN7sc_core5sc_inIbEC2Ev:              ; @_ZN7sc_core5sc_inIbEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core7sc_portINS_15sc_signal_in_ifIbEELi1ELNS_14sc_port_policyE0EEC2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x8, __ZTVN7sc_core5sc_inIbEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core5sc_inIbEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0, #96]
	str	xzr, [x0, #104]
	str	xzr, [x0, #112]
	str	xzr, [x0, #120]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core6sc_outIiEC2Ev      ; -- Begin function _ZN7sc_core6sc_outIiEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core6sc_outIiEC2Ev
	.p2align	2
__ZN7sc_core6sc_outIiEC2Ev:             ; @_ZN7sc_core6sc_outIiEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core8sc_inoutIiEC2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x8, __ZTVN7sc_core6sc_outIiEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core6sc_outIiEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_inoutIiEC2Ev    ; -- Begin function _ZN7sc_core8sc_inoutIiEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core8sc_inoutIiEC2Ev
	.p2align	2
__ZN7sc_core8sc_inoutIiEC2Ev:           ; @_ZN7sc_core8sc_inoutIiEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x8, __ZTVN7sc_core8sc_inoutIiEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core8sc_inoutIiEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0, #96]
	str	xzr, [x0, #104]
	str	xzr, [x0, #112]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core6sc_outIiE4kindEv  ; -- Begin function _ZNK7sc_core6sc_outIiE4kindEv
	.weak_def_can_be_hidden	__ZNK7sc_core6sc_outIiE4kindEv
	.p2align	2
__ZNK7sc_core6sc_outIiE4kindEv:         ; @_ZNK7sc_core6sc_outIiE4kindEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core6sc_outIiED0Ev      ; -- Begin function _ZN7sc_core6sc_outIiED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core6sc_outIiED0Ev
	.p2align	2
__ZN7sc_core6sc_outIiED0Ev:             ; @_ZN7sc_core6sc_outIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core6sc_outIiED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x1, #120                        ; =0x78
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	ldr	x8, [sp, #24]
	ldr	x8, [x8, #64]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	mov	x9, #0                          ; =0x0
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	cbz	x8, LBB29_2
	b	LBB29_1
LBB29_1:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x8, x8, x9
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB29_2
LBB29_2:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv ; -- Begin function _ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.p2align	2
__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv: ; @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	ldr	x8, [sp, #24]
	ldr	x8, [x8, #64]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	mov	x9, #0                          ; =0x0
	str	x9, [sp, #16]                   ; 8-byte Folded Spill
	cbz	x8, LBB30_2
	b	LBB30_1
LBB30_1:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x8, x8, x9
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB30_2
LBB30_2:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv ; -- Begin function _ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv
	.p2align	2
__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv: ; @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp]
	add	x0, sp, #8
	adrp	x1, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGE
	add	x1, x1, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGEOFF
	bl	__ZNSt3__110type_indexC1B8ne200100ERKSt9type_info
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x8, [x29, #-24]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	cbz	x8, LBB32_2
	b	LBB32_1
LBB32_1:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	adrp	x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x2, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGE
	add	x2, x2, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB32_3
LBB32_2:
	mov	x8, #0                          ; =0x0
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB32_3
LBB32_3:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [sp, #32]
	ldr	x8, [sp, #32]
	cbnz	x8, LBB32_5
	b	LBB32_4
LBB32_4:
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-4]
	b	LBB32_6
LBB32_5:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #32]
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x1, x8, x9
	bl	__ZN7sc_core12sc_port_base4bindERNS_12sc_interfaceE
	stur	wzr, [x29, #-4]
	b	LBB32_6
LBB32_6:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x8, [x29, #-24]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	cbz	x8, LBB33_2
	b	LBB33_1
LBB33_1:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	adrp	x1, __ZTIN7sc_core12sc_port_baseE@GOTPAGE
	ldr	x1, [x1, __ZTIN7sc_core12sc_port_baseE@GOTPAGEOFF]
	adrp	x2, __ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@PAGE
	add	x2, x2, __ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@PAGEOFF
	mov	x3, #0                          ; =0x0
	bl	___dynamic_cast
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB33_3
LBB33_2:
	mov	x8, #0                          ; =0x0
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB33_3
LBB33_3:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [sp, #32]
	ldr	x8, [sp, #32]
	cbnz	x8, LBB33_5
	b	LBB33_4
LBB33_4:
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-4]
	b	LBB33_6
LBB33_5:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x1, [sp, #32]
	bl	__ZN7sc_core12sc_port_base4bindERS0_
	stur	wzr, [x29, #-4]
	b	LBB33_6
LBB33_6:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x8, [x29, #-16]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	cbz	x8, LBB34_2
	b	LBB34_1
LBB34_1:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	adrp	x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x2, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGE
	add	x2, x2, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB34_3
LBB34_2:
	mov	x8, #0                          ; =0x0
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB34_3
LBB34_3:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stur	x8, [x29, #-24]
	ldur	x8, [x29, #-24]
	cbz	x8, LBB34_5
	b	LBB34_4
LBB34_4:
	b	LBB34_6
LBB34_5:
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	mov	w2, #548                        ; =0x224
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB34_6:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	stur	w0, [x29, #-28]
	str	wzr, [sp, #32]
	b	LBB34_7
LBB34_7:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #32]
	ldur	w9, [x29, #-28]
	subs	w8, w8, w9
	b.ge	LBB34_12
	b	LBB34_8
LBB34_8:                                ;   in Loop: Header=BB34_7 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x9, [x29, #-24]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #72
	ldrsw	x1, [sp, #32]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	x9, [x0]
	subs	x8, x8, x9
	b.ne	LBB34_10
	b	LBB34_9
LBB34_9:                                ;   in Loop: Header=BB34_7 Depth=1
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	adrp	x1, __ZN7sc_core22SC_ID_BIND_IF_TO_PORT_E@GOTPAGE
	ldr	x1, [x1, __ZN7sc_core22SC_ID_BIND_IF_TO_PORT_E@GOTPAGEOFF]
	adrp	x2, l_.str.9@PAGE
	add	x2, x2, l_.str.9@PAGEOFF
	bl	__ZNK7sc_core12sc_port_base12report_errorEPKcS2_
	b	LBB34_10
LBB34_10:                               ;   in Loop: Header=BB34_7 Depth=1
	b	LBB34_11
LBB34_11:                               ;   in Loop: Header=BB34_7 Depth=1
	ldr	w8, [sp, #32]
	add	w8, w8, #1
	str	w8, [sp, #32]
	b	LBB34_7
LBB34_12:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x0, x8, #72
	sub	x1, x29, #24
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x0, x8, #72
	mov	x1, #0                          ; =0x0
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [x0]
	str	x8, [x9, #64]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv ; -- Begin function _ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv
	.p2align	2
__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv: ; @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_inoutIiE18end_of_elaborationEv ; -- Begin function _ZN7sc_core8sc_inoutIiE18end_of_elaborationEv
	.weak_def_can_be_hidden	__ZN7sc_core8sc_inoutIiE18end_of_elaborationEv
	.p2align	2
__ZN7sc_core8sc_inoutIiE18end_of_elaborationEv: ; @_ZN7sc_core8sc_inoutIiE18end_of_elaborationEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	ldr	x8, [x8, #96]
	cbz	x8, LBB36_4
	b	LBB36_1
LBB36_1:
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x1, [x0, #96]
	bl	__ZN7sc_core8sc_inoutIiE5writeERKi
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x8, [x8, #96]
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	cbz	x8, LBB36_3
	b	LBB36_2
LBB36_2:
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	mov	x1, #4                          ; =0x4
	bl	__ZdlPvm
	b	LBB36_3
LBB36_3:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8, #96]
	b	LBB36_4
LBB36_4:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x8, [x8, #104]
	cbz	x8, LBB36_13
	b	LBB36_5
LBB36_5:
	stur	wzr, [x29, #-12]
	b	LBB36_6
LBB36_6:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldur	w9, [x29, #-12]
	str	w9, [sp, #28]                   ; 4-byte Folded Spill
	ldr	x0, [x8, #104]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	mov	x9, x0
	subs	w8, w8, w9
	b.ge	LBB36_12
	b	LBB36_7
LBB36_7:                                ;   in Loop: Header=BB36_6 Depth=1
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x0, [x8, #104]
	ldursw	x1, [x29, #-12]
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em
	mov	x8, x0
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	ldr	x8, [x0]
	ldr	x8, [x8, #72]
	blr	x8
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	cbz	x0, LBB36_9
	b	LBB36_8
LBB36_8:                                ;   in Loop: Header=BB36_6 Depth=1
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	adrp	x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x2, __ZTIN7sc_core15sc_signal_in_ifIiEE@PAGE
	add	x2, x2, __ZTIN7sc_core15sc_signal_in_ifIiEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB36_10
LBB36_9:                                ;   in Loop: Header=BB36_6 Depth=1
	mov	x8, #0                          ; =0x0
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB36_10
LBB36_10:                               ;   in Loop: Header=BB36_6 Depth=1
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stur	x8, [x29, #-32]
	ldur	x8, [x29, #-24]
	ldr	x8, [x8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldur	x0, [x29, #-32]
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	blr	x8
	mov	x1, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldur	x8, [x29, #-24]
	add	x2, x8, #8
	mov	w3, #32                         ; =0x20
	bl	__ZN7sc_core8sc_traceEPNS_13sc_trace_fileERKiRKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
	b	LBB36_11
LBB36_11:                               ;   in Loop: Header=BB36_6 Depth=1
	ldur	w8, [x29, #-12]
	add	w8, w8, #1
	stur	w8, [x29, #-12]
	b	LBB36_6
LBB36_12:
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	bl	__ZNK7sc_core8sc_inoutIiE13remove_tracesEv
	b	LBB36_13
LBB36_13:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE ; -- Begin function _ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
	.p2align	2
__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE: ; @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldr	x8, [x8, #56]
	cbnz	x8, LBB37_9
	b	LBB37_1
LBB37_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	stur	w0, [x29, #-28]
	str	wzr, [sp, #32]
	b	LBB37_2
LBB37_2:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #32]
	ldur	w9, [x29, #-28]
	subs	w8, w8, w9
	b.ge	LBB37_8
	b	LBB37_3
LBB37_3:                                ;   in Loop: Header=BB37_2 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x0, x8, #72
	ldrsw	x1, [sp, #32]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	ldr	x8, [x0]
	str	x8, [sp, #24]
	ldr	x8, [sp, #24]
	cbz	x8, LBB37_5
	b	LBB37_4
LBB37_4:                                ;   in Loop: Header=BB37_2 Depth=1
	b	LBB37_6
LBB37_5:
	adrp	x0, l_.str.12@PAGE
	add	x0, x0, l_.str.12@PAGEOFF
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	mov	w2, #596                        ; =0x254
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB37_6:                                ;   in Loop: Header=BB37_2 Depth=1
	ldur	x8, [x29, #-16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #24]
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x0, x8, x9
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNK7sc_core12sc_port_base16add_static_eventEPNS_17sc_thread_processERKNS_8sc_eventE
	b	LBB37_7
LBB37_7:                                ;   in Loop: Header=BB37_2 Depth=1
	ldr	w8, [sp, #32]
	add	w8, w8, #1
	str	w8, [sp, #32]
	b	LBB37_2
LBB37_8:
	b	LBB37_10
LBB37_9:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x1, [x29, #-16]
	ldur	x2, [x29, #-24]
	bl	__ZNK7sc_core12sc_port_base14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
	b	LBB37_10
LBB37_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE ; -- Begin function _ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
	.p2align	2
__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE: ; @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldr	x8, [x8, #56]
	cbnz	x8, LBB38_9
	b	LBB38_1
LBB38_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	stur	w0, [x29, #-28]
	str	wzr, [sp, #32]
	b	LBB38_2
LBB38_2:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #32]
	ldur	w9, [x29, #-28]
	subs	w8, w8, w9
	b.ge	LBB38_8
	b	LBB38_3
LBB38_3:                                ;   in Loop: Header=BB38_2 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	add	x0, x8, #72
	ldrsw	x1, [sp, #32]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	ldr	x8, [x0]
	str	x8, [sp, #24]
	ldr	x8, [sp, #24]
	cbz	x8, LBB38_5
	b	LBB38_4
LBB38_4:                                ;   in Loop: Header=BB38_2 Depth=1
	b	LBB38_6
LBB38_5:
	adrp	x0, l_.str.12@PAGE
	add	x0, x0, l_.str.12@PAGEOFF
	adrp	x1, l_.str.8@PAGE
	add	x1, x1, l_.str.8@PAGEOFF
	mov	w2, #617                        ; =0x269
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB38_6:                                ;   in Loop: Header=BB38_2 Depth=1
	ldur	x8, [x29, #-16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #24]
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x0, x8, x9
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNK7sc_core12sc_port_base16add_static_eventEPNS_17sc_method_processERKNS_8sc_eventE
	b	LBB38_7
LBB38_7:                                ;   in Loop: Header=BB38_2 Depth=1
	ldr	w8, [sp, #32]
	add	w8, w8, #1
	str	w8, [sp, #32]
	b	LBB38_2
LBB38_8:
	b	LBB38_10
LBB38_9:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x1, [x29, #-16]
	ldur	x2, [x29, #-24]
	bl	__ZNK7sc_core12sc_port_base14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
	b	LBB38_10
LBB38_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_ ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x1, x8, x9
	bl	__ZN7sc_core12sc_port_base4bindERNS_12sc_interfaceE
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_ ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZN7sc_core12sc_port_base4bindERS0_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev ; -- Begin function _ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev
	.p2align	2
__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev: ; @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	mov	w1, #1                          ; =0x1
	mov	w2, #0                          ; =0x0
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x8, __ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core8sc_inoutIiE4kindEv ; -- Begin function _ZNK7sc_core8sc_inoutIiE4kindEv
	.weak_def_can_be_hidden	__ZNK7sc_core8sc_inoutIiE4kindEv
	.p2align	2
__ZNK7sc_core8sc_inoutIiE4kindEv:       ; @_ZNK7sc_core8sc_inoutIiE4kindEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_inoutIiED1Ev    ; -- Begin function _ZN7sc_core8sc_inoutIiED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core8sc_inoutIiED1Ev
	.p2align	2
__ZN7sc_core8sc_inoutIiED1Ev:           ; @_ZN7sc_core8sc_inoutIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core8sc_inoutIiED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_inoutIiED0Ev    ; -- Begin function _ZN7sc_core8sc_inoutIiED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core8sc_inoutIiED0Ev
	.p2align	2
__ZN7sc_core8sc_inoutIiED0Ev:           ; @_ZN7sc_core8sc_inoutIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core8sc_inoutIiED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x1, #120                        ; =0x78
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	w1, [x29, #-12]
	str	w2, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	w1, [x29, #-12]
	ldr	w2, [sp, #16]
	bl	__ZN7sc_core12sc_port_baseC2EiNS_14sc_port_policyE
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x9, __ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@GOTPAGE
	ldr	x9, [x9, __ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@GOTPAGEOFF]
	add	x9, x9, #16
	str	x9, [x8]
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8, #64]
	add	x0, x8, #72
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EE4kindEv ; -- Begin function _ZNK7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EE4kindEv
	.weak_def_can_be_hidden	__ZNK7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EE4kindEv
	.p2align	2
__ZNK7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EE4kindEv: ; @_ZNK7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EE4kindEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev ; -- Begin function _ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev
	.p2align	2
__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev: ; @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev ; -- Begin function _ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev
	.p2align	2
__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev: ; @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x1, #96                         ; =0x60
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core12sc_port_base4kindEv ; -- Begin function _ZNK7sc_core12sc_port_base4kindEv
	.weak_def_can_be_hidden	__ZNK7sc_core12sc_port_base4kindEv
	.p2align	2
__ZNK7sc_core12sc_port_base4kindEv:     ; @_ZNK7sc_core12sc_port_base4kindEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x1, #96                         ; =0x60
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0]
	str	xzr, [x0, #8]
	str	xzr, [x0, #16]
	bl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev ; -- Begin function _ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev
	.globl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev
	.p2align	2
__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev: ; @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev ; -- Begin function _ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev
	.globl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev
	.p2align	2
__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev: ; @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev ; -- Begin function _ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev
	.globl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev
	.p2align	2
__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev: ; @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	adrp	x9, __ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@GOTPAGE
	ldr	x9, [x9, __ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@GOTPAGEOFF]
	add	x9, x9, #16
	str	x9, [x8]
	add	x0, x8, #72
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZN7sc_core12sc_port_baseD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x1, [x29, #-8]
	str	x1, [sp, #8]                    ; 8-byte Folded Spill
Ltmp70:
	add	x0, sp, #16
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_
Ltmp71:
	b	LBB59_1
LBB59_1:
Ltmp72:
	add	x0, sp, #16
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev
Ltmp73:
	b	LBB59_2
LBB59_2:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB59_3:
Ltmp74:
	bl	___clang_call_terminate
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table59:
Lexception4:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Ltmp70-Lfunc_begin4            ; >> Call Site 1 <<
	.uleb128 Ltmp73-Ltmp70                  ;   Call between Ltmp70 and Ltmp73
	.uleb128 Ltmp74-Lfunc_begin4            ;     jumps to Ltmp74
	.byte	1                               ;   On action: 1
Lcst_end4:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase1:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldr	x8, [x8]
	ldr	x8, [x8]
	cbz	x8, LBB61_2
	b	LBB61_1
LBB61_1:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x9, [x8]
	ldr	x9, [x9]
	str	x9, [sp]                        ; 8-byte Folded Spill
	ldr	x0, [x8]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m
	b	LBB61_2
LBB61_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	str	x8, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [sp, #16]
	ldr	x1, [x0]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x1, [sp, #16]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev ; -- Begin function _ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev
	.globl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev: ; @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m: ; @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev ; -- Begin function _ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev
	.globl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev: ; @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x9, [sp, #8]
	ldr	x8, [x9, #16]
	ldr	x9, [x9]
	subs	x8, x8, x9
	mov	x9, #8                          ; =0x8
	sdiv	x0, x8, x9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev ; -- Begin function _ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	.globl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev: ; @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x9, [sp, #8]
	ldr	x8, [x9, #8]
	ldr	x9, [x9]
	subs	x8, x8, x9
	mov	x9, #8                          ; =0x8
	sdiv	x0, x8, x9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x8, [x29, #-8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [x8, #8]
	str	x8, [sp, #8]
	b	LBB68_1
LBB68_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #8]
	subs	x8, x8, x9
	b.eq	LBB68_4
	b	LBB68_2
LBB68_2:                                ;   in Loop: Header=BB68_1 Depth=1
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	str	x0, [sp, #8]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
Ltmp79:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_
Ltmp80:
	b	LBB68_3
LBB68_3:                                ;   in Loop: Header=BB68_1 Depth=1
	b	LBB68_1
LBB68_4:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #16]
	str	x8, [x9, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB68_5:
Ltmp81:
	bl	___clang_call_terminate
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table68:
Lexception5:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp79-Lfunc_begin5            ; >> Call Site 1 <<
	.uleb128 Ltmp80-Ltmp79                  ;   Call between Ltmp79 and Ltmp80
	.uleb128 Ltmp81-Lfunc_begin5            ;     jumps to Ltmp81
	.byte	1                               ;   On action: 1
Lcst_end5:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase2:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em ; -- Begin function _ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em
	.globl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em: ; @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_ ; -- Begin function _ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	.globl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	.weak_definition	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	.p2align	2
__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_: ; @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_ ; -- Begin function _ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_
	.globl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_
	.weak_definition	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_
	.p2align	2
__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_: ; @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m ; -- Begin function _ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m
	.globl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m
	.weak_definition	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m
	.p2align	2
__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m: ; @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #8]
	mov	x2, #8                          ; =0x8
	bl	__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm ; -- Begin function _ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	.globl	__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	.weak_definition	__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	.p2align	2
__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm: ; @_ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	ldur	x8, [x29, #-16]
	lsl	x8, x8, #3
	str	x8, [sp, #16]
	ldr	x0, [sp, #24]
	bl	__ZNSt3__124__is_overaligned_for_newB8ne200100Em
	tbz	w0, #0, LBB74_2
	b	LBB74_1
LBB74_1:
	ldr	x8, [sp, #24]
	str	x8, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_
	b	LBB74_3
LBB74_2:
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	bl	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_
	b	LBB74_3
LBB74_3:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__is_overaligned_for_newB8ne200100Em ; -- Begin function _ZNSt3__124__is_overaligned_for_newB8ne200100Em
	.globl	__ZNSt3__124__is_overaligned_for_newB8ne200100Em
	.weak_definition	__ZNSt3__124__is_overaligned_for_newB8ne200100Em
	.p2align	2
__ZNSt3__124__is_overaligned_for_newB8ne200100Em: ; @_ZNSt3__124__is_overaligned_for_newB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x8, x8, #16
	cset	w0, hi
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_ ; -- Begin function _ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_
	.globl	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_
	.weak_definition	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_
	.p2align	2
__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_: ; @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZdlPvmSt11align_val_t
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_ ; -- Begin function _ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_
	.globl	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_
	.weak_definition	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_
	.p2align	2
__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_: ; @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev ; -- Begin function _ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev
	.p2align	2
__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev: ; @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_inoutIiED2Ev    ; -- Begin function _ZN7sc_core8sc_inoutIiED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core8sc_inoutIiED2Ev
	.p2align	2
__ZN7sc_core8sc_inoutIiED2Ev:           ; @_ZN7sc_core8sc_inoutIiED2Ev
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	mov	x9, x8
	stur	x9, [x29, #-8]
	adrp	x9, __ZTVN7sc_core8sc_inoutIiEE@GOTPAGE
	ldr	x9, [x9, __ZTVN7sc_core8sc_inoutIiEE@GOTPAGEOFF]
	add	x9, x9, #16
	str	x9, [x8]
	ldr	x8, [x8, #112]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	cbz	x8, LBB79_2
	b	LBB79_1
LBB79_1:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	b	LBB79_2
LBB79_2:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [x8, #96]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	cbz	x8, LBB79_4
	b	LBB79_3
LBB79_3:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	mov	x1, #4                          ; =0x4
	bl	__ZdlPvm
	b	LBB79_4
LBB79_4:
Ltmp86:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNK7sc_core8sc_inoutIiE13remove_tracesEv
Ltmp87:
	b	LBB79_5
LBB79_5:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB79_6:
Ltmp88:
	bl	___clang_call_terminate
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table79:
Lexception6:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Lfunc_begin6-Lfunc_begin6      ; >> Call Site 1 <<
	.uleb128 Ltmp86-Lfunc_begin6            ;   Call between Lfunc_begin6 and Ltmp86
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp86-Lfunc_begin6            ; >> Call Site 2 <<
	.uleb128 Ltmp87-Ltmp86                  ;   Call between Ltmp86 and Ltmp87
	.uleb128 Ltmp88-Lfunc_begin6            ;     jumps to Ltmp88
	.byte	1                               ;   On action: 1
Lcst_end6:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase3:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNK7sc_core8sc_inoutIiE13remove_tracesEv ; -- Begin function _ZNK7sc_core8sc_inoutIiE13remove_tracesEv
	.weak_definition	__ZNK7sc_core8sc_inoutIiE13remove_tracesEv
	.p2align	2
__ZNK7sc_core8sc_inoutIiE13remove_tracesEv: ; @_ZNK7sc_core8sc_inoutIiE13remove_tracesEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	ldr	x8, [x8, #104]
	cbz	x8, LBB80_10
	b	LBB80_1
LBB80_1:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x0, [x8, #104]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	mov	x8, x0
	subs	w8, w8, #1
	stur	w8, [x29, #-12]
	b	LBB80_2
LBB80_2:                                ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-12]
	tbnz	w8, #31, LBB80_7
	b	LBB80_3
LBB80_3:                                ;   in Loop: Header=BB80_2 Depth=1
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x0, [x8, #104]
	ldursw	x1, [x29, #-12]
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em
	ldr	x8, [x0]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	cbz	x8, LBB80_5
	b	LBB80_4
LBB80_4:                                ;   in Loop: Header=BB80_2 Depth=1
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZN7sc_core15sc_trace_paramsD1Ev
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	mov	x1, #32                         ; =0x20
	bl	__ZdlPvm
	b	LBB80_5
LBB80_5:                                ;   in Loop: Header=BB80_2 Depth=1
	b	LBB80_6
LBB80_6:                                ;   in Loop: Header=BB80_2 Depth=1
	ldur	w8, [x29, #-12]
	subs	w8, w8, #1
	stur	w8, [x29, #-12]
	b	LBB80_2
LBB80_7:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8, #104]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	cbz	x8, LBB80_9
	b	LBB80_8
LBB80_8:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	mov	x1, #24                         ; =0x18
	bl	__ZdlPvm
	b	LBB80_9
LBB80_9:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8, #104]
	b	LBB80_10
LBB80_10:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev ; -- Begin function _ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	.globl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev: ; @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x9, [sp, #8]
	ldr	x8, [x9, #8]
	ldr	x9, [x9]
	subs	x8, x8, x9
	mov	x9, #8                          ; =0x8
	sdiv	x0, x8, x9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em ; -- Begin function _ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em
	.globl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em
	.weak_definition	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em
	.p2align	2
__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em: ; @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	ldr	x9, [sp]
	add	x0, x8, x9, lsl #3
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_trace_paramsD1Ev ; -- Begin function _ZN7sc_core15sc_trace_paramsD1Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_trace_paramsD1Ev
	.p2align	2
__ZN7sc_core15sc_trace_paramsD1Ev:      ; @_ZN7sc_core15sc_trace_paramsD1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core15sc_trace_paramsD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_trace_paramsD2Ev ; -- Begin function _ZN7sc_core15sc_trace_paramsD2Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_trace_paramsD2Ev
	.p2align	2
__ZN7sc_core15sc_trace_paramsD2Ev:      ; @_ZN7sc_core15sc_trace_paramsD2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x1, [x29, #-8]
	str	x1, [sp, #8]                    ; 8-byte Folded Spill
Ltmp91:
	add	x0, sp, #16
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_
Ltmp92:
	b	LBB86_1
LBB86_1:
Ltmp93:
	add	x0, sp, #16
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev
Ltmp94:
	b	LBB86_2
LBB86_2:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB86_3:
Ltmp95:
	bl	___clang_call_terminate
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table86:
Lexception7:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase4-Lttbaseref4
Lttbaseref4:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Ltmp91-Lfunc_begin7            ; >> Call Site 1 <<
	.uleb128 Ltmp94-Ltmp91                  ;   Call between Ltmp91 and Ltmp94
	.uleb128 Ltmp95-Lfunc_begin7            ;     jumps to Ltmp95
	.byte	1                               ;   On action: 1
Lcst_end7:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase4:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_
	.globl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_: ; @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev
	.weak_definition	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldr	x8, [x8]
	ldr	x8, [x8]
	cbz	x8, LBB88_2
	b	LBB88_1
LBB88_1:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x9, [x8]
	ldr	x9, [x9]
	str	x9, [sp]                        ; 8-byte Folded Spill
	ldr	x0, [x8]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m
	b	LBB88_2
LBB88_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_
	.globl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_: ; @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	str	x8, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev
	.weak_definition	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [sp, #16]
	ldr	x1, [x0]
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x1, [sp, #16]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev ; -- Begin function _ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev
	.globl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev: ; @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m: ; @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev ; -- Begin function _ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev
	.globl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev: ; @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x9, [sp, #8]
	ldr	x8, [x9, #16]
	ldr	x9, [x9]
	subs	x8, x8, x9
	mov	x9, #8                          ; =0x8
	sdiv	x0, x8, x9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_
	.globl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_
	.weak_definition	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_: ; @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x8, [x29, #-8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [x8, #8]
	str	x8, [sp, #8]
	b	LBB94_1
LBB94_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #8]
	subs	x8, x8, x9
	b.eq	LBB94_4
	b	LBB94_2
LBB94_2:                                ;   in Loop: Header=BB94_1 Depth=1
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	str	x0, [sp, #8]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_
	mov	x1, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
Ltmp99:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_
Ltmp100:
	b	LBB94_3
LBB94_3:                                ;   in Loop: Header=BB94_1 Depth=1
	b	LBB94_1
LBB94_4:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #16]
	str	x8, [x9, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB94_5:
Ltmp101:
	bl	___clang_call_terminate
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table94:
Lexception8:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Ltmp99-Lfunc_begin8            ; >> Call Site 1 <<
	.uleb128 Ltmp100-Ltmp99                 ;   Call between Ltmp99 and Ltmp100
	.uleb128 Ltmp101-Lfunc_begin8           ;     jumps to Ltmp101
	.byte	1                               ;   On action: 1
Lcst_end8:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase5:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em ; -- Begin function _ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em
	.globl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em: ; @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_ ; -- Begin function _ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_
	.globl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_
	.weak_definition	__ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_
	.p2align	2
__ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_: ; @_ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_ ; -- Begin function _ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_
	.globl	__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_
	.weak_definition	__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_
	.p2align	2
__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_: ; @_ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m ; -- Begin function _ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m
	.globl	__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m
	.weak_definition	__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m
	.p2align	2
__ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m: ; @_ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #8]
	mov	x2, #8                          ; =0x8
	bl	__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm ; -- Begin function _ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	.globl	__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	.weak_definition	__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	.p2align	2
__ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm: ; @_ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	ldur	x8, [x29, #-16]
	lsl	x8, x8, #3
	str	x8, [sp, #16]
	ldr	x0, [sp, #24]
	bl	__ZNSt3__124__is_overaligned_for_newB8ne200100Em
	tbz	w0, #0, LBB100_2
	b	LBB100_1
LBB100_1:
	ldr	x8, [sp, #24]
	str	x8, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_
	b	LBB100_3
LBB100_2:
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	bl	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_
	b	LBB100_3
LBB100_3:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_ ; -- Begin function _ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_
	.globl	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_
	.weak_definition	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_
	.p2align	2
__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_: ; @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZdlPvmSt11align_val_t
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_ ; -- Begin function _ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_
	.globl	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_
	.weak_definition	__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_
	.p2align	2
__ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_: ; @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110type_indexC1B8ne200100ERKSt9type_info ; -- Begin function _ZNSt3__110type_indexC1B8ne200100ERKSt9type_info
	.globl	__ZNSt3__110type_indexC1B8ne200100ERKSt9type_info
	.weak_def_can_be_hidden	__ZNSt3__110type_indexC1B8ne200100ERKSt9type_info
	.p2align	2
__ZNSt3__110type_indexC1B8ne200100ERKSt9type_info: ; @_ZNSt3__110type_indexC1B8ne200100ERKSt9type_info
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__110type_indexC2B8ne200100ERKSt9type_info
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__110type_indexC2B8ne200100ERKSt9type_info ; -- Begin function _ZNSt3__110type_indexC2B8ne200100ERKSt9type_info
	.globl	__ZNSt3__110type_indexC2B8ne200100ERKSt9type_info
	.weak_def_can_be_hidden	__ZNSt3__110type_indexC2B8ne200100ERKSt9type_info
	.p2align	2
__ZNSt3__110type_indexC2B8ne200100ERKSt9type_info: ; @_ZNSt3__110type_indexC2B8ne200100ERKSt9type_info
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	str	x8, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv ; -- Begin function _ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	.weak_definition	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	.p2align	2
__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv: ; @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #72
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	ldr	x9, [sp]
	add	x0, x8, x9, lsl #3
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE12emplace_backIJRKS4_EEERS4_DpOT_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE12emplace_backIJRKS4_EEERS4_DpOT_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE12emplace_backIJRKS4_EEERS4_DpOT_
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE12emplace_backIJRKS4_EEERS4_DpOT_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE12emplace_backIJRKS4_EEERS4_DpOT_: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE12emplace_backIJRKS4_EEERS4_DpOT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x9, [x29, #-8]
	str	x9, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [x9, #8]
	str	x8, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x9, #16]
	subs	x8, x8, x9
	b.hs	LBB108_2
	b	LBB108_1
LBB108_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x1, [sp, #16]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_
	ldr	x8, [sp, #8]
	add	x8, x8, #8
	str	x8, [sp, #8]
	b	LBB108_3
LBB108_2:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x1, [sp, #16]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_
	str	x0, [sp, #8]
	b	LBB108_3
LBB108_3:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]
	str	x8, [x9, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_
Lfunc_begin9:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception9
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x1, [x29, #-8]
	str	x1, [sp]                        ; 8-byte Folded Spill
	add	x0, sp, #24
	mov	x2, #1                          ; =0x1
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m
	ldr	x0, [sp, #32]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldur	x2, [x29, #-16]
Ltmp107:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_
Ltmp108:
	b	LBB109_1
LBB109_1:
	add	x0, sp, #24
	ldr	x8, [sp, #32]
	add	x8, x8, #8
	str	x8, [sp, #32]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB109_2:
Ltmp109:
	str	x0, [sp, #16]
	mov	x8, x1
	str	w8, [sp, #12]
	add	x0, sp, #24
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev
	b	LBB109_3
LBB109_3:
	ldr	x0, [sp, #16]
	bl	__Unwind_Resume
Lfunc_end9:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table109:
Lexception9:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end9-Lcst_begin9
Lcst_begin9:
	.uleb128 Lfunc_begin9-Lfunc_begin9      ; >> Call Site 1 <<
	.uleb128 Ltmp107-Lfunc_begin9           ;   Call between Lfunc_begin9 and Ltmp107
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp107-Lfunc_begin9           ; >> Call Site 2 <<
	.uleb128 Ltmp108-Ltmp107                ;   Call between Ltmp107 and Ltmp108
	.uleb128 Ltmp109-Lfunc_begin9           ;     jumps to Ltmp109
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp108-Lfunc_begin9           ; >> Call Site 3 <<
	.uleb128 Lfunc_end9-Ltmp108             ;   Call between Ltmp108 and Lfunc_end9
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end9:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_ ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_
Lfunc_begin10:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception10
; %bb.0:
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	mov	x8, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	add	x1, x8, #1
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em
	mov	x1, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	str	x1, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x3, [sp, #16]                   ; 8-byte Folded Reload
	mov	x2, x0
	add	x0, sp, #40
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_
	ldr	x0, [sp, #56]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x2, [x29, #-16]
Ltmp110:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_
Ltmp111:
	b	LBB110_1
LBB110_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	add	x1, sp, #40
	ldr	x8, [sp, #56]
	add	x8, x8, #8
	str	x8, [sp, #56]
Ltmp112:
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE
Ltmp113:
	b	LBB110_2
LBB110_2:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [x8, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, sp, #40
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB110_3:
Ltmp114:
	str	x0, [sp, #32]
	mov	x8, x1
	str	w8, [sp, #28]
	add	x0, sp, #40
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev
	b	LBB110_4
LBB110_4:
	ldr	x0, [sp, #32]
	bl	__Unwind_Resume
Lfunc_end10:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table110:
Lexception10:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end10-Lcst_begin10
Lcst_begin10:
	.uleb128 Lfunc_begin10-Lfunc_begin10    ; >> Call Site 1 <<
	.uleb128 Ltmp110-Lfunc_begin10          ;   Call between Lfunc_begin10 and Ltmp110
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp110-Lfunc_begin10          ; >> Call Site 2 <<
	.uleb128 Ltmp113-Ltmp110                ;   Call between Ltmp110 and Ltmp113
	.uleb128 Ltmp114-Lfunc_begin10          ;     jumps to Ltmp114
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp113-Lfunc_begin10          ; >> Call Site 3 <<
	.uleb128 Lfunc_end10-Ltmp113            ;   Call between Ltmp113 and Lfunc_end10
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end10:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	bl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE9constructB8ne200100IS4_JRKS4_EEEvPT_DpOT0_
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x0, [sp, #24]
	ldr	x8, [sp, #16]
	str	x8, [x0]
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #8]
	str	x8, [x0, #8]
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #8]
	ldr	x9, [sp, #8]
	add	x8, x8, x9, lsl #3
	str	x8, [x0, #16]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE9constructB8ne200100IS4_JRKS4_EEEvPT_DpOT0_ ; -- Begin function _ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE9constructB8ne200100IS4_JRKS4_EEEvPT_DpOT0_
	.weak_definition	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE9constructB8ne200100IS4_JRKS4_EEEvPT_DpOT0_
	.p2align	2
__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE9constructB8ne200100IS4_JRKS4_EEEvPT_DpOT0_: ; @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE9constructB8ne200100IS4_JRKS4_EEEvPT_DpOT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x9, [sp, #16]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	str	x8, [x9]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	ldr	x8, [x0, #8]
	ldr	x9, [x0]
	str	x8, [x9, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em ; -- Begin function _ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em
	.globl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em: ; @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	ldur	x0, [x29, #-16]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev
	str	x0, [sp, #32]
	ldur	x8, [x29, #-24]
	ldr	x9, [sp, #32]
	subs	x8, x8, x9
	b.ls	LBB117_2
	b	LBB117_1
LBB117_1:
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev
LBB117_2:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev
	str	x0, [sp, #24]
	ldr	x8, [sp, #24]
	ldr	x9, [sp, #32]
	mov	x10, #2                         ; =0x2
	udiv	x9, x9, x10
	subs	x8, x8, x9
	b.lo	LBB117_4
	b	LBB117_3
LBB117_3:
	ldr	x8, [sp, #32]
	stur	x8, [x29, #-8]
	b	LBB117_5
LBB117_4:
	ldr	x9, [sp, #24]
	mov	x8, #2                          ; =0x2
	mul	x8, x8, x9
	add	x0, sp, #16
	str	x8, [sp, #16]
	sub	x1, x29, #24
	bl	__ZNSt3__13maxB8ne200100ImEERKT_S3_S3_
	ldr	x8, [x0]
	stur	x8, [x29, #-8]
	b	LBB117_5
LBB117_5:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_ ; -- Begin function _ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_
	.globl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_
	.p2align	2
__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_: ; @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	str	x3, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x1, [x29, #-16]
	ldr	x2, [sp, #24]
	ldr	x3, [sp, #16]
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x9, [x29, #-16]
	ldr	x9, [x9, #8]
	ldr	x10, [x8, #8]
	ldr	x11, [x8]
	subs	x10, x10, x11
	mov	x11, #8                         ; =0x8
	sdiv	x11, x10, x11
	mov	x10, #0                         ; =0x0
	subs	x10, x10, x11
	add	x9, x9, x10, lsl #3
	str	x9, [sp, #24]
	ldr	x0, [x8]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x0, [x8, #8]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x0, [sp, #24]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	ldr	x2, [sp, #8]                    ; 8-byte Folded Reload
	mov	x3, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #24]
	ldur	x9, [x29, #-16]
	str	x8, [x9, #8]
	ldr	x8, [x0]
	str	x8, [x0, #8]
	ldur	x8, [x29, #-16]
	add	x1, x8, #8
	bl	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	add	x0, x9, #8
	add	x1, x8, #16
	bl	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	add	x0, x9, #16
	add	x1, x8, #24
	bl	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	ldr	x8, [x8, #8]
	ldur	x9, [x29, #-16]
	str	x8, [x9]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	mov	x1, x0
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev ; -- Begin function _ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev
	.globl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev
	.p2align	2
__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev: ; @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev ; -- Begin function _ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev
	.globl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev: ; @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev
Lfunc_begin11:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception11
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_
	sub	x8, x29, #16
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	stur	x0, [x29, #-16]
	bl	__ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	add	x1, sp, #24
	str	x8, [sp, #24]
Ltmp118:
	bl	__ZNSt3__13minB8ne200100ImEERKT_S3_S3_
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp119:
	b	LBB121_1
LBB121_1:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB121_2:
Ltmp120:
	bl	___clang_call_terminate
Lfunc_end11:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table121:
Lexception11:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase6-Lttbaseref6
Lttbaseref6:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end11-Lcst_begin11
Lcst_begin11:
	.uleb128 Ltmp118-Lfunc_begin11          ; >> Call Site 1 <<
	.uleb128 Ltmp119-Ltmp118                ;   Call between Ltmp118 and Ltmp119
	.uleb128 Ltmp120-Lfunc_begin11          ;     jumps to Ltmp120
	.byte	1                               ;   On action: 1
Lcst_end11:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase6:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev ; -- Begin function _ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev
	.globl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev
	.weak_definition	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev
	.p2align	2
__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev: ; @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__13maxB8ne200100ImEERKT_S3_S3_ ; -- Begin function _ZNSt3__13maxB8ne200100ImEERKT_S3_S3_
	.globl	__ZNSt3__13maxB8ne200100ImEERKT_S3_S3_
	.weak_definition	__ZNSt3__13maxB8ne200100ImEERKT_S3_S3_
	.p2align	2
__ZNSt3__13maxB8ne200100ImEERKT_S3_S3_: ; @_ZNSt3__13maxB8ne200100ImEERKT_S3_S3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	bl	__ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__13minB8ne200100ImEERKT_S3_S3_ ; -- Begin function _ZNSt3__13minB8ne200100ImEERKT_S3_S3_
	.globl	__ZNSt3__13minB8ne200100ImEERKT_S3_S3_
	.weak_definition	__ZNSt3__13minB8ne200100ImEERKT_S3_S3_
	.p2align	2
__ZNSt3__13minB8ne200100ImEERKT_S3_S3_: ; @_ZNSt3__13minB8ne200100ImEERKT_S3_S3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	bl	__ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_ ; -- Begin function _ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_
	.weak_definition	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_
	.p2align	2
__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_: ; @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev ; -- Begin function _ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev
	.globl	__ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev
	.weak_definition	__ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev
	.p2align	2
__ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev: ; @_ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_ ; -- Begin function _ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	.globl	__ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	.weak_definition	__ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	.p2align	2
__ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_: ; @_ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x1, [sp, #8]
	ldr	x2, [sp, #16]
	sub	x0, x29, #1
	bl	__ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_
	tbz	w0, #0, LBB127_2
	b	LBB127_1
LBB127_1:
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	b	LBB127_3
LBB127_2:
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	b	LBB127_3
LBB127_3:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_ ; -- Begin function _ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_
	.globl	__ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_
	.weak_definition	__ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_
	.p2align	2
__ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_: ; @_ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x8, [sp, #16]
	ldr	x8, [x8]
	ldr	x9, [sp, #8]
	ldr	x9, [x9]
	subs	x8, x8, x9
	cset	w0, lo
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev ; -- Begin function _ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev
	.globl	__ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev
	.weak_definition	__ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev
	.p2align	2
__ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev: ; @_ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	mov	x0, #2305843009213693951        ; =0x1fffffffffffffff
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev ; -- Begin function _ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev
	.globl	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev
	.weak_definition	__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev
	.p2align	2
__ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev: ; @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev
	.cfi_startproc
; %bb.0:
	mov	x0, #9223372036854775807        ; =0x7fffffffffffffff
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__120__throw_length_errorB8ne200100EPKc ; -- Begin function _ZNSt3__120__throw_length_errorB8ne200100EPKc
	.globl	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.weak_definition	__ZNSt3__120__throw_length_errorB8ne200100EPKc
	.p2align	2
__ZNSt3__120__throw_length_errorB8ne200100EPKc: ; @_ZNSt3__120__throw_length_errorB8ne200100EPKc
Lfunc_begin12:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception12
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	mov	x0, #16                         ; =0x10
	bl	___cxa_allocate_exception
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldur	x1, [x29, #-8]
Ltmp123:
	bl	__ZNSt12length_errorC1B8ne200100EPKc
Ltmp124:
	b	LBB131_1
LBB131_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x1, __ZTISt12length_error@GOTPAGE
	ldr	x1, [x1, __ZTISt12length_error@GOTPAGEOFF]
	adrp	x2, __ZNSt12length_errorD1Ev@GOTPAGE
	ldr	x2, [x2, __ZNSt12length_errorD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
LBB131_2:
Ltmp125:
	mov	x8, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	str	x8, [sp, #16]
	mov	x8, x1
	str	w8, [sp, #12]
	bl	___cxa_free_exception
	b	LBB131_3
LBB131_3:
	ldr	x0, [sp, #16]
	bl	__Unwind_Resume
Lfunc_end12:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table131:
Lexception12:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end12-Lcst_begin12
Lcst_begin12:
	.uleb128 Lfunc_begin12-Lfunc_begin12    ; >> Call Site 1 <<
	.uleb128 Ltmp123-Lfunc_begin12          ;   Call between Lfunc_begin12 and Ltmp123
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp123-Lfunc_begin12          ; >> Call Site 2 <<
	.uleb128 Ltmp124-Ltmp123                ;   Call between Ltmp123 and Ltmp124
	.uleb128 Ltmp125-Lfunc_begin12          ;     jumps to Ltmp125
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp124-Lfunc_begin12          ; >> Call Site 3 <<
	.uleb128 Lfunc_end12-Ltmp124            ;   Call between Ltmp124 and Lfunc_end12
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end12:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt12length_errorC1B8ne200100EPKc ; -- Begin function _ZNSt12length_errorC1B8ne200100EPKc
	.globl	__ZNSt12length_errorC1B8ne200100EPKc
	.weak_def_can_be_hidden	__ZNSt12length_errorC1B8ne200100EPKc
	.p2align	2
__ZNSt12length_errorC1B8ne200100EPKc:   ; @_ZNSt12length_errorC1B8ne200100EPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt12length_errorC2B8ne200100EPKc
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt12length_errorC2B8ne200100EPKc ; -- Begin function _ZNSt12length_errorC2B8ne200100EPKc
	.globl	__ZNSt12length_errorC2B8ne200100EPKc
	.weak_def_can_be_hidden	__ZNSt12length_errorC2B8ne200100EPKc
	.p2align	2
__ZNSt12length_errorC2B8ne200100EPKc:   ; @_ZNSt12length_errorC2B8ne200100EPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt11logic_errorC2EPKc
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x8, __ZTVSt12length_error@GOTPAGE
	ldr	x8, [x8, __ZTVSt12length_error@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_ ; -- Begin function _ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	.globl	__ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	.weak_definition	__ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	.p2align	2
__ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_: ; @_ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	sub	x0, x29, #1
	bl	__ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_
	tbz	w0, #0, LBB134_2
	b	LBB134_1
LBB134_1:
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	b	LBB134_3
LBB134_2:
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	b	LBB134_3
LBB134_3:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_ ; -- Begin function _ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_
	.globl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_
	.p2align	2
__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_: ; @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	str	x2, [sp, #32]
	str	x3, [sp, #24]
	ldur	x9, [x29, #-16]
	str	x9, [sp]                        ; 8-byte Folded Spill
	mov	x8, x9
	stur	x8, [x29, #-8]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x9, #24]
	ldr	x8, [sp, #24]
	str	x8, [x9, #32]
	ldur	x8, [x29, #-24]
	cbnz	x8, LBB135_2
	b	LBB135_1
LBB135_1:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
                                        ; kill: def $x9 killed $xzr
	str	xzr, [x8]
	b	LBB135_3
LBB135_2:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	x0, [x8, #32]
	ldur	x1, [x29, #-24]
	bl	__ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	str	x0, [sp, #8]
	str	x1, [sp, #16]
	ldr	x8, [sp, #8]
	str	x8, [x9]
	ldr	x8, [sp, #16]
	stur	x8, [x29, #-24]
	b	LBB135_3
LBB135_3:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [x9]
	ldr	x10, [sp, #32]
	add	x8, x8, x10, lsl #3
	str	x8, [x9, #16]
	str	x8, [x9, #8]
	ldr	x8, [x9]
	ldur	x10, [x29, #-24]
	add	x8, x8, x10, lsl #3
	str	x8, [x9, #24]
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m ; -- Begin function _ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m
	.globl	__ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m
	.weak_definition	__ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m
	.p2align	2
__ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m: ; @_ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em
	str	x0, [sp, #16]
	ldr	x8, [sp]
	str	x8, [sp, #24]
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #24]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em ; -- Begin function _ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em
	.globl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em
	.weak_definition	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em
	.p2align	2
__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em: ; @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	subs	x8, x8, x0
	b.ls	LBB137_2
	b	LBB137_1
LBB137_1:
	bl	__ZSt28__throw_bad_array_new_lengthB8ne200100v
LBB137_2:
	ldr	x0, [sp, #16]
	mov	x1, #8                          ; =0x8
	bl	__ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZSt28__throw_bad_array_new_lengthB8ne200100v ; -- Begin function _ZSt28__throw_bad_array_new_lengthB8ne200100v
	.globl	__ZSt28__throw_bad_array_new_lengthB8ne200100v
	.weak_definition	__ZSt28__throw_bad_array_new_lengthB8ne200100v
	.p2align	2
__ZSt28__throw_bad_array_new_lengthB8ne200100v: ; @_ZSt28__throw_bad_array_new_lengthB8ne200100v
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	x0, #8                          ; =0x8
	bl	___cxa_allocate_exception
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt20bad_array_new_lengthC1Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x1, __ZTISt20bad_array_new_length@GOTPAGE
	ldr	x1, [x1, __ZTISt20bad_array_new_length@GOTPAGEOFF]
	adrp	x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGE
	ldr	x2, [x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm ; -- Begin function _ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm
	.globl	__ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm
	.weak_definition	__ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm
	.p2align	2
__ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm: ; @_ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	str	x1, [sp, #24]
	ldur	x8, [x29, #-16]
	lsl	x8, x8, #3
	str	x8, [sp, #16]
	ldr	x0, [sp, #24]
	bl	__ZNSt3__124__is_overaligned_for_newB8ne200100Em
	tbz	w0, #0, LBB139_2
	b	LBB139_1
LBB139_1:
	ldr	x8, [sp, #24]
	str	x8, [sp, #8]
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #8]
	bl	__ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_
	stur	x0, [x29, #-8]
	b	LBB139_3
LBB139_2:
	ldr	x0, [sp, #16]
	bl	__ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_
	stur	x0, [x29, #-8]
	b	LBB139_3
LBB139_3:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_ ; -- Begin function _ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_
	.globl	__ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_
	.weak_definition	__ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_
	.p2align	2
__ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_: ; @_ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x1, [sp]
	bl	__ZnwmSt11align_val_t
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_ ; -- Begin function _ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_
	.globl	__ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_
	.weak_definition	__ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_
	.p2align	2
__ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_: ; @_ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__Znwm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_ ; -- Begin function _ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_
	.globl	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_
	.weak_definition	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_
	.p2align	2
__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_: ; @_ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	str	x3, [sp, #16]
	ldr	x0, [sp, #16]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x0, [x29, #-16]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [sp, #24]
	ldur	x9, [x29, #-16]
	subs	x9, x8, x9
	mov	x8, #8                          ; =0x8
	sdiv	x9, x9, x8
	mul	x2, x8, x9
	bl	_memcpy
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_ ; -- Begin function _ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	.globl	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	.weak_definition	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	.p2align	2
__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_: ; @_ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x8, [sp, #24]
	ldr	x8, [x8]
	str	x8, [sp, #8]
	ldr	x8, [sp, #16]
	ldr	x8, [x8]
	ldr	x9, [sp, #24]
	str	x8, [x9]
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #16]
	str	x8, [x9]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em ; -- Begin function _ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em
	.globl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em: ; @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev ; -- Begin function _ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev
	.globl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev
	.weak_def_can_be_hidden	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev
	.p2align	2
__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev: ; @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev
Lfunc_begin13:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception13
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	ldur	x0, [x29, #-16]
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	mov	x8, x0
	stur	x8, [x29, #-8]
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8]
	cbz	x8, LBB145_3
	b	LBB145_1
LBB145_1:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x0, #32]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [x0]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
Ltmp128:
	bl	__ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp129:
	b	LBB145_2
LBB145_2:
	ldr	x2, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m
	b	LBB145_3
LBB145_3:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB145_4:
Ltmp130:
	bl	___clang_call_terminate
Lfunc_end13:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table145:
Lexception13:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase7-Lttbaseref7
Lttbaseref7:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end13-Lcst_begin13
Lcst_begin13:
	.uleb128 Ltmp128-Lfunc_begin13          ; >> Call Site 1 <<
	.uleb128 Ltmp129-Ltmp128                ;   Call between Ltmp128 and Ltmp129
	.uleb128 Ltmp130-Lfunc_begin13          ;     jumps to Ltmp130
	.byte	1                               ;   On action: 1
Lcst_end13:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase7:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev ; -- Begin function _ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev
	.globl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev
	.weak_definition	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev
	.p2align	2
__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev: ; @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	ldr	x1, [x0, #8]
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev ; -- Begin function _ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev
	.globl	__ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev
	.weak_definition	__ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev
	.p2align	2
__ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev: ; @_ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x9, [sp, #8]
	ldr	x8, [x9, #24]
	ldr	x9, [x9]
	subs	x8, x8, x9
	mov	x9, #8                          ; =0x8
	sdiv	x0, x8, x9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_ ; -- Begin function _ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_
	.globl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_
	.weak_definition	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_
	.p2align	2
__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_: ; @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE ; -- Begin function _ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE
	.globl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE
	.weak_definition	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE
	.p2align	2
__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE: ; @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE
Lfunc_begin14:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception14
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	str	x1, [sp, #24]
	ldur	x8, [x29, #-16]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	b	LBB149_1
LBB149_1:                               ; =>This Inner Loop Header: Depth=1
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #24]
	ldr	x9, [x9, #16]
	subs	x8, x8, x9
	b.eq	LBB149_4
	b	LBB149_2
LBB149_2:                               ;   in Loop: Header=BB149_1 Depth=1
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [x8, #32]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x9, [x8, #16]
	subs	x0, x9, #8
	str	x0, [x8, #16]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
Ltmp132:
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_
Ltmp133:
	b	LBB149_3
LBB149_3:                               ;   in Loop: Header=BB149_1 Depth=1
	b	LBB149_1
LBB149_4:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB149_5:
Ltmp134:
	bl	___clang_call_terminate
Lfunc_end14:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table149:
Lexception14:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase8-Lttbaseref8
Lttbaseref8:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end14-Lcst_begin14
Lcst_begin14:
	.uleb128 Ltmp132-Lfunc_begin14          ; >> Call Site 1 <<
	.uleb128 Ltmp133-Ltmp132                ;   Call between Ltmp132 and Ltmp133
	.uleb128 Ltmp134-Lfunc_begin14          ;     jumps to Ltmp134
	.byte	1                               ;   On action: 1
Lcst_end14:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase8:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core8sc_inoutIiE5writeERKi ; -- Begin function _ZN7sc_core8sc_inoutIiE5writeERKi
	.weak_definition	__ZN7sc_core8sc_inoutIiE5writeERKi
	.p2align	2
__ZN7sc_core8sc_inoutIiE5writeERKi:     ; @_ZN7sc_core8sc_inoutIiE5writeERKi
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEptEv
	mov	x8, x0
	ldr	x1, [sp]
	add	x0, x8, #8
	ldr	x8, [x8, #8]
	ldr	x8, [x8, #32]
	blr	x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEptEv ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEptEv
	.weak_definition	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEptEv
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEptEv: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEptEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [x8, #64]
	cbnz	x8, LBB151_2
	b	LBB151_1
LBB151_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x1, __ZN7sc_core13SC_ID_GET_IF_E@GOTPAGE
	ldr	x1, [x1, __ZN7sc_core13SC_ID_GET_IF_E@GOTPAGEOFF]
	adrp	x2, l_.str.11@PAGE
	add	x2, x2, l_.str.11@PAGEOFF
	bl	__ZNK7sc_core12sc_port_base12report_errorEPKcS2_
	bl	__ZN7sc_core8sc_abortEv
LBB151_2:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	x0, [x8, #64]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em ; -- Begin function _ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	.globl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	.weak_definition	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	.p2align	2
__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em: ; @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	ldr	x9, [sp]
	add	x0, x8, x9, lsl #3
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core5sc_inIbE4readEv   ; -- Begin function _ZNK7sc_core5sc_inIbE4readEv
	.weak_definition	__ZNK7sc_core5sc_inIbE4readEv
	.p2align	2
__ZNK7sc_core5sc_inIbE4readEv:          ; @_ZNK7sc_core5sc_inIbE4readEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNK7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
	blr	x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc ; -- Begin function _ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.globl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.weak_definition	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.p2align	2
__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc: ; @_ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x0, [sp, #16]
	bl	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E ; -- Begin function _ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	.globl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	.weak_definition	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	.p2align	2
__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E: ; @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	blr	x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_ ; -- Begin function _ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.globl	__ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.weak_definition	__ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.p2align	2
__ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_: ; @_ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
	mov	w1, #10                         ; =0xa
	bl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec
	mov	x1, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	ldr	x0, [sp, #8]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv ; -- Begin function _ZNK7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv
	.weak_definition	__ZNK7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv
	.p2align	2
__ZNK7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv: ; @_ZNK7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZN7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv ; -- Begin function _ZN7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv
	.weak_definition	__ZN7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv
	.p2align	2
__ZN7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv: ; @_ZN7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [x8, #64]
	cbnz	x8, LBB158_2
	b	LBB158_1
LBB158_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	adrp	x1, __ZN7sc_core13SC_ID_GET_IF_E@GOTPAGE
	ldr	x1, [x1, __ZN7sc_core13SC_ID_GET_IF_E@GOTPAGEOFF]
	adrp	x2, l_.str.11@PAGE
	add	x2, x2, l_.str.11@PAGEOFF
	bl	__ZNK7sc_core12sc_port_base12report_errorEPKcS2_
	bl	__ZN7sc_core8sc_abortEv
LBB158_2:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	x0, [x8, #64]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ; -- Begin function _ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.globl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_definition	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	2
__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ; @_ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin15:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception15
; %bb.0:
	sub	sp, sp, #160
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	ldur	x1, [x29, #-8]
Ltmp136:
	sub	x0, x29, #40
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp137:
	b	LBB159_1
LBB159_1:
Ltmp139:
	sub	x0, x29, #40
	bl	__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev
	str	w0, [sp, #68]                   ; 4-byte Folded Spill
Ltmp140:
	b	LBB159_2
LBB159_2:
	ldr	w8, [sp, #68]                   ; 4-byte Folded Reload
	tbz	w8, #0, LBB159_18
	b	LBB159_3
LBB159_3:
	ldur	x1, [x29, #-8]
	add	x0, sp, #72
	bl	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE
	ldur	x8, [x29, #-16]
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	ldur	x8, [x29, #-8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
Ltmp141:
	bl	__ZNKSt3__18ios_base5flagsB8ne200100Ev
	str	w0, [sp, #64]                   ; 4-byte Folded Spill
Ltmp142:
	b	LBB159_4
LBB159_4:
	ldr	w8, [sp, #64]                   ; 4-byte Folded Reload
	mov	w9, #176                        ; =0xb0
	and	w8, w8, w9
	subs	w8, w8, #32
	b.ne	LBB159_6
	b	LBB159_5
LBB159_5:
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-24]
	add	x8, x8, x9
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	b	LBB159_7
LBB159_6:
	ldur	x8, [x29, #-16]
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	b	LBB159_7
LBB159_7:
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-24]
	add	x8, x8, x9
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	ldur	x8, [x29, #-8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x8, x8, x9
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	ldur	x8, [x29, #-8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
Ltmp143:
	bl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev
	str	w0, [sp, #44]                   ; 4-byte Folded Spill
Ltmp144:
	b	LBB159_8
LBB159_8:
	ldr	w5, [sp, #44]                   ; 4-byte Folded Reload
	ldr	x4, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x3, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x2, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x1, [sp, #56]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #72]
Ltmp145:
	bl	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
Ltmp146:
	b	LBB159_9
LBB159_9:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	sub	x0, x29, #64
	stur	x8, [x29, #-64]
	bl	__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev
	tbz	w0, #0, LBB159_17
	b	LBB159_10
LBB159_10:
	ldur	x8, [x29, #-8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
Ltmp147:
	mov	w1, #5                          ; =0x5
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej
Ltmp148:
	b	LBB159_11
LBB159_11:
	b	LBB159_17
LBB159_12:
Ltmp138:
	stur	x0, [x29, #-48]
	mov	x8, x1
	stur	w8, [x29, #-52]
	b	LBB159_14
LBB159_13:
Ltmp149:
	stur	x0, [x29, #-48]
	mov	x8, x1
	stur	w8, [x29, #-52]
	sub	x0, x29, #40
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	b	LBB159_14
LBB159_14:
	ldur	x0, [x29, #-48]
	bl	___cxa_begin_catch
	ldur	x8, [x29, #-8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
Ltmp150:
	bl	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp151:
	b	LBB159_15
LBB159_15:
	bl	___cxa_end_catch
	b	LBB159_16
LBB159_16:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB159_17:
	b	LBB159_18
LBB159_18:
	sub	x0, x29, #40
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	b	LBB159_16
LBB159_19:
Ltmp152:
	stur	x0, [x29, #-48]
	mov	x8, x1
	stur	w8, [x29, #-52]
Ltmp153:
	bl	___cxa_end_catch
Ltmp154:
	b	LBB159_20
LBB159_20:
	b	LBB159_21
LBB159_21:
	ldur	x0, [x29, #-48]
	bl	__Unwind_Resume
LBB159_22:
Ltmp155:
	bl	___clang_call_terminate
Lfunc_end15:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table159:
Lexception15:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase9-Lttbaseref9
Lttbaseref9:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end15-Lcst_begin15
Lcst_begin15:
	.uleb128 Ltmp136-Lfunc_begin15          ; >> Call Site 1 <<
	.uleb128 Ltmp137-Ltmp136                ;   Call between Ltmp136 and Ltmp137
	.uleb128 Ltmp138-Lfunc_begin15          ;     jumps to Ltmp138
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp139-Lfunc_begin15          ; >> Call Site 2 <<
	.uleb128 Ltmp148-Ltmp139                ;   Call between Ltmp139 and Ltmp148
	.uleb128 Ltmp149-Lfunc_begin15          ;     jumps to Ltmp149
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp148-Lfunc_begin15          ; >> Call Site 3 <<
	.uleb128 Ltmp150-Ltmp148                ;   Call between Ltmp148 and Ltmp150
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp150-Lfunc_begin15          ; >> Call Site 4 <<
	.uleb128 Ltmp151-Ltmp150                ;   Call between Ltmp150 and Ltmp151
	.uleb128 Ltmp152-Lfunc_begin15          ;     jumps to Ltmp152
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp151-Lfunc_begin15          ; >> Call Site 5 <<
	.uleb128 Ltmp153-Ltmp151                ;   Call between Ltmp151 and Ltmp153
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp153-Lfunc_begin15          ; >> Call Site 6 <<
	.uleb128 Ltmp154-Ltmp153                ;   Call between Ltmp153 and Ltmp154
	.uleb128 Ltmp155-Lfunc_begin15          ;     jumps to Ltmp155
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp154-Lfunc_begin15          ; >> Call Site 7 <<
	.uleb128 Lfunc_end15-Ltmp154            ;   Call between Ltmp154 and Lfunc_end15
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end15:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase9:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc ; -- Begin function _ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	.globl	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	.weak_definition	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	.p2align	2
__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc: ; @_ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev ; -- Begin function _ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev
	.globl	__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev
	.weak_definition	__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev
	.p2align	2
__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev: ; @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldrb	w8, [x8]
	and	w0, w8, #0x1
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ; -- Begin function _ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_definition	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	2
__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ; @_ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin16:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception16
; %bb.0:
	sub	sp, sp, #160
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	stur	x2, [x29, #-32]
	stur	x3, [x29, #-40]
	stur	x4, [x29, #-48]
	sturb	w5, [x29, #-49]
	ldur	x8, [x29, #-16]
	cbnz	x8, LBB162_2
	b	LBB162_1
LBB162_1:
	ldur	x8, [x29, #-16]
	stur	x8, [x29, #-8]
	b	LBB162_23
LBB162_2:
	ldur	x8, [x29, #-40]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	stur	x8, [x29, #-64]
	ldur	x0, [x29, #-48]
	bl	__ZNKSt3__18ios_base5widthB8ne200100Ev
	str	x0, [sp, #72]
	ldr	x8, [sp, #72]
	ldur	x9, [x29, #-64]
	subs	x8, x8, x9
	b.le	LBB162_4
	b	LBB162_3
LBB162_3:
	ldur	x9, [x29, #-64]
	ldr	x8, [sp, #72]
	subs	x8, x8, x9
	str	x8, [sp, #72]
	b	LBB162_5
LBB162_4:
	str	xzr, [sp, #72]
	b	LBB162_5
LBB162_5:
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	str	x8, [sp, #64]
	ldr	x8, [sp, #64]
	subs	x8, x8, #0
	b.le	LBB162_9
	b	LBB162_6
LBB162_6:
	ldur	x0, [x29, #-16]
	ldur	x1, [x29, #-24]
	ldr	x2, [sp, #64]
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	ldr	x8, [sp, #64]
	subs	x8, x0, x8
	b.eq	LBB162_8
	b	LBB162_7
LBB162_7:
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-16]
	ldur	x8, [x29, #-16]
	stur	x8, [x29, #-8]
	b	LBB162_23
LBB162_8:
	b	LBB162_9
LBB162_9:
	ldr	x8, [sp, #72]
	subs	x8, x8, #0
	b.le	LBB162_18
	b	LBB162_10
LBB162_10:
	ldr	x1, [sp, #72]
	ldursb	w2, [x29, #-49]
	add	x0, sp, #40
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldur	x8, [x29, #-16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x2, [sp, #72]
Ltmp157:
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp158:
	b	LBB162_11
LBB162_11:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x9, [sp, #72]
	subs	x8, x8, x9
	b.eq	LBB162_14
	b	LBB162_12
LBB162_12:
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-16]
	ldur	x8, [x29, #-16]
	stur	x8, [x29, #-8]
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #24]
	b	LBB162_15
LBB162_13:
Ltmp159:
	str	x0, [sp, #32]
	mov	x8, x1
	str	w8, [sp, #28]
	add	x0, sp, #40
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	b	LBB162_24
LBB162_14:
	str	wzr, [sp, #24]
	b	LBB162_15
LBB162_15:
	add	x0, sp, #40
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	ldr	w8, [sp, #24]
	cbz	w8, LBB162_17
	b	LBB162_16
LBB162_16:
	b	LBB162_23
LBB162_17:
	b	LBB162_18
LBB162_18:
	ldur	x8, [x29, #-40]
	ldur	x9, [x29, #-32]
	subs	x8, x8, x9
	str	x8, [sp, #64]
	ldr	x8, [sp, #64]
	subs	x8, x8, #0
	b.le	LBB162_22
	b	LBB162_19
LBB162_19:
	ldur	x0, [x29, #-16]
	ldur	x1, [x29, #-32]
	ldr	x2, [sp, #64]
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	ldr	x8, [sp, #64]
	subs	x8, x0, x8
	b.eq	LBB162_21
	b	LBB162_20
LBB162_20:
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-16]
	ldur	x8, [x29, #-16]
	stur	x8, [x29, #-8]
	b	LBB162_23
LBB162_21:
	b	LBB162_22
LBB162_22:
	ldur	x0, [x29, #-48]
	mov	x1, #0                          ; =0x0
	bl	__ZNSt3__18ios_base5widthB8ne200100El
	ldur	x8, [x29, #-16]
	stur	x8, [x29, #-8]
	b	LBB162_23
LBB162_23:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB162_24:
	ldr	x0, [sp, #32]
	bl	__Unwind_Resume
; %bb.25:
Lfunc_end16:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table162:
Lexception16:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end16-Lcst_begin16
Lcst_begin16:
	.uleb128 Lfunc_begin16-Lfunc_begin16    ; >> Call Site 1 <<
	.uleb128 Ltmp157-Lfunc_begin16          ;   Call between Lfunc_begin16 and Ltmp157
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp157-Lfunc_begin16          ; >> Call Site 2 <<
	.uleb128 Ltmp158-Ltmp157                ;   Call between Ltmp157 and Ltmp158
	.uleb128 Ltmp159-Lfunc_begin16          ;     jumps to Ltmp159
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp158-Lfunc_begin16          ; >> Call Site 3 <<
	.uleb128 Lfunc_end16-Ltmp158            ;   Call between Ltmp158 and Lfunc_end16
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end16:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE ; -- Begin function _ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE
	.globl	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE
	.weak_def_can_be_hidden	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE
	.p2align	2
__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE: ; @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__18ios_base5flagsB8ne200100Ev ; -- Begin function _ZNKSt3__18ios_base5flagsB8ne200100Ev
	.globl	__ZNKSt3__18ios_base5flagsB8ne200100Ev
	.weak_definition	__ZNKSt3__18ios_base5flagsB8ne200100Ev
	.p2align	2
__ZNKSt3__18ios_base5flagsB8ne200100Ev: ; @_ZNKSt3__18ios_base5flagsB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	w0, [x8, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev ; -- Begin function _ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev
	.globl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev
	.weak_definition	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev
	.p2align	2
__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev: ; @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #144
	bl	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev
	tbnz	w0, #0, LBB165_2
	b	LBB165_1
LBB165_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	w1, #32                         ; =0x20
	bl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	mov	x1, x0
	add	x0, x8, #144
	bl	__ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei
	b	LBB165_2
LBB165_2:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x0, x8, #144
	bl	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev
	sxtb	w0, w0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev ; -- Begin function _ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev
	.globl	__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev
	.weak_definition	__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev
	.p2align	2
__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev: ; @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x8, [x8]
	subs	x8, x8, #0
	cset	w0, eq
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej ; -- Begin function _ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej
	.globl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej
	.weak_definition	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej
	.p2align	2
__ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej: ; @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	ldr	x0, [sp, #8]
	ldr	w1, [sp, #4]
	bl	__ZNSt3__18ios_base8setstateB8ne200100Ej
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__18ios_base5widthB8ne200100Ev ; -- Begin function _ZNKSt3__18ios_base5widthB8ne200100Ev
	.globl	__ZNKSt3__18ios_base5widthB8ne200100Ev
	.weak_definition	__ZNKSt3__18ios_base5widthB8ne200100Ev
	.p2align	2
__ZNKSt3__18ios_base5widthB8ne200100Ev: ; @_ZNKSt3__18ios_base5widthB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #24]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl ; -- Begin function _ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	.globl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	.weak_definition	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	.p2align	2
__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl: ; @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #96]
	blr	x8
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	strb	w2, [sp, #15]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	ldrsb	w2, [sp, #15]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	bl	__ZNSt3__112__to_addressB8ne200100IcEEPT_S2_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__18ios_base5widthB8ne200100El ; -- Begin function _ZNSt3__18ios_base5widthB8ne200100El
	.globl	__ZNSt3__18ios_base5widthB8ne200100El
	.weak_definition	__ZNSt3__18ios_base5widthB8ne200100El
	.p2align	2
__ZNSt3__18ios_base5widthB8ne200100El:  ; @_ZNSt3__18ios_base5widthB8ne200100El
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x9, [sp, #24]
	ldr	x8, [x9, #24]
	str	x8, [sp, #8]
	ldr	x8, [sp, #16]
	str	x8, [x9, #24]
	ldr	x0, [sp, #8]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	strb	w2, [sp, #15]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__19allocatorIcEC1B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x1, [sp, #16]
	ldrsb	w2, [sp, #15]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIcEC1B8ne200100Ev ; -- Begin function _ZNSt3__19allocatorIcEC1B8ne200100Ev
	.globl	__ZNSt3__19allocatorIcEC1B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__19allocatorIcEC1B8ne200100Ev
	.p2align	2
__ZNSt3__19allocatorIcEC1B8ne200100Ev:  ; @_ZNSt3__19allocatorIcEC1B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__19allocatorIcEC2B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19allocatorIcEC2B8ne200100Ev ; -- Begin function _ZNSt3__19allocatorIcEC2B8ne200100Ev
	.globl	__ZNSt3__19allocatorIcEC2B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__19allocatorIcEC2B8ne200100Ev
	.p2align	2
__ZNSt3__19allocatorIcEC2B8ne200100Ev:  ; @_ZNSt3__19allocatorIcEC2B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev ; -- Begin function _ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev
	.globl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev
	.weak_def_can_be_hidden	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev
	.p2align	2
__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev: ; @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__to_addressB8ne200100IcEEPT_S2_ ; -- Begin function _ZNSt3__112__to_addressB8ne200100IcEEPT_S2_
	.globl	__ZNSt3__112__to_addressB8ne200100IcEEPT_S2_
	.weak_definition	__ZNSt3__112__to_addressB8ne200100IcEEPT_S2_
	.p2align	2
__ZNSt3__112__to_addressB8ne200100IcEEPT_S2_: ; @_ZNSt3__112__to_addressB8ne200100IcEEPT_S2_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	tbz	w0, #0, LBB178_2
	b	LBB178_1
LBB178_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB178_3
LBB178_2:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB178_3
LBB178_3:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldrb	w8, [x8, #23]
	lsr	w8, w8, #7
	subs	w8, w8, #0
	cset	w0, ne
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc ; -- Begin function _ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc
	.globl	__ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc
	.weak_definition	__ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc
	.p2align	2
__ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc: ; @_ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE ; -- Begin function _ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE
	.globl	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE
	.weak_def_can_be_hidden	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE
	.p2align	2
__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE: ; @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE
Lfunc_begin17:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception17
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x8, [x29, #-8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [sp, #16]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
Ltmp169:
	add	x0, x8, x9
	bl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
Ltmp170:
	b	LBB183_1
LBB183_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [x0]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB183_2:
Ltmp171:
	bl	___clang_call_terminate
Lfunc_end17:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table183:
Lexception17:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase10-Lttbaseref10
Lttbaseref10:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end17-Lcst_begin17
Lcst_begin17:
	.uleb128 Ltmp169-Lfunc_begin17          ; >> Call Site 1 <<
	.uleb128 Ltmp170-Ltmp169                ;   Call between Ltmp169 and Ltmp170
	.uleb128 Ltmp171-Lfunc_begin17          ;     jumps to Ltmp171
	.byte	1                               ;   On action: 1
Lcst_end17:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase10:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev ; -- Begin function _ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev
	.globl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev
	.weak_definition	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev
	.p2align	2
__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev: ; @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__18ios_base5rdbufB8ne200100Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__18ios_base5rdbufB8ne200100Ev ; -- Begin function _ZNKSt3__18ios_base5rdbufB8ne200100Ev
	.globl	__ZNKSt3__18ios_base5rdbufB8ne200100Ev
	.weak_definition	__ZNKSt3__18ios_base5rdbufB8ne200100Ev
	.p2align	2
__ZNKSt3__18ios_base5rdbufB8ne200100Ev: ; @_ZNKSt3__18ios_base5rdbufB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #40]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev ; -- Begin function _ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev
	.globl	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev
	.weak_definition	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev
	.p2align	2
__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev: ; @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	w8, [x8]
	str	w8, [sp, #4]                    ; 4-byte Folded Spill
	bl	__ZNSt3__111char_traitsIcE3eofB8ne200100Ev
	ldr	w8, [sp, #4]                    ; 4-byte Folded Reload
	subs	w8, w8, w0
	cset	w0, ne
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec ; -- Begin function _ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec
	.globl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec
	.weak_definition	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec
	.p2align	2
__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec: ; @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec
Lfunc_begin18:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception18
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	sturb	w1, [x29, #-9]
	ldur	x0, [x29, #-8]
	sub	x8, x29, #24
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNKSt3__18ios_base6getlocEv
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
Ltmp173:
	bl	__ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
Ltmp174:
	b	LBB187_1
LBB187_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldursb	w1, [x29, #-9]
Ltmp175:
	bl	__ZNKSt3__15ctypeIcE5widenB8ne200100Ec
	str	w0, [sp, #4]                    ; 4-byte Folded Spill
Ltmp176:
	b	LBB187_2
LBB187_2:
	sub	x0, x29, #24
	bl	__ZNSt3__16localeD1Ev
	ldr	w0, [sp, #4]                    ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB187_3:
Ltmp177:
	str	x0, [sp, #32]
	mov	x8, x1
	str	w8, [sp, #28]
	sub	x0, x29, #24
	bl	__ZNSt3__16localeD1Ev
	b	LBB187_4
LBB187_4:
	ldr	x0, [sp, #32]
	bl	__Unwind_Resume
Lfunc_end18:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table187:
Lexception18:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end18-Lcst_begin18
Lcst_begin18:
	.uleb128 Lfunc_begin18-Lfunc_begin18    ; >> Call Site 1 <<
	.uleb128 Ltmp173-Lfunc_begin18          ;   Call between Lfunc_begin18 and Ltmp173
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp173-Lfunc_begin18          ; >> Call Site 2 <<
	.uleb128 Ltmp176-Ltmp173                ;   Call between Ltmp173 and Ltmp176
	.uleb128 Ltmp177-Lfunc_begin18          ;     jumps to Ltmp177
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp176-Lfunc_begin18          ; >> Call Site 3 <<
	.uleb128 Lfunc_end18-Ltmp176            ;   Call between Ltmp176 and Lfunc_end18
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end18:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei ; -- Begin function _ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei
	.globl	__ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei
	.weak_definition	__ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei
	.p2align	2
__ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei: ; @_ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	ldr	x0, [sp, #8]
	ldr	w8, [sp, #4]
	str	w8, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev ; -- Begin function _ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev
	.globl	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev
	.weak_definition	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev
	.p2align	2
__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev: ; @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	w0, [x8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__111char_traitsIcE3eofB8ne200100Ev ; -- Begin function _ZNSt3__111char_traitsIcE3eofB8ne200100Ev
	.globl	__ZNSt3__111char_traitsIcE3eofB8ne200100Ev
	.weak_definition	__ZNSt3__111char_traitsIcE3eofB8ne200100Ev
	.p2align	2
__ZNSt3__111char_traitsIcE3eofB8ne200100Ev: ; @_ZNSt3__111char_traitsIcE3eofB8ne200100Ev
	.cfi_startproc
; %bb.0:
	mov	w0, #-1                         ; =0xffffffff
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE ; -- Begin function _ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE
	.globl	__ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE
	.weak_definition	__ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE
	.p2align	2
__ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE: ; @_ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	adrp	x1, __ZNSt3__15ctypeIcE2idE@GOTPAGE
	ldr	x1, [x1, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__15ctypeIcE5widenB8ne200100Ec ; -- Begin function _ZNKSt3__15ctypeIcE5widenB8ne200100Ec
	.globl	__ZNKSt3__15ctypeIcE5widenB8ne200100Ec
	.weak_definition	__ZNKSt3__15ctypeIcE5widenB8ne200100Ec
	.p2align	2
__ZNKSt3__15ctypeIcE5widenB8ne200100Ec: ; @_ZNKSt3__15ctypeIcE5widenB8ne200100Ec
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	strb	w1, [sp, #7]
	ldr	x0, [sp, #8]
	ldrsb	w1, [sp, #7]
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
	blr	x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__18ios_base8setstateB8ne200100Ej ; -- Begin function _ZNSt3__18ios_base8setstateB8ne200100Ej
	.globl	__ZNSt3__18ios_base8setstateB8ne200100Ej
	.weak_definition	__ZNSt3__18ios_base8setstateB8ne200100Ej
	.p2align	2
__ZNSt3__18ios_base8setstateB8ne200100Ej: ; @_ZNSt3__18ios_base8setstateB8ne200100Ej
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	ldr	x0, [sp, #8]
	ldr	w8, [x0, #32]
	ldr	w9, [sp, #4]
	orr	w1, w8, w9
	bl	__ZNSt3__18ios_base5clearEj
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_ ; -- Begin function _ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_
	.globl	__ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_
	.weak_definition	__ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_
	.p2align	2
__ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_: ; @_ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	_strlen
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_event_finder13cached_createINS_15sc_signal_in_ifIbEEEERS0_RPS0_RKNS_12sc_port_baseEMT_KFRKNS_8sc_eventEvE ; -- Begin function _ZN7sc_core15sc_event_finder13cached_createINS_15sc_signal_in_ifIbEEEERS0_RPS0_RKNS_12sc_port_baseEMT_KFRKNS_8sc_eventEvE
	.weak_definition	__ZN7sc_core15sc_event_finder13cached_createINS_15sc_signal_in_ifIbEEEERS0_RPS0_RKNS_12sc_port_baseEMT_KFRKNS_8sc_eventEvE
	.p2align	2
__ZN7sc_core15sc_event_finder13cached_createINS_15sc_signal_in_ifIbEEEERS0_RPS0_RKNS_12sc_port_baseEMT_KFRKNS_8sc_eventEvE: ; @_ZN7sc_core15sc_event_finder13cached_createINS_15sc_signal_in_ifIbEEEERS0_RPS0_RKNS_12sc_port_baseEMT_KFRKNS_8sc_eventEvE
Lfunc_begin19:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception19
; %bb.0:
	sub	sp, sp, #112
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x2, [x29, #-16]
	stur	x3, [x29, #-8]
	ldur	x9, [x29, #-16]
	ldur	x8, [x29, #-8]
	stur	x0, [x29, #-24]
	stur	x1, [x29, #-32]
	str	x9, [sp, #48]
	str	x8, [sp, #56]
	ldur	x8, [x29, #-24]
	ldr	x8, [x8]
	cbnz	x8, LBB195_4
	b	LBB195_1
LBB195_1:
	mov	x0, #32                         ; =0x20
	bl	__Znwm
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x1, [x29, #-32]
	ldr	x9, [sp, #48]
	ldr	x8, [sp, #56]
	str	x9, [sp, #32]
	str	x8, [sp, #40]
	ldr	x2, [sp, #32]
	ldr	x3, [sp, #40]
Ltmp180:
	bl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
Ltmp181:
	b	LBB195_2
LBB195_2:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldur	x9, [x29, #-24]
	str	x8, [x9]
	b	LBB195_4
LBB195_3:
Ltmp182:
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	str	x8, [sp, #24]
	mov	x8, x1
	str	w8, [sp, #20]
	mov	x1, #32                         ; =0x20
	bl	__ZdlPvm
	b	LBB195_8
LBB195_4:
	ldur	x8, [x29, #-32]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldur	x8, [x29, #-24]
	ldr	x0, [x8]
	bl	__ZNK7sc_core15sc_event_finder4portEv
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	subs	x8, x8, x0
	b.ne	LBB195_6
	b	LBB195_5
LBB195_5:
	b	LBB195_7
LBB195_6:
	adrp	x0, l_.str.14@PAGE
	add	x0, x0, l_.str.14@PAGEOFF
	adrp	x1, l_.str.15@PAGE
	add	x1, x1, l_.str.15@PAGEOFF
	mov	w2, #139                        ; =0x8b
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB195_7:
	ldur	x8, [x29, #-24]
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB195_8:
	ldr	x0, [sp, #24]
	bl	__Unwind_Resume
Lfunc_end19:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table195:
Lexception19:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end19-Lcst_begin19
Lcst_begin19:
	.uleb128 Lfunc_begin19-Lfunc_begin19    ; >> Call Site 1 <<
	.uleb128 Ltmp180-Lfunc_begin19          ;   Call between Lfunc_begin19 and Ltmp180
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp180-Lfunc_begin19          ; >> Call Site 2 <<
	.uleb128 Ltmp181-Ltmp180                ;   Call between Ltmp180 and Ltmp181
	.uleb128 Ltmp182-Lfunc_begin19          ;     jumps to Ltmp182
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp181-Lfunc_begin19          ; >> Call Site 3 <<
	.uleb128 Lfunc_end19-Ltmp181            ;   Call between Ltmp181 and Lfunc_end19
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end19:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE ; -- Begin function _ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
	.weak_def_can_be_hidden	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
	.p2align	2
__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE: ; @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x2, [x29, #-16]
	stur	x3, [x29, #-8]
	ldur	x9, [x29, #-16]
	ldur	x8, [x29, #-8]
	stur	x0, [x29, #-24]
	stur	x1, [x29, #-32]
	str	x9, [sp, #32]
	str	x8, [sp, #40]
	ldur	x0, [x29, #-24]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x1, [x29, #-32]
	ldr	x9, [sp, #32]
	ldr	x8, [sp, #40]
	str	x9, [sp, #16]
	str	x8, [sp, #24]
	ldr	x2, [sp, #16]
	ldr	x3, [sp, #24]
	bl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core15sc_event_finder4portEv ; -- Begin function _ZNK7sc_core15sc_event_finder4portEv
	.weak_definition	__ZNK7sc_core15sc_event_finder4portEv
	.p2align	2
__ZNK7sc_core15sc_event_finder4portEv:  ; @_ZNK7sc_core15sc_event_finder4portEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE ; -- Begin function _ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
	.weak_def_can_be_hidden	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
	.p2align	2
__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE: ; @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x2, [x29, #-16]
	stur	x3, [x29, #-8]
	ldur	x9, [x29, #-16]
	ldur	x8, [x29, #-8]
	stur	x0, [x29, #-24]
	str	x1, [sp, #32]
	str	x9, [sp, #16]
	str	x8, [sp, #24]
	ldur	x0, [x29, #-24]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #32]
	bl	__ZN7sc_core15sc_event_finderC2ERKNS_12sc_port_baseE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x8, __ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldr	x9, [sp, #16]
	ldr	x8, [sp, #24]
	str	x9, [x0, #16]
	str	x8, [x0, #24]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev ; -- Begin function _ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	.p2align	2
__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev: ; @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev ; -- Begin function _ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev
	.p2align	2
__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev: ; @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x1, #32                         ; =0x20
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE ; -- Begin function _ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE
	.weak_def_can_be_hidden	__ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE
	.p2align	2
__ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE: ; @_ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	ldur	x8, [x29, #-16]
	stur	x8, [x29, #-40]                 ; 8-byte Folded Spill
	ldur	x8, [x29, #-24]
	cbz	x8, LBB201_5
	b	LBB201_1
LBB201_1:
	ldur	x8, [x29, #-24]
	stur	x8, [x29, #-48]                 ; 8-byte Folded Spill
	cbz	x8, LBB201_3
	b	LBB201_2
LBB201_2:
	ldur	x0, [x29, #-48]                 ; 8-byte Folded Reload
	adrp	x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x2, __ZTIN7sc_core15sc_signal_in_ifIbEE@PAGE
	add	x2, x2, __ZTIN7sc_core15sc_signal_in_ifIbEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	str	x0, [sp, #56]                   ; 8-byte Folded Spill
	b	LBB201_4
LBB201_3:
	mov	x8, #0                          ; =0x0
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	b	LBB201_4
LBB201_4:
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	b	LBB201_9
LBB201_5:
	ldur	x0, [x29, #-40]                 ; 8-byte Folded Reload
	bl	__ZNK7sc_core15sc_event_finder4portEv
	ldr	x8, [x0]
	ldr	x8, [x8, #80]
	blr	x8
	str	x0, [sp, #40]                   ; 8-byte Folded Spill
	cbz	x0, LBB201_7
	b	LBB201_6
LBB201_6:
	ldr	x0, [sp, #40]                   ; 8-byte Folded Reload
	adrp	x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x1, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x2, __ZTIN7sc_core15sc_signal_in_ifIbEE@PAGE
	add	x2, x2, __ZTIN7sc_core15sc_signal_in_ifIbEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	b	LBB201_8
LBB201_7:
	mov	x8, #0                          ; =0x0
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	b	LBB201_8
LBB201_8:
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	b	LBB201_9
LBB201_9:
	ldr	x8, [sp, #48]                   ; 8-byte Folded Reload
	stur	x8, [x29, #-32]
	ldur	x8, [x29, #-32]
	cbnz	x8, LBB201_11
	b	LBB201_10
LBB201_10:
	ldur	x0, [x29, #-40]                 ; 8-byte Folded Reload
	adrp	x1, __ZN7sc_core17SC_ID_FIND_EVENT_E@GOTPAGE
	ldr	x1, [x1, __ZN7sc_core17SC_ID_FIND_EVENT_E@GOTPAGEOFF]
	adrp	x2, l_.str.11@PAGE
	add	x2, x2, l_.str.11@PAGEOFF
	bl	__ZNK7sc_core15sc_event_finder12report_errorEPKcS2_
	bl	__ZN7sc_core8sc_event4noneEv
	stur	x0, [x29, #-8]
	b	LBB201_15
LBB201_11:
	ldur	x8, [x29, #-40]                 ; 8-byte Folded Reload
	ldur	x9, [x29, #-32]
	ldr	x10, [x8, #16]
	str	x10, [sp, #16]                  ; 8-byte Folded Spill
	ldr	x8, [x8, #24]
	add	x9, x9, x8, asr #1
	str	x9, [sp, #24]                   ; 8-byte Folded Spill
                                        ; kill: def $w8 killed $w8 killed $x8
	tbz	w8, #0, LBB201_13
	b	LBB201_12
LBB201_12:
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8]
	ldr	x8, [x8, w9, uxtw]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB201_14
LBB201_13:
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB201_14
LBB201_14:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	blr	x8
	stur	x0, [x29, #-8]
	b	LBB201_15
LBB201_15:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev ; -- Begin function _ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev
	.p2align	2
__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev: ; @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core15sc_event_finderD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_event4noneEv    ; -- Begin function _ZN7sc_core8sc_event4noneEv
	.weak_definition	__ZN7sc_core8sc_event4noneEv
	.p2align	2
__ZN7sc_core8sc_event4noneEv:           ; @_ZN7sc_core8sc_event4noneEv
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZN7sc_core22sc_get_curr_simcontextEv
	bl	__ZN7sc_core13sc_simcontext10null_eventEv
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core22sc_get_curr_simcontextEv ; -- Begin function _ZN7sc_core22sc_get_curr_simcontextEv
	.weak_definition	__ZN7sc_core22sc_get_curr_simcontextEv
	.p2align	2
__ZN7sc_core22sc_get_curr_simcontextEv: ; @_ZN7sc_core22sc_get_curr_simcontextEv
Lfunc_begin20:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception20
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, __ZN7sc_core18sc_curr_simcontextE@GOTPAGE
	ldr	x8, [x8, __ZN7sc_core18sc_curr_simcontextE@GOTPAGEOFF]
	ldr	x8, [x8]
	cbnz	x8, LBB204_4
	b	LBB204_1
LBB204_1:
	mov	x0, #456                        ; =0x1c8
	bl	__Znwm
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
Ltmp184:
	bl	__ZN7sc_core13sc_simcontextC1Ev
Ltmp185:
	b	LBB204_2
LBB204_2:
	ldr	x9, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x8, __ZN7sc_core25sc_default_global_contextE@GOTPAGE
	ldr	x8, [x8, __ZN7sc_core25sc_default_global_contextE@GOTPAGEOFF]
	str	x9, [x8]
	ldr	x8, [x8]
	adrp	x9, __ZN7sc_core18sc_curr_simcontextE@GOTPAGE
	ldr	x9, [x9, __ZN7sc_core18sc_curr_simcontextE@GOTPAGEOFF]
	str	x8, [x9]
	b	LBB204_4
LBB204_3:
Ltmp186:
	mov	x8, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	stur	x8, [x29, #-8]
	mov	x8, x1
	stur	w8, [x29, #-12]
	mov	x1, #456                        ; =0x1c8
	bl	__ZdlPvm
	b	LBB204_5
LBB204_4:
	adrp	x8, __ZN7sc_core18sc_curr_simcontextE@GOTPAGE
	ldr	x8, [x8, __ZN7sc_core18sc_curr_simcontextE@GOTPAGEOFF]
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB204_5:
	ldur	x0, [x29, #-8]
	bl	__Unwind_Resume
Lfunc_end20:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table204:
Lexception20:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end20-Lcst_begin20
Lcst_begin20:
	.uleb128 Lfunc_begin20-Lfunc_begin20    ; >> Call Site 1 <<
	.uleb128 Ltmp184-Lfunc_begin20          ;   Call between Lfunc_begin20 and Ltmp184
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp184-Lfunc_begin20          ; >> Call Site 2 <<
	.uleb128 Ltmp185-Ltmp184                ;   Call between Ltmp184 and Ltmp185
	.uleb128 Ltmp186-Lfunc_begin20          ;     jumps to Ltmp186
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp185-Lfunc_begin20          ; >> Call Site 3 <<
	.uleb128 Lfunc_end20-Ltmp185            ;   Call between Ltmp185 and Lfunc_end20
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end20:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core6sc_outIiED2Ev      ; -- Begin function _ZN7sc_core6sc_outIiED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core6sc_outIiED2Ev
	.p2align	2
__ZN7sc_core6sc_outIiED2Ev:             ; @_ZN7sc_core6sc_outIiED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core8sc_inoutIiED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core5sc_inIbED2Ev       ; -- Begin function _ZN7sc_core5sc_inIbED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core5sc_inIbED2Ev
	.p2align	2
__ZN7sc_core5sc_inIbED2Ev:              ; @_ZN7sc_core5sc_inIbED2Ev
Lfunc_begin21:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception21
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	ldur	x0, [x29, #-16]
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	mov	x8, x0
	stur	x8, [x29, #-8]
	adrp	x8, __ZTVN7sc_core5sc_inIbEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core5sc_inIbEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
Ltmp187:
	bl	__ZNK7sc_core5sc_inIbE13remove_tracesEv
Ltmp188:
	b	LBB206_1
LBB206_1:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8, #104]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	cbz	x8, LBB206_3
	b	LBB206_2
LBB206_2:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	b	LBB206_3
LBB206_3:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8, #112]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	cbz	x8, LBB206_5
	b	LBB206_4
LBB206_4:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	b	LBB206_5
LBB206_5:
	ldr	x8, [sp, #24]                   ; 8-byte Folded Reload
	ldr	x8, [x8, #120]
	str	x8, [sp]                        ; 8-byte Folded Spill
	cbz	x8, LBB206_7
	b	LBB206_6
LBB206_6:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	b	LBB206_7
LBB206_7:
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	bl	__ZN7sc_core7sc_portINS_15sc_signal_in_ifIbEELi1ELNS_14sc_port_policyE0EED2Ev
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB206_8:
Ltmp189:
	bl	___clang_call_terminate
Lfunc_end21:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table206:
Lexception21:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase11-Lttbaseref11
Lttbaseref11:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end21-Lcst_begin21
Lcst_begin21:
	.uleb128 Ltmp187-Lfunc_begin21          ; >> Call Site 1 <<
	.uleb128 Ltmp188-Ltmp187                ;   Call between Ltmp187 and Ltmp188
	.uleb128 Ltmp189-Lfunc_begin21          ;     jumps to Ltmp189
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp188-Lfunc_begin21          ; >> Call Site 2 <<
	.uleb128 Lfunc_end21-Ltmp188            ;   Call between Ltmp188 and Lfunc_end21
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end21:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase11:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN14simple_counterD2Ev        ; -- Begin function _ZN14simple_counterD2Ev
	.weak_def_can_be_hidden	__ZN14simple_counterD2Ev
	.p2align	2
__ZN14simple_counterD2Ev:               ; @_ZN14simple_counterD2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	adrp	x9, __ZTV14simple_counter@GOTPAGE
	ldr	x9, [x9, __ZTV14simple_counter@GOTPAGEOFF]
	add	x10, x9, #16
	str	x10, [x8]
	add	x9, x9, #168
	str	x9, [x8, #112]
	add	x0, x8, #488
	bl	__ZN7sc_core6sc_outIiED1Ev
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x0, x8, #360
	bl	__ZN7sc_core5sc_inIbED1Ev
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x0, x8, #232
	bl	__ZN7sc_core5sc_inIbED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZN7sc_core9sc_moduleD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv ; -- Begin function _ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv
	.weak_def_can_be_hidden	__ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv
	.p2align	2
__ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv: ; @_ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	mov	x0, #0                          ; =0x0
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_inout_ifIbED1Ev ; -- Begin function _ZN7sc_core18sc_signal_inout_ifIbED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_inout_ifIbED1Ev
	.p2align	2
__ZN7sc_core18sc_signal_inout_ifIbED1Ev: ; @_ZN7sc_core18sc_signal_inout_ifIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_inout_ifIbED0Ev ; -- Begin function _ZN7sc_core18sc_signal_inout_ifIbED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_inout_ifIbED0Ev
	.p2align	2
__ZN7sc_core18sc_signal_inout_ifIbED0Ev: ; @_ZN7sc_core18sc_signal_inout_ifIbED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core18sc_signal_inout_ifIbED1Ev ; -- Begin function _ZThn8_N7sc_core18sc_signal_inout_ifIbED1Ev
	.weak_def_can_be_hidden	__ZThn8_N7sc_core18sc_signal_inout_ifIbED1Ev
	.p2align	2
__ZThn8_N7sc_core18sc_signal_inout_ifIbED1Ev: ; @_ZThn8_N7sc_core18sc_signal_inout_ifIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_inout_ifIbED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core18sc_signal_inout_ifIbED0Ev ; -- Begin function _ZThn8_N7sc_core18sc_signal_inout_ifIbED0Ev
	.weak_def_can_be_hidden	__ZThn8_N7sc_core18sc_signal_inout_ifIbED0Ev
	.p2align	2
__ZThn8_N7sc_core18sc_signal_inout_ifIbED0Ev: ; @_ZThn8_N7sc_core18sc_signal_inout_ifIbED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_inout_ifIbED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv ; -- Begin function _ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv
	.weak_def_can_be_hidden	__ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv
	.p2align	2
__ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv: ; @_ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	mov	w0, #0                          ; =0x0
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_signal_in_ifIbED1Ev ; -- Begin function _ZN7sc_core15sc_signal_in_ifIbED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_signal_in_ifIbED1Ev
	.p2align	2
__ZN7sc_core15sc_signal_in_ifIbED1Ev:   ; @_ZN7sc_core15sc_signal_in_ifIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_signal_in_ifIbED0Ev ; -- Begin function _ZN7sc_core15sc_signal_in_ifIbED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_signal_in_ifIbED0Ev
	.p2align	2
__ZN7sc_core15sc_signal_in_ifIbED0Ev:   ; @_ZN7sc_core15sc_signal_in_ifIbED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_write_ifIbED1Ev ; -- Begin function _ZN7sc_core18sc_signal_write_ifIbED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_write_ifIbED1Ev
	.p2align	2
__ZN7sc_core18sc_signal_write_ifIbED1Ev: ; @_ZN7sc_core18sc_signal_write_ifIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_write_ifIbED0Ev ; -- Begin function _ZN7sc_core18sc_signal_write_ifIbED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_write_ifIbED0Ev
	.p2align	2
__ZN7sc_core18sc_signal_write_ifIbED0Ev: ; @_ZN7sc_core18sc_signal_write_ifIbED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core18sc_signal_write_ifIbED1Ev ; -- Begin function _ZTv0_n40_N7sc_core18sc_signal_write_ifIbED1Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core18sc_signal_write_ifIbED1Ev
	.p2align	2
__ZTv0_n40_N7sc_core18sc_signal_write_ifIbED1Ev: ; @_ZTv0_n40_N7sc_core18sc_signal_write_ifIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	mov	x9, x8
	str	x9, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_write_ifIbED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core18sc_signal_write_ifIbED0Ev ; -- Begin function _ZTv0_n40_N7sc_core18sc_signal_write_ifIbED0Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core18sc_signal_write_ifIbED0Ev
	.p2align	2
__ZTv0_n40_N7sc_core18sc_signal_write_ifIbED0Ev: ; @_ZTv0_n40_N7sc_core18sc_signal_write_ifIbED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_write_ifIbED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7posedgeEv ; -- Begin function _ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7posedgeEv
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7posedgeEv
	.p2align	2
__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7posedgeEv: ; @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7posedgeEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [x0]
	ldr	x8, [x8, #72]
	blr	x8
	mov	w8, #0                          ; =0x0
	stur	w8, [x29, #-12]                 ; 4-byte Folded Spill
	tbz	w0, #0, LBB220_2
	b	LBB220_1
LBB220_1:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldrb	w8, [x8, #128]
	stur	w8, [x29, #-12]                 ; 4-byte Folded Spill
	b	LBB220_2
LBB220_2:
	ldur	w8, [x29, #-12]                 ; 4-byte Folded Reload
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7negedgeEv ; -- Begin function _ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7negedgeEv
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7negedgeEv
	.p2align	2
__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7negedgeEv: ; @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7negedgeEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [x0]
	ldr	x8, [x8, #72]
	blr	x8
	mov	w8, #0                          ; =0x0
	stur	w8, [x29, #-12]                 ; 4-byte Folded Spill
	tbz	w0, #0, LBB221_2
	b	LBB221_1
LBB221_1:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldrb	w8, [x8, #128]
	eor	w8, w8, #0x1
	stur	w8, [x29, #-12]                 ; 4-byte Folded Spill
	b	LBB221_2
LBB221_2:
	ldur	w8, [x29, #-12]                 ; 4-byte Folded Reload
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_clockEv ; -- Begin function _ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_clockEv
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_clockEv
	.p2align	2
__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_clockEv: ; @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_clockEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	mov	w8, #0                          ; =0x0
	and	w0, w8, #0x1
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED1Ev ; -- Begin function _ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED1Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED1Ev
	.p2align	2
__ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED1Ev: ; @_ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	mov	x9, x8
	str	x9, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_inout_ifIbED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED0Ev ; -- Begin function _ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED0Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED0Ev
	.p2align	2
__ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED0Ev: ; @_ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_inout_ifIbED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core15sc_signal_in_ifIbED1Ev ; -- Begin function _ZTv0_n40_N7sc_core15sc_signal_in_ifIbED1Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core15sc_signal_in_ifIbED1Ev
	.p2align	2
__ZTv0_n40_N7sc_core15sc_signal_in_ifIbED1Ev: ; @_ZTv0_n40_N7sc_core15sc_signal_in_ifIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	mov	x9, x8
	str	x9, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core15sc_signal_in_ifIbED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core15sc_signal_in_ifIbED0Ev ; -- Begin function _ZTv0_n40_N7sc_core15sc_signal_in_ifIbED0Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core15sc_signal_in_ifIbED0Ev
	.p2align	2
__ZTv0_n40_N7sc_core15sc_signal_in_ifIbED0Ev: ; @_ZTv0_n40_N7sc_core15sc_signal_in_ifIbED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core15sc_signal_in_ifIbED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi
Lfunc_begin22:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception22
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	str	x3, [sp, #32]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x8, [x29, #-16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x1, x8, #8
	bl	__ZN7sc_core18sc_signal_inout_ifIiEC2Ev
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldur	x1, [x29, #-24]
Ltmp207:
	add	x0, x8, #16
	bl	__ZN7sc_core17sc_signal_channelC2EPKc
Ltmp208:
	b	LBB227_1
LBB227_1:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	add	x0, x8, #104
Ltmp210:
	bl	__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev
Ltmp211:
	b	LBB227_2
LBB227_2:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	x9, [x8]
	str	x9, [x0]
	ldr	x9, [x8, #64]
	ldr	x10, [x0]
	ldur	x10, [x10, #-48]
	str	x9, [x0, x10]
	ldr	x8, [x8, #72]
	str	x8, [x0, #8]
	adrp	x8, __ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	add	x8, x8, #280
	str	x8, [x0, #16]
	ldr	x8, [sp, #32]
	ldr	w8, [x8]
	str	w8, [x0, #128]
	ldr	x8, [sp, #32]
	ldr	w8, [x8]
	str	w8, [x0, #132]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB227_3:
Ltmp209:
	str	x0, [sp, #24]
	mov	x8, x1
	str	w8, [sp, #20]
	b	LBB227_5
LBB227_4:
Ltmp212:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	str	x0, [sp, #24]
	mov	x9, x1
	str	w9, [sp, #20]
	add	x0, x8, #16
	bl	__ZN7sc_core17sc_signal_channelD2Ev
	b	LBB227_5
LBB227_5:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x1, x8, #8
	bl	__ZN7sc_core18sc_signal_inout_ifIiED2Ev
	b	LBB227_6
LBB227_6:
	ldr	x0, [sp, #24]
	bl	__Unwind_Resume
Lfunc_end22:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table227:
Lexception22:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end22-Lcst_begin22
Lcst_begin22:
	.uleb128 Lfunc_begin22-Lfunc_begin22    ; >> Call Site 1 <<
	.uleb128 Ltmp207-Lfunc_begin22          ;   Call between Lfunc_begin22 and Ltmp207
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp207-Lfunc_begin22          ; >> Call Site 2 <<
	.uleb128 Ltmp208-Ltmp207                ;   Call between Ltmp207 and Ltmp208
	.uleb128 Ltmp209-Lfunc_begin22          ;     jumps to Ltmp209
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp210-Lfunc_begin22          ; >> Call Site 3 <<
	.uleb128 Ltmp211-Ltmp210                ;   Call between Ltmp210 and Ltmp211
	.uleb128 Ltmp212-Lfunc_begin22          ;     jumps to Ltmp212
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp211-Lfunc_begin22          ; >> Call Site 4 <<
	.uleb128 Lfunc_end22-Ltmp211            ;   Call between Ltmp211 and Lfunc_end22
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end22:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	stur	x2, [x29, #-24]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x1, [x29, #-24]
	add	x0, sp, #24
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
	adrp	x0, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGE
	add	x0, x0, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGEOFF
	bl	__ZNKSt9type_info4nameB8ne200100Ev
	mov	x1, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
	mov	x8, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	ldr	w0, [sp, #12]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #16]                   ; 8-byte Folded Reload
	sturb	w0, [x29, #-25]
	ldur	x2, [x29, #-16]
	ldurb	w8, [x29, #-25]
	mov	x10, x9
	add	x0, x10, #104
	add	x1, x9, #16
	and	w3, w8, #0x1
	bl	__ZN7sc_core27sc_writer_policy_check_port10check_portEPNS_9sc_objectEPNS_12sc_port_baseEb
	tbnz	w0, #0, LBB228_2
	b	LBB228_1
LBB228_1:
	b	LBB228_2
LBB228_2:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	ldr	x8, [x0]
	ldr	x8, [x8, #32]
	blr	x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	adrp	x1, __ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x1, [x1, __ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZN7sc_core12sc_interfaceD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x1, #136                        ; =0x88
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #16
	bl	__ZNK7sc_core17sc_signal_channel19value_changed_eventEv
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #128
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #16
	bl	__ZNK7sc_core17sc_signal_channel23deprecated_get_data_refEv
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x0, x8, #128
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #16
	bl	__ZNK7sc_core17sc_signal_channel5eventEv
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	adrp	x0, l_.str.18@PAGE
	add	x0, x0, l_.str.18@PAGEOFF
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	mov	w0, #0                          ; =0x0
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x9, [x29, #-8]
	str	x9, [sp]                        ; 8-byte Folded Spill
	ldr	w8, [x9, #132]
	ldr	x10, [sp, #16]
	ldr	w10, [x10]
	subs	w8, w8, w10
	cset	w8, ne
	strb	w8, [sp, #15]
	ldrb	w8, [sp, #15]
	add	x0, x9, #112
	add	x1, x9, #16
	and	w2, w8, #0x1
	bl	__ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb
	tbnz	w0, #0, LBB238_2
	b	LBB238_1
LBB238_1:
	b	LBB238_5
LBB238_2:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	str	w8, [x9, #132]
	ldrb	w8, [sp, #15]
	tbnz	w8, #0, LBB238_4
	b	LBB238_3
LBB238_3:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x0, x8, #112
	bl	__ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv
	tbz	w0, #0, LBB238_5
	b	LBB238_4
LBB238_4:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x0, x8, #16
	bl	__ZN7sc_core15sc_prim_channel14request_updateEv
	b	LBB238_5
LBB238_5:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	add	x0, x8, #16
	bl	__ZNK7sc_core17sc_signal_channel16deprecated_traceEv
	ldr	x8, [sp]
	cbz	x8, LBB239_2
	b	LBB239_1
LBB239_1:
	b	LBB239_2
LBB239_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x0, [sp]
	ldr	w1, [x8, #128]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE ; -- Begin function _ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.p2align	2
__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE: ; @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x0, [x29, #-16]
	adrp	x1, l_.str.21@PAGE
	add	x1, x1, l_.str.21@PAGEOFF
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	add	x0, x8, #16
	bl	__ZNK7sc_core9sc_object4nameEv
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	adrp	x1, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGE
	add	x1, x1, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGEOFF
	str	x1, [sp, #24]                   ; 8-byte Folded Spill
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	ldur	x0, [x29, #-16]
	adrp	x1, l_.str.22@PAGE
	add	x1, x1, l_.str.22@PAGEOFF
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	w1, [x8, #128]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	ldr	x1, [sp, #24]                   ; 8-byte Folded Reload
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	ldur	x0, [x29, #-16]
	adrp	x1, l_.str.23@PAGE
	add	x1, x1, l_.str.23@PAGEOFF
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	w1, [x8, #132]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	ldr	x1, [sp, #24]                   ; 8-byte Folded Reload
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #112
	bl	__ZN7sc_core28sc_writer_policy_check_write6updateEv
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	w8, [x9, #132]
	ldr	w9, [x9, #128]
	subs	w8, w8, w9
	b.eq	LBB242_2
	b	LBB242_1
LBB242_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv
	b	LBB242_2
LBB242_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi ; -- Begin function _ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.weak_def_can_be_hidden	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.p2align	2
__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi: ; @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x1, [sp]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv ; -- Begin function _ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.weak_def_can_be_hidden	__ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.p2align	2
__ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv: ; @_ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_inout_ifIiED1Ev ; -- Begin function _ZN7sc_core18sc_signal_inout_ifIiED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_inout_ifIiED1Ev
	.p2align	2
__ZN7sc_core18sc_signal_inout_ifIiED1Ev: ; @_ZN7sc_core18sc_signal_inout_ifIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_inout_ifIiED0Ev ; -- Begin function _ZN7sc_core18sc_signal_inout_ifIiED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_inout_ifIiED0Ev
	.p2align	2
__ZN7sc_core18sc_signal_inout_ifIiED0Ev: ; @_ZN7sc_core18sc_signal_inout_ifIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev ; -- Begin function _ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev
	.weak_def_can_be_hidden	__ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev
	.p2align	2
__ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev: ; @_ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_inout_ifIiED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev ; -- Begin function _ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev
	.weak_def_can_be_hidden	__ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev
	.p2align	2
__ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev: ; @_ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_inout_ifIiED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv ; -- Begin function _ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv
	.weak_def_can_be_hidden	__ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv
	.p2align	2
__ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv: ; @_ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	mov	w0, #0                          ; =0x0
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_signal_in_ifIiED1Ev ; -- Begin function _ZN7sc_core15sc_signal_in_ifIiED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_signal_in_ifIiED1Ev
	.p2align	2
__ZN7sc_core15sc_signal_in_ifIiED1Ev:   ; @_ZN7sc_core15sc_signal_in_ifIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_signal_in_ifIiED0Ev ; -- Begin function _ZN7sc_core15sc_signal_in_ifIiED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_signal_in_ifIiED0Ev
	.p2align	2
__ZN7sc_core15sc_signal_in_ifIiED0Ev:   ; @_ZN7sc_core15sc_signal_in_ifIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_write_ifIiED1Ev ; -- Begin function _ZN7sc_core18sc_signal_write_ifIiED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_write_ifIiED1Ev
	.p2align	2
__ZN7sc_core18sc_signal_write_ifIiED1Ev: ; @_ZN7sc_core18sc_signal_write_ifIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_write_ifIiED0Ev ; -- Begin function _ZN7sc_core18sc_signal_write_ifIiED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_write_ifIiED0Ev
	.p2align	2
__ZN7sc_core18sc_signal_write_ifIiED0Ev: ; @_ZN7sc_core18sc_signal_write_ifIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	brk	#0x1
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev ; -- Begin function _ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev
	.p2align	2
__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev: ; @_ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	mov	x9, x8
	str	x9, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_write_ifIiED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev ; -- Begin function _ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev
	.p2align	2
__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev: ; @_ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_write_ifIiED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	mov	x1, #136                        ; =0x88
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	add	sp, sp, #16
	b	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE ; -- Begin function _ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.p2align	2
__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE: ; @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x1, [sp]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE ; -- Begin function _ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.p2align	2
__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE: ; @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x1, [sp]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE ; -- Begin function _ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.weak_def_can_be_hidden	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.p2align	2
__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE: ; @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x1, [sp]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv ; -- Begin function _ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.weak_def_can_be_hidden	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.p2align	2
__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv: ; @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv ; -- Begin function _ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.weak_def_can_be_hidden	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.p2align	2
__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv: ; @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_inout_ifIiEC2Ev ; -- Begin function _ZN7sc_core18sc_signal_inout_ifIiEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_inout_ifIiEC2Ev
	.p2align	2
__ZN7sc_core18sc_signal_inout_ifIiEC2Ev: ; @_ZN7sc_core18sc_signal_inout_ifIiEC2Ev
Lfunc_begin23:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception23
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	x0, [x29, #-8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	ldur	x8, [x29, #-16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	add	x1, x8, #8
	bl	__ZN7sc_core15sc_signal_in_ifIiEC2Ev
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
Ltmp240:
	add	x0, x9, #8
	add	x1, x8, #24
	bl	__ZN7sc_core18sc_signal_write_ifIiEC2Ev
Ltmp241:
	b	LBB268_1
LBB268_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x9, [x8]
	str	x9, [x0]
	ldr	x9, [x8, #40]
	ldr	x10, [x0]
	ldur	x10, [x10, #-48]
	str	x9, [x0, x10]
	ldr	x8, [x8, #48]
	str	x8, [x0, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB268_2:
Ltmp242:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	mov	x9, x0
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	str	x9, [sp, #24]
	mov	x9, x1
	str	w9, [sp, #20]
	add	x1, x8, #8
	bl	__ZN7sc_core15sc_signal_in_ifIiED2Ev
	b	LBB268_3
LBB268_3:
	ldr	x0, [sp, #24]
	bl	__Unwind_Resume
Lfunc_end23:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table268:
Lexception23:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end23-Lcst_begin23
Lcst_begin23:
	.uleb128 Ltmp240-Lfunc_begin23          ; >> Call Site 1 <<
	.uleb128 Ltmp241-Ltmp240                ;   Call between Ltmp240 and Ltmp241
	.uleb128 Ltmp242-Lfunc_begin23          ;     jumps to Ltmp242
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp241-Lfunc_begin23          ; >> Call Site 2 <<
	.uleb128 Lfunc_end23-Ltmp241            ;   Call between Ltmp241 and Lfunc_end23
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end23:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core17sc_signal_channelC2EPKc ; -- Begin function _ZN7sc_core17sc_signal_channelC2EPKc
	.weak_def_can_be_hidden	__ZN7sc_core17sc_signal_channelC2EPKc
	.p2align	2
__ZN7sc_core17sc_signal_channelC2EPKc:  ; @_ZN7sc_core17sc_signal_channelC2EPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZN7sc_core15sc_prim_channelC2EPKc
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	adrp	x8, __ZTVN7sc_core17sc_signal_channelE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core17sc_signal_channelE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0, #72]
	mov	x8, #-2                         ; =0xfffffffffffffffe
	str	x8, [x0, #80]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev ; -- Begin function _ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev
	.p2align	2
__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev: ; @_ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core27sc_writer_policy_check_portC2Ev
	bl	__ZN7sc_core28sc_writer_policy_check_write10only_deltaEv
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	mov	x1, x0
	add	x0, x8, #8
	bl	__ZN7sc_core28sc_writer_policy_check_writeC2Eb
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_inout_ifIiED2Ev ; -- Begin function _ZN7sc_core18sc_signal_inout_ifIiED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_inout_ifIiED2Ev
	.p2align	2
__ZN7sc_core18sc_signal_inout_ifIiED2Ev: ; @_ZN7sc_core18sc_signal_inout_ifIiED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x9, [x29, #-8]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x9, #8
	add	x1, x8, #24
	bl	__ZN7sc_core18sc_signal_write_ifIiED2Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x1, x8, #8
	bl	__ZN7sc_core15sc_signal_in_ifIiED2Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x0, x8, #16
	add	sp, sp, #16
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_signal_in_ifIiEC2Ev ; -- Begin function _ZN7sc_core15sc_signal_in_ifIiEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_signal_in_ifIiEC2Ev
	.p2align	2
__ZN7sc_core15sc_signal_in_ifIiEC2Ev:   ; @_ZN7sc_core15sc_signal_in_ifIiEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	ldr	x9, [x8]
	str	x9, [x0]
	ldr	x8, [x8, #8]
	ldr	x9, [x0]
	ldur	x9, [x9, #-48]
	str	x8, [x0, x9]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_write_ifIiEC2Ev ; -- Begin function _ZN7sc_core18sc_signal_write_ifIiEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_write_ifIiEC2Ev
	.p2align	2
__ZN7sc_core18sc_signal_write_ifIiEC2Ev: ; @_ZN7sc_core18sc_signal_write_ifIiEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x8, [sp]
	ldr	x9, [x8]
	str	x9, [x0]
	ldr	x8, [x8, #8]
	ldr	x9, [x0]
	ldur	x9, [x9, #-48]
	str	x8, [x0, x9]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_signal_in_ifIiED2Ev ; -- Begin function _ZN7sc_core15sc_signal_in_ifIiED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_signal_in_ifIiED2Ev
	.p2align	2
__ZN7sc_core15sc_signal_in_ifIiED2Ev:   ; @_ZN7sc_core15sc_signal_in_ifIiED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core27sc_writer_policy_check_portC2Ev ; -- Begin function _ZN7sc_core27sc_writer_policy_check_portC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core27sc_writer_policy_check_portC2Ev
	.p2align	2
__ZN7sc_core27sc_writer_policy_check_portC2Ev: ; @_ZN7sc_core27sc_writer_policy_check_portC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core28sc_writer_policy_check_writeC2Eb ; -- Begin function _ZN7sc_core28sc_writer_policy_check_writeC2Eb
	.weak_def_can_be_hidden	__ZN7sc_core28sc_writer_policy_check_writeC2Eb
	.p2align	2
__ZN7sc_core28sc_writer_policy_check_writeC2Eb: ; @_ZN7sc_core28sc_writer_policy_check_writeC2Eb
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	sturb	w1, [x29, #-9]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldurb	w9, [x29, #-9]
	and	w9, w9, #0x1
	strb	w9, [x8]
	add	x0, x8, #8
	bl	__ZN7sc_core17sc_process_handleC1Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handleC1Ev ; -- Begin function _ZN7sc_core17sc_process_handleC1Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_process_handleC1Ev
	.p2align	2
__ZN7sc_core17sc_process_handleC1Ev:    ; @_ZN7sc_core17sc_process_handleC1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core17sc_process_handleC2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handleC2Ev ; -- Begin function _ZN7sc_core17sc_process_handleC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_process_handleC2Ev
	.p2align	2
__ZN7sc_core17sc_process_handleC2Ev:    ; @_ZN7sc_core17sc_process_handleC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
                                        ; kill: def $x8 killed $xzr
	str	xzr, [x0]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core18sc_signal_write_ifIiED2Ev ; -- Begin function _ZN7sc_core18sc_signal_write_ifIiED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core18sc_signal_write_ifIiED2Ev
	.p2align	2
__ZN7sc_core18sc_signal_write_ifIiED2Ev: ; @_ZN7sc_core18sc_signal_write_ifIiED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_ ; -- Begin function _ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
	.globl	__ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
	.weak_definition	__ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
	.p2align	2
__ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_: ; @_ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
Lfunc_begin24:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception24
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	str	x1, [sp, #24]
	ldr	x0, [sp, #24]
	bl	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	str	x0, [sp, #16]
	b	LBB282_1
LBB282_1:
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x0, [x29, #-16]
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	subs	x8, x8, x0
	b.eq	LBB282_3
	b	LBB282_2
LBB282_2:
	mov	w8, #0                          ; =0x0
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB282_5
LBB282_3:
	ldur	x0, [x29, #-16]
	ldr	x3, [sp, #24]
	ldr	x4, [sp, #16]
Ltmp251:
	mov	x1, #0                          ; =0x0
	mov	x2, #-1                         ; =0xffffffffffffffff
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm
	str	w0, [sp, #4]                    ; 4-byte Folded Spill
Ltmp252:
	b	LBB282_4
LBB282_4:
	ldr	w8, [sp, #4]                    ; 4-byte Folded Reload
	subs	w8, w8, #0
	cset	w8, eq
	and	w8, w8, #0x1
	sturb	w8, [x29, #-1]
	b	LBB282_5
LBB282_5:
	ldurb	w8, [x29, #-1]
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB282_6:
Ltmp253:
	bl	___clang_call_terminate
Lfunc_end24:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table282:
Lexception24:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase12-Lttbaseref12
Lttbaseref12:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end24-Lcst_begin24
Lcst_begin24:
	.uleb128 Ltmp251-Lfunc_begin24          ; >> Call Site 1 <<
	.uleb128 Ltmp252-Ltmp251                ;   Call between Ltmp251 and Ltmp252
	.uleb128 Ltmp253-Lfunc_begin24          ;     jumps to Ltmp253
	.byte	1                               ;   On action: 1
Lcst_end24:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase12:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt9type_info4nameB8ne200100Ev ; -- Begin function _ZNKSt9type_info4nameB8ne200100Ev
	.globl	__ZNKSt9type_info4nameB8ne200100Ev
	.weak_definition	__ZNKSt9type_info4nameB8ne200100Ev
	.p2align	2
__ZNKSt9type_info4nameB8ne200100Ev:     ; @_ZNKSt9type_info4nameB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	ldr	x8, [x8, #8]
	str	x8, [sp, #8]
	ldr	x8, [sp, #8]
	and	x0, x8, #0x7fffffffffffffff
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n24_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc ; -- Begin function _ZTv0_n24_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.weak_def_can_be_hidden	__ZTv0_n24_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.p2align	2
__ZTv0_n24_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc: ; @_ZTv0_n24_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x8, [sp, #24]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	add	x0, x8, x9
	add	sp, sp, #32
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne200100Em ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne200100Em
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne200100Em
	.weak_definition	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne200100Em
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne200100Em: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne200100Em
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	subs	x8, x8, #23
	cset	w0, lo
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	tbz	w0, #0, LBB287_2
	b	LBB287_1
LBB287_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB287_3
LBB287_2:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB287_3
LBB287_3:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldrb	w8, [x8, #23]
	and	w9, w8, #0x7f
                                        ; implicit-def: $x8
	mov	x8, x9
	and	x0, x8, #0xff
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc ; -- Begin function _ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc
	.weak_def_can_be_hidden	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc
	.p2align	2
__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc: ; @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	__ZNSt3__19allocatorIcEC1B8ne200100Ev
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x0, [sp, #16]
	bl	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	mov	x2, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n32_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv ; -- Begin function _ZTv0_n32_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.weak_def_can_be_hidden	__ZTv0_n32_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.p2align	2
__ZTv0_n32_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv: ; @_ZTv0_n32_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-32]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x9, [sp, #16]
	str	x9, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #104
	bl	__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	add	x0, x8, #16
	bl	__ZN7sc_core17sc_signal_channelD2Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	add	x1, x8, #8
	bl	__ZN7sc_core18sc_signal_inout_ifIiED2Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	mov	x9, x8
	str	x9, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev ; -- Begin function _ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev
	.p2align	2
__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev: ; @_ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #8
	bl	__ZN7sc_core28sc_writer_policy_check_writeD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core28sc_writer_policy_check_writeD2Ev ; -- Begin function _ZN7sc_core28sc_writer_policy_check_writeD2Ev
	.weak_def_can_be_hidden	__ZN7sc_core28sc_writer_policy_check_writeD2Ev
	.p2align	2
__ZN7sc_core28sc_writer_policy_check_writeD2Ev: ; @_ZN7sc_core28sc_writer_policy_check_writeD2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #8
	bl	__ZN7sc_core17sc_process_handleD1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handleD1Ev ; -- Begin function _ZN7sc_core17sc_process_handleD1Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_process_handleD1Ev
	.p2align	2
__ZN7sc_core17sc_process_handleD1Ev:    ; @_ZN7sc_core17sc_process_handleD1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core17sc_process_handleD2Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handleD2Ev ; -- Begin function _ZN7sc_core17sc_process_handleD2Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_process_handleD2Ev
	.p2align	2
__ZN7sc_core17sc_process_handleD2Ev:    ; @_ZN7sc_core17sc_process_handleD2Ev
Lfunc_begin25:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception25
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	mov	x9, x8
	stur	x9, [x29, #-8]
	ldr	x8, [x8]
	cbz	x8, LBB297_3
	b	LBB297_1
LBB297_1:
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x0, [x8]
Ltmp261:
	bl	__ZN7sc_core12sc_process_b19reference_decrementEv
Ltmp262:
	b	LBB297_2
LBB297_2:
	b	LBB297_3
LBB297_3:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB297_4:
Ltmp263:
	bl	___clang_call_terminate
Lfunc_end25:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table297:
Lexception25:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase13-Lttbaseref13
Lttbaseref13:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end25-Lcst_begin25
Lcst_begin25:
	.uleb128 Ltmp261-Lfunc_begin25          ; >> Call Site 1 <<
	.uleb128 Ltmp262-Ltmp261                ;   Call between Ltmp261 and Ltmp262
	.uleb128 Ltmp263-Lfunc_begin25          ;     jumps to Ltmp263
	.byte	1                               ;   On action: 1
Lcst_end25:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2, 0x0
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase13:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN7sc_core12sc_process_b19reference_decrementEv ; -- Begin function _ZN7sc_core12sc_process_b19reference_decrementEv
	.weak_definition	__ZN7sc_core12sc_process_b19reference_decrementEv
	.p2align	2
__ZN7sc_core12sc_process_b19reference_decrementEv: ; @_ZN7sc_core12sc_process_b19reference_decrementEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	w9, [x8, #196]
	subs	w9, w9, #1
	str	w9, [x8, #196]
	ldr	w8, [x8, #196]
	cbnz	w8, LBB298_2
	b	LBB298_1
LBB298_1:
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZN7sc_core12sc_process_b14delete_processEv
	b	LBB298_2
LBB298_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core17sc_signal_channel5eventEv ; -- Begin function _ZNK7sc_core17sc_signal_channel5eventEv
	.weak_definition	__ZNK7sc_core17sc_signal_channel5eventEv
	.p2align	2
__ZNK7sc_core17sc_signal_channel5eventEv: ; @_ZNK7sc_core17sc_signal_channel5eventEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZNK7sc_core9sc_object10simcontextEv
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	x1, [x8, #80]
	bl	__ZNK7sc_core13sc_simcontext14event_occurredEy
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_object10simcontextEv ; -- Begin function _ZNK7sc_core9sc_object10simcontextEv
	.weak_definition	__ZNK7sc_core9sc_object10simcontextEv
	.p2align	2
__ZNK7sc_core9sc_object10simcontextEv:  ; @_ZNK7sc_core9sc_object10simcontextEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #48]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core13sc_simcontext14event_occurredEy ; -- Begin function _ZNK7sc_core13sc_simcontext14event_occurredEy
	.weak_definition	__ZNK7sc_core13sc_simcontext14event_occurredEy
	.p2align	2
__ZNK7sc_core13sc_simcontext14event_occurredEy: ; @_ZNK7sc_core13sc_simcontext14event_occurredEy
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x8, [sp, #8]
	ldr	x8, [x8, #296]
	ldr	x9, [sp]
	subs	x8, x8, x9
	cset	w0, eq
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb ; -- Begin function _ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb
	.weak_definition	__ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb
	.p2align	2
__ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb: ; @_ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb
Lfunc_begin26:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception26
; %bb.0:
	sub	sp, sp, #128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	sturb	w2, [x29, #-17]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	bl	__ZN7sc_core22sc_get_curr_simcontextEv
	bl	__ZNK7sc_core13sc_simcontext18get_current_writerEv
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	stur	x0, [x29, #-32]
	add	x0, x8, #8
	bl	__ZNK7sc_core17sc_process_handle5validEv
	tbnz	w0, #0, LBB303_4
	b	LBB303_1
LBB303_1:
	ldur	x1, [x29, #-32]
	sub	x0, x29, #40
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	bl	__ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x1, x8, #8
Ltmp270:
	bl	__ZN7sc_core17sc_process_handle4swapERS0_
Ltmp271:
	b	LBB303_2
LBB303_2:
	sub	x0, x29, #40
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB303_11
LBB303_3:
Ltmp272:
	stur	x0, [x29, #-48]
	mov	x8, x1
	stur	w8, [x29, #-52]
	sub	x0, x29, #40
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB303_12
LBB303_4:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x0, x8, #8
	bl	__ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv
	ldur	x9, [x29, #-32]
	mov	w8, #0                          ; =0x0
	subs	x9, x0, x9
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	b.eq	LBB303_6
	b	LBB303_5
LBB303_5:
	ldur	x8, [x29, #-32]
	subs	x8, x8, #0
	cset	w8, ne
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	b	LBB303_6
LBB303_6:
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	tbz	w8, #0, LBB303_10
	b	LBB303_7
LBB303_7:
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldur	x9, [x29, #-16]
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	add	x0, x8, #8
	bl	__ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	mov	x1, x0
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldur	x2, [x29, #-32]
	ldrb	w8, [x8]
	and	w3, w8, #0x1
	bl	__ZN7sc_core24sc_signal_invalid_writerEPNS_9sc_objectES1_S1_b
	ldur	x1, [x29, #-32]
	add	x0, sp, #48
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	add	x1, x8, #8
Ltmp267:
	bl	__ZN7sc_core17sc_process_handle4swapERS0_
Ltmp268:
	b	LBB303_8
LBB303_8:
	add	x0, sp, #48
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB303_10
LBB303_9:
Ltmp269:
	stur	x0, [x29, #-48]
	mov	x8, x1
	stur	w8, [x29, #-52]
	add	x0, sp, #48
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB303_12
LBB303_10:
	b	LBB303_11
LBB303_11:
	mov	w8, #1                          ; =0x1
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
LBB303_12:
	ldur	x0, [x29, #-48]
	bl	__Unwind_Resume
Lfunc_end26:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table303:
Lexception26:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end26-Lcst_begin26
Lcst_begin26:
	.uleb128 Lfunc_begin26-Lfunc_begin26    ; >> Call Site 1 <<
	.uleb128 Ltmp270-Lfunc_begin26          ;   Call between Lfunc_begin26 and Ltmp270
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp270-Lfunc_begin26          ; >> Call Site 2 <<
	.uleb128 Ltmp271-Ltmp270                ;   Call between Ltmp270 and Ltmp271
	.uleb128 Ltmp272-Lfunc_begin26          ;     jumps to Ltmp272
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp271-Lfunc_begin26          ; >> Call Site 3 <<
	.uleb128 Ltmp267-Ltmp271                ;   Call between Ltmp271 and Ltmp267
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp267-Lfunc_begin26          ; >> Call Site 4 <<
	.uleb128 Ltmp268-Ltmp267                ;   Call between Ltmp267 and Ltmp268
	.uleb128 Ltmp269-Lfunc_begin26          ;     jumps to Ltmp269
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp268-Lfunc_begin26          ; >> Call Site 5 <<
	.uleb128 Lfunc_end26-Ltmp268            ;   Call between Ltmp268 and Lfunc_end26
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end26:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv ; -- Begin function _ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv
	.weak_definition	__ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv
	.p2align	2
__ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv: ; @_ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldrb	w8, [x8]
	and	w0, w8, #0x1
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_prim_channel14request_updateEv ; -- Begin function _ZN7sc_core15sc_prim_channel14request_updateEv
	.weak_definition	__ZN7sc_core15sc_prim_channel14request_updateEv
	.p2align	2
__ZN7sc_core15sc_prim_channel14request_updateEv: ; @_ZN7sc_core15sc_prim_channel14request_updateEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	x8, [x8, #64]
	cbnz	x8, LBB305_2
	b	LBB305_1
LBB305_1:
	ldr	x1, [sp]                        ; 8-byte Folded Reload
	ldr	x0, [x1, #56]
	bl	__ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE
	b	LBB305_2
LBB305_2:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core13sc_simcontext18get_current_writerEv ; -- Begin function _ZNK7sc_core13sc_simcontext18get_current_writerEv
	.weak_definition	__ZNK7sc_core13sc_simcontext18get_current_writerEv
	.p2align	2
__ZNK7sc_core13sc_simcontext18get_current_writerEv: ; @_ZNK7sc_core13sc_simcontext18get_current_writerEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #88]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core17sc_process_handle5validEv ; -- Begin function _ZNK7sc_core17sc_process_handle5validEv
	.weak_definition	__ZNK7sc_core17sc_process_handle5validEv
	.p2align	2
__ZNK7sc_core17sc_process_handle5validEv: ; @_ZNK7sc_core17sc_process_handle5validEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	mov	w8, #0                          ; =0x0
	subs	x9, x9, #0
	csinc	w0, w8, wzr, eq
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE ; -- Begin function _ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE
	.weak_def_can_be_hidden	__ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE
	.p2align	2
__ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE: ; @_ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x1, [sp, #16]
	bl	__ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handle4swapERS0_ ; -- Begin function _ZN7sc_core17sc_process_handle4swapERS0_
	.weak_definition	__ZN7sc_core17sc_process_handle4swapERS0_
	.p2align	2
__ZN7sc_core17sc_process_handle4swapERS0_: ; @_ZN7sc_core17sc_process_handle4swapERS0_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x9, [sp, #24]
	ldr	x8, [x9]
	str	x8, [sp, #8]
	ldr	x8, [sp, #16]
	ldr	x8, [x8]
	str	x8, [x9]
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #16]
	str	x8, [x9]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv ; -- Begin function _ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv
	.weak_definition	__ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv
	.p2align	2
__ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv: ; @_ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE ; -- Begin function _ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE
	.weak_def_can_be_hidden	__ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE
	.p2align	2
__ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE: ; @_ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x8, [sp, #16]
	str	x8, [sp]                        ; 8-byte Folded Spill
	mov	x9, x8
	stur	x9, [x29, #-8]
	ldr	x9, [sp, #8]
	str	x9, [x8]
	ldr	x8, [x8]
	cbz	x8, LBB311_2
	b	LBB311_1
LBB311_1:
	ldr	x8, [sp]                        ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	__ZN7sc_core12sc_process_b19reference_incrementEv
	b	LBB311_2
LBB311_2:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core12sc_process_b19reference_incrementEv ; -- Begin function _ZN7sc_core12sc_process_b19reference_incrementEv
	.weak_definition	__ZN7sc_core12sc_process_b19reference_incrementEv
	.p2align	2
__ZN7sc_core12sc_process_b19reference_incrementEv: ; @_ZN7sc_core12sc_process_b19reference_incrementEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	ldr	w8, [x8, #196]
	cbz	w8, LBB312_2
	b	LBB312_1
LBB312_1:
	b	LBB312_3
LBB312_2:
	adrp	x0, l_.str.19@PAGE
	add	x0, x0, l_.str.19@PAGEOFF
	adrp	x1, l_.str.20@PAGE
	add	x1, x1, l_.str.20@PAGEOFF
	mov	w2, #582                        ; =0x246
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB312_3:
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	w8, [x9, #196]
	add	w8, w8, #1
	str	w8, [x9, #196]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE ; -- Begin function _ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE
	.weak_definition	__ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE
	.p2align	2
__ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE: ; @_ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x9, [sp, #8]
	ldr	x8, [x9, #56]
	ldr	x10, [sp]
	str	x8, [x10, #64]
	ldr	x8, [sp]
	str	x8, [x9, #56]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_object4nameEv  ; -- Begin function _ZNK7sc_core9sc_object4nameEv
	.weak_definition	__ZNK7sc_core9sc_object4nameEv
	.p2align	2
__ZNK7sc_core9sc_object4nameEv:         ; @_ZNK7sc_core9sc_object4nameEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	add	x0, x8, #16
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	bl	__ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_ ; -- Begin function _ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_
	.globl	__ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_
	.weak_definition	__ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_
	.p2align	2
__ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_: ; @_ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #16]                   ; 8-byte Folded Spill
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	tbz	w0, #0, LBB318_2
	b	LBB318_1
LBB318_1:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB318_3
LBB318_2:
	ldr	x0, [sp, #16]                   ; 8-byte Folded Reload
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB318_3
LBB318_3:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x0, [x8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev ; -- Begin function _ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	.globl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	.weak_definition	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	.p2align	2
__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev: ; @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_ ; -- Begin function _ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_
	.globl	__ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_
	.weak_definition	__ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_
	.p2align	2
__ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_: ; @_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core28sc_writer_policy_check_write6updateEv ; -- Begin function _ZN7sc_core28sc_writer_policy_check_write6updateEv
	.weak_definition	__ZN7sc_core28sc_writer_policy_check_write6updateEv
	.p2align	2
__ZN7sc_core28sc_writer_policy_check_write6updateEv: ; @_ZN7sc_core28sc_writer_policy_check_write6updateEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x8, [x29, #-8]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldrb	w8, [x8]
	tbz	w8, #0, LBB322_2
	b	LBB322_1
LBB322_1:
	add	x0, sp, #16
	str	x0, [sp]                        ; 8-byte Folded Spill
	bl	__ZN7sc_core17sc_process_handleC1Ev
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	add	x1, x8, #8
	bl	__ZN7sc_core17sc_process_handle4swapERS0_
	ldr	x0, [sp]                        ; 8-byte Folded Reload
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB322_2
LBB322_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv
	.weak_definition	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [sp]                        ; 8-byte Folded Spill
	add	x0, x8, #16
	bl	__ZN7sc_core17sc_signal_channel9do_updateEv
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	ldr	w8, [x9, #132]
	str	w8, [x9, #128]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED1Ev ; -- Begin function _ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED1Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED1Ev
	.p2align	2
__ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED1Ev: ; @_ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	mov	x9, x8
	str	x9, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_inout_ifIiED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED0Ev ; -- Begin function _ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED0Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED0Ev
	.p2align	2
__ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED0Ev: ; @_ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core18sc_signal_inout_ifIiED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core15sc_signal_in_ifIiED1Ev ; -- Begin function _ZTv0_n40_N7sc_core15sc_signal_in_ifIiED1Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core15sc_signal_in_ifIiED1Ev
	.p2align	2
__ZTv0_n40_N7sc_core15sc_signal_in_ifIiED1Ev: ; @_ZTv0_n40_N7sc_core15sc_signal_in_ifIiED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	mov	x9, x8
	str	x9, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core15sc_signal_in_ifIiED1Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core15sc_signal_in_ifIiED0Ev ; -- Begin function _ZTv0_n40_N7sc_core15sc_signal_in_ifIiED0Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core15sc_signal_in_ifIiED0Ev
	.p2align	2
__ZTv0_n40_N7sc_core15sc_signal_in_ifIiED0Ev: ; @_ZTv0_n40_N7sc_core15sc_signal_in_ifIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core15sc_signal_in_ifIiED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev ; -- Begin function _ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev
	.p2align	2
__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev: ; @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	x0, [x29, #-8]
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	ldr	x8, [sp, #16]
	add	x1, x8, #8
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	ldr	x8, [sp]
	mov	x9, x8
	str	x9, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-40]
	add	x0, x8, x9
	add	sp, sp, #16
	b	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__StaticInit,regular,pure_instructions
	.p2align	2                               ; -- Begin function _GLOBAL__sub_I_simple_test_for_mir.cpp
__GLOBAL__sub_I_simple_test_for_mir.cpp: ; @_GLOBAL__sub_I_simple_test_for_mir.cpp
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	___cxx_global_var_init
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.zerofill __DATA,__bss,__ZN7sc_coreL17api_version_checkE,1,0 ; @_ZN7sc_coreL17api_version_checkE
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"clk"

l_.str.1:                               ; @.str.1
	.asciz	"counter"

	.section	__DATA,__const
	.globl	__ZTV14simple_counter           ; @_ZTV14simple_counter
	.weak_def_can_be_hidden	__ZTV14simple_counter
	.p2align	3, 0x0
__ZTV14simple_counter:
	.quad	0
	.quad	__ZTI14simple_counter
	.quad	__ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core9sc_module4kindEv
	.quad	__ZNK7sc_core14sc_object_host16get_child_eventsEv
	.quad	__ZNK7sc_core14sc_object_host17get_child_objectsEv
	.quad	__ZN14simple_counterD1Ev
	.quad	__ZN14simple_counterD0Ev
	.quad	__ZN7sc_core14sc_object_host19get_hierarchy_scopeEv
	.quad	__ZN7sc_core14sc_object_host15add_child_eventEPNS_8sc_eventE
	.quad	__ZN7sc_core14sc_object_host16add_child_objectEPNS_9sc_objectE
	.quad	__ZN7sc_core14sc_object_host18remove_child_eventEPNS_8sc_eventE
	.quad	__ZN7sc_core14sc_object_host19remove_child_objectEPNS_9sc_objectE
	.quad	__ZN7sc_core9sc_module25before_end_of_elaborationEv
	.quad	__ZN7sc_core9sc_module18end_of_elaborationEv
	.quad	__ZN7sc_core9sc_module19start_of_simulationEv
	.quad	__ZN7sc_core9sc_module17end_of_simulationEv
	.quad	-112
	.quad	__ZTI14simple_counter
	.quad	__ZThn112_N14simple_counterD1Ev
	.quad	__ZThn112_N14simple_counterD0Ev

	.section	__TEXT,__cstring,cstring_literals
l_.str.2:                               ; @.str.2
	.asciz	"count_process"

	.private_extern	__ZTI14simple_counter   ; @_ZTI14simple_counter
	.section	__DATA,__const
	.globl	__ZTI14simple_counter
	.weak_definition	__ZTI14simple_counter
	.p2align	3, 0x0
__ZTI14simple_counter:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTS14simple_counter-9223372036854775808
	.quad	__ZTIN7sc_core9sc_moduleE

	.private_extern	__ZTS14simple_counter   ; @_ZTS14simple_counter
	.section	__TEXT,__const
	.globl	__ZTS14simple_counter
	.weak_definition	__ZTS14simple_counter
__ZTS14simple_counter:
	.asciz	"14simple_counter"

	.section	__DATA,__const
	.globl	__ZTVN7sc_core6sc_outIiEE       ; @_ZTVN7sc_core6sc_outIiEE
	.weak_def_can_be_hidden	__ZTVN7sc_core6sc_outIiEE
	.p2align	3, 0x0
__ZTVN7sc_core6sc_outIiEE:
	.quad	0
	.quad	__ZTIN7sc_core6sc_outIiEE
	.quad	__ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core6sc_outIiE4kindEv
	.quad	__ZNK7sc_core9sc_object16get_child_eventsEv
	.quad	__ZNK7sc_core9sc_object17get_child_objectsEv
	.quad	__ZN7sc_core6sc_outIiED1Ev
	.quad	__ZN7sc_core6sc_outIiED0Ev
	.quad	__ZN7sc_core9sc_object19get_hierarchy_scopeEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv
	.quad	__ZN7sc_core12sc_port_base25before_end_of_elaborationEv
	.quad	__ZN7sc_core8sc_inoutIiE18end_of_elaborationEv
	.quad	__ZN7sc_core12sc_port_base19start_of_simulationEv
	.quad	__ZN7sc_core12sc_port_base17end_of_simulationEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_

	.private_extern	__ZTIN7sc_core6sc_outIiEE ; @_ZTIN7sc_core6sc_outIiEE
	.globl	__ZTIN7sc_core6sc_outIiEE
	.weak_definition	__ZTIN7sc_core6sc_outIiEE
	.p2align	3, 0x0
__ZTIN7sc_core6sc_outIiEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN7sc_core6sc_outIiEE-9223372036854775808
	.quad	__ZTIN7sc_core8sc_inoutIiEE

	.private_extern	__ZTSN7sc_core6sc_outIiEE ; @_ZTSN7sc_core6sc_outIiEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core6sc_outIiEE
	.weak_definition	__ZTSN7sc_core6sc_outIiEE
__ZTSN7sc_core6sc_outIiEE:
	.asciz	"N7sc_core6sc_outIiEE"

	.private_extern	__ZTIN7sc_core8sc_inoutIiEE ; @_ZTIN7sc_core8sc_inoutIiEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core8sc_inoutIiEE
	.weak_definition	__ZTIN7sc_core8sc_inoutIiEE
	.p2align	3, 0x0
__ZTIN7sc_core8sc_inoutIiEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN7sc_core8sc_inoutIiEE-9223372036854775808
	.quad	__ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE

	.private_extern	__ZTSN7sc_core8sc_inoutIiEE ; @_ZTSN7sc_core8sc_inoutIiEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core8sc_inoutIiEE
	.weak_definition	__ZTSN7sc_core8sc_inoutIiEE
__ZTSN7sc_core8sc_inoutIiEE:
	.asciz	"N7sc_core8sc_inoutIiEE"

	.private_extern	__ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE ; @_ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
	.weak_definition	__ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
	.p2align	3, 0x0
__ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE-9223372036854775808
	.quad	__ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE

	.private_extern	__ZTSN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE ; @_ZTSN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
	.weak_definition	__ZTSN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
__ZTSN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE:
	.asciz	"N7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE"

	.private_extern	__ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE ; @_ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
	.weak_definition	__ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
	.p2align	3, 0x0
__ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE-9223372036854775808
	.quad	__ZTIN7sc_core12sc_port_baseE

	.private_extern	__ZTSN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE ; @_ZTSN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
	.weak_definition	__ZTSN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
__ZTSN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE:
	.asciz	"N7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE"

	.section	__DATA,__const
	.globl	__ZTVN7sc_core8sc_inoutIiEE     ; @_ZTVN7sc_core8sc_inoutIiEE
	.weak_def_can_be_hidden	__ZTVN7sc_core8sc_inoutIiEE
	.p2align	3, 0x0
__ZTVN7sc_core8sc_inoutIiEE:
	.quad	0
	.quad	__ZTIN7sc_core8sc_inoutIiEE
	.quad	__ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core8sc_inoutIiE4kindEv
	.quad	__ZNK7sc_core9sc_object16get_child_eventsEv
	.quad	__ZNK7sc_core9sc_object17get_child_objectsEv
	.quad	__ZN7sc_core8sc_inoutIiED1Ev
	.quad	__ZN7sc_core8sc_inoutIiED0Ev
	.quad	__ZN7sc_core9sc_object19get_hierarchy_scopeEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv
	.quad	__ZN7sc_core12sc_port_base25before_end_of_elaborationEv
	.quad	__ZN7sc_core8sc_inoutIiE18end_of_elaborationEv
	.quad	__ZN7sc_core12sc_port_base19start_of_simulationEv
	.quad	__ZN7sc_core12sc_port_base17end_of_simulationEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_

	.globl	__ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE ; @_ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
	.weak_def_can_be_hidden	__ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
	.p2align	3, 0x0
__ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE:
	.quad	0
	.quad	__ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE
	.quad	__ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EE4kindEv
	.quad	__ZNK7sc_core9sc_object16get_child_eventsEv
	.quad	__ZNK7sc_core9sc_object17get_child_objectsEv
	.quad	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev
	.quad	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev
	.quad	__ZN7sc_core9sc_object19get_hierarchy_scopeEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv
	.quad	__ZN7sc_core12sc_port_base25before_end_of_elaborationEv
	.quad	__ZN7sc_core12sc_port_base18end_of_elaborationEv
	.quad	__ZN7sc_core12sc_port_base19start_of_simulationEv
	.quad	__ZN7sc_core12sc_port_base17end_of_simulationEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_

	.globl	__ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE ; @_ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
	.weak_def_can_be_hidden	__ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
	.p2align	3, 0x0
__ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE:
	.quad	0
	.quad	__ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE
	.quad	__ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE
	.quad	__ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core12sc_port_base4kindEv
	.quad	__ZNK7sc_core9sc_object16get_child_eventsEv
	.quad	__ZNK7sc_core9sc_object17get_child_objectsEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev
	.quad	__ZN7sc_core9sc_object19get_hierarchy_scopeEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv
	.quad	__ZN7sc_core12sc_port_base25before_end_of_elaborationEv
	.quad	__ZN7sc_core12sc_port_base18end_of_elaborationEv
	.quad	__ZN7sc_core12sc_port_base19start_of_simulationEv
	.quad	__ZN7sc_core12sc_port_base17end_of_simulationEv
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
	.quad	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_
	.quad	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_

	.section	__TEXT,__cstring,cstring_literals
l_.str.3:                               ; @.str.3
	.asciz	"sc_port_base"

l_.str.4:                               ; @.str.4
	.asciz	"sc_port"

l_.str.5:                               ; @.str.5
	.asciz	"sc_inout"

l_.str.6:                               ; @.str.6
	.asciz	"sc_out"

	.private_extern	__ZTIN7sc_core18sc_signal_inout_ifIiEE ; @_ZTIN7sc_core18sc_signal_inout_ifIiEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core18sc_signal_inout_ifIiEE
	.weak_definition	__ZTIN7sc_core18sc_signal_inout_ifIiEE
	.p2align	3, 0x0
__ZTIN7sc_core18sc_signal_inout_ifIiEE:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTSN7sc_core18sc_signal_inout_ifIiEE-9223372036854775808
	.long	2                               ; 0x2
	.long	2                               ; 0x2
	.quad	__ZTIN7sc_core15sc_signal_in_ifIiEE
	.quad	2                               ; 0x2
	.quad	__ZTIN7sc_core18sc_signal_write_ifIiEE
	.quad	2050                            ; 0x802

	.private_extern	__ZTSN7sc_core18sc_signal_inout_ifIiEE ; @_ZTSN7sc_core18sc_signal_inout_ifIiEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core18sc_signal_inout_ifIiEE
	.weak_definition	__ZTSN7sc_core18sc_signal_inout_ifIiEE
__ZTSN7sc_core18sc_signal_inout_ifIiEE:
	.asciz	"N7sc_core18sc_signal_inout_ifIiEE"

	.private_extern	__ZTIN7sc_core15sc_signal_in_ifIiEE ; @_ZTIN7sc_core15sc_signal_in_ifIiEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core15sc_signal_in_ifIiEE
	.weak_definition	__ZTIN7sc_core15sc_signal_in_ifIiEE
	.p2align	3, 0x0
__ZTIN7sc_core15sc_signal_in_ifIiEE:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTSN7sc_core15sc_signal_in_ifIiEE-9223372036854775808
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.quad	__ZTIN7sc_core12sc_interfaceE
	.quad	-12285                          ; 0xffffffffffffd003

	.private_extern	__ZTSN7sc_core15sc_signal_in_ifIiEE ; @_ZTSN7sc_core15sc_signal_in_ifIiEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core15sc_signal_in_ifIiEE
	.weak_definition	__ZTSN7sc_core15sc_signal_in_ifIiEE
__ZTSN7sc_core15sc_signal_in_ifIiEE:
	.asciz	"N7sc_core15sc_signal_in_ifIiEE"

	.private_extern	__ZTIN7sc_core18sc_signal_write_ifIiEE ; @_ZTIN7sc_core18sc_signal_write_ifIiEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core18sc_signal_write_ifIiEE
	.weak_definition	__ZTIN7sc_core18sc_signal_write_ifIiEE
	.p2align	3, 0x0
__ZTIN7sc_core18sc_signal_write_ifIiEE:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTSN7sc_core18sc_signal_write_ifIiEE-9223372036854775808
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.quad	__ZTIN7sc_core12sc_interfaceE
	.quad	-12285                          ; 0xffffffffffffd003

	.private_extern	__ZTSN7sc_core18sc_signal_write_ifIiEE ; @_ZTSN7sc_core18sc_signal_write_ifIiEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core18sc_signal_write_ifIiEE
	.weak_definition	__ZTSN7sc_core18sc_signal_write_ifIiEE
__ZTSN7sc_core18sc_signal_write_ifIiEE:
	.asciz	"N7sc_core18sc_signal_write_ifIiEE"

	.section	__TEXT,__cstring,cstring_literals
l_.str.7:                               ; @.str.7
	.asciz	"iface != 0"

l_.str.8:                               ; @.str.8
	.asciz	"/opt/homebrew/opt/systemc/include/sysc/communication/sc_port.h"

l_.str.9:                               ; @.str.9
	.asciz	"interface already bound to port"

l_.str.10:                              ; @.str.10
	.asciz	"vector"

l_.str.11:                              ; @.str.11
	.asciz	"port is not bound"

l_.str.12:                              ; @.str.12
	.asciz	"iface_p != 0"

l_.str.13:                              ; @.str.13
	.asciz	"Counter: "

l_.str.14:                              ; @.str.14
	.asciz	"&port_ == &cache_p->port()"

l_.str.15:                              ; @.str.15
	.asciz	"/opt/homebrew/opt/systemc/include/sysc/communication/sc_event_finder.h"

	.section	__DATA,__const
	.globl	__ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE ; @_ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
	.weak_def_can_be_hidden	__ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
	.p2align	3, 0x0
__ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE:
	.quad	0
	.quad	__ZTIN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
	.quad	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	.quad	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev
	.quad	__ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE

	.private_extern	__ZTIN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE ; @_ZTIN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
	.globl	__ZTIN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
	.weak_definition	__ZTIN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
	.p2align	3, 0x0
__ZTIN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE-9223372036854775808
	.quad	__ZTIN7sc_core15sc_event_finderE

	.private_extern	__ZTSN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE ; @_ZTSN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
	.weak_definition	__ZTSN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE
__ZTSN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE:
	.asciz	"N7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE"

	.private_extern	__ZTIN7sc_core15sc_signal_in_ifIbEE ; @_ZTIN7sc_core15sc_signal_in_ifIbEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core15sc_signal_in_ifIbEE
	.weak_definition	__ZTIN7sc_core15sc_signal_in_ifIbEE
	.p2align	3, 0x0
__ZTIN7sc_core15sc_signal_in_ifIbEE:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTSN7sc_core15sc_signal_in_ifIbEE-9223372036854775808
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.quad	__ZTIN7sc_core12sc_interfaceE
	.quad	-12285                          ; 0xffffffffffffd003

	.private_extern	__ZTSN7sc_core15sc_signal_in_ifIbEE ; @_ZTSN7sc_core15sc_signal_in_ifIbEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core15sc_signal_in_ifIbEE
	.weak_definition	__ZTSN7sc_core15sc_signal_in_ifIbEE
__ZTSN7sc_core15sc_signal_in_ifIbEE:
	.asciz	"N7sc_core15sc_signal_in_ifIbEE"

	.section	__TEXT,__cstring,cstring_literals
l_.str.16:                              ; @.str.16
	.asciz	"sc_module"

l_.str.17:                              ; @.str.17
	.asciz	"signal"

	.section	__DATA,__const
	.globl	__ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE ; @_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.weak_def_can_be_hidden	__ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.quad	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13default_eventEv
	.quad	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE19value_changed_eventEv
	.quad	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE13posedge_eventEv
	.quad	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE13negedge_eventEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4readEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE12get_data_refEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5eventEv
	.quad	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7posedgeEv
	.quad	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7negedgeEv
	.quad	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_resetEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4kindEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.quad	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE6updateEv
	.quad	__ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_clockEv
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	__ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.quad	0
	.quad	0
	.quad	__ZThn8_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZThn8_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb
	.quad	__ZThn8_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.quad	-16
	.quad	__ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4kindEv
	.quad	__ZNK7sc_core9sc_object16get_child_eventsEv
	.quad	__ZNK7sc_core9sc_object17get_child_objectsEv
	.quad	__ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZN7sc_core9sc_object19get_hierarchy_scopeEv
	.quad	__ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE6updateEv
	.quad	__ZN7sc_core15sc_prim_channel25before_end_of_elaborationEv
	.quad	__ZN7sc_core15sc_prim_channel18end_of_elaborationEv
	.quad	__ZN7sc_core15sc_prim_channel19start_of_simulationEv
	.quad	__ZN7sc_core15sc_prim_channel17end_of_simulationEv

	.globl	__ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE ; @_ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.weak_def_can_be_hidden	__ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE:
	.quad	__ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE+48
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE+48
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE+48
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE+48
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE+48
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE+48
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE+136
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE+48
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE+200
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE+48
	.quad	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE+256
	.quad	__ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE+48
	.quad	__ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE+264

	.globl	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE ; @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE
	.weak_def_can_be_hidden	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE
	.p2align	3, 0x0
__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEE
	.quad	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13default_eventEv
	.quad	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE19value_changed_eventEv
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4readEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE12get_data_refEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5eventEv
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4kindEv
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.quad	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE6updateEv
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	__ZTIN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEE
	.quad	0
	.quad	0
	.quad	__ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb
	.quad	__ZThn8_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv

	.globl	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE ; @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE
	.weak_def_can_be_hidden	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE
	.p2align	3, 0x0
__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core18sc_signal_inout_ifIbEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZN7sc_core18sc_signal_inout_ifIbED1Ev
	.quad	__ZN7sc_core18sc_signal_inout_ifIbED0Ev
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	__ZTIN7sc_core18sc_signal_inout_ifIbEE
	.quad	0
	.quad	0
	.quad	__ZThn8_N7sc_core18sc_signal_inout_ifIbED1Ev
	.quad	__ZThn8_N7sc_core18sc_signal_inout_ifIbED0Ev
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv

	.private_extern	__ZTIN7sc_core18sc_signal_inout_ifIbEE ; @_ZTIN7sc_core18sc_signal_inout_ifIbEE
	.globl	__ZTIN7sc_core18sc_signal_inout_ifIbEE
	.weak_definition	__ZTIN7sc_core18sc_signal_inout_ifIbEE
	.p2align	3, 0x0
__ZTIN7sc_core18sc_signal_inout_ifIbEE:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTSN7sc_core18sc_signal_inout_ifIbEE-9223372036854775808
	.long	2                               ; 0x2
	.long	2                               ; 0x2
	.quad	__ZTIN7sc_core15sc_signal_in_ifIbEE
	.quad	2                               ; 0x2
	.quad	__ZTIN7sc_core18sc_signal_write_ifIbEE
	.quad	2050                            ; 0x802

	.private_extern	__ZTSN7sc_core18sc_signal_inout_ifIbEE ; @_ZTSN7sc_core18sc_signal_inout_ifIbEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core18sc_signal_inout_ifIbEE
	.weak_definition	__ZTSN7sc_core18sc_signal_inout_ifIbEE
__ZTSN7sc_core18sc_signal_inout_ifIbEE:
	.asciz	"N7sc_core18sc_signal_inout_ifIbEE"

	.private_extern	__ZTIN7sc_core18sc_signal_write_ifIbEE ; @_ZTIN7sc_core18sc_signal_write_ifIbEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core18sc_signal_write_ifIbEE
	.weak_definition	__ZTIN7sc_core18sc_signal_write_ifIbEE
	.p2align	3, 0x0
__ZTIN7sc_core18sc_signal_write_ifIbEE:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTSN7sc_core18sc_signal_write_ifIbEE-9223372036854775808
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.quad	__ZTIN7sc_core12sc_interfaceE
	.quad	-12285                          ; 0xffffffffffffd003

	.private_extern	__ZTSN7sc_core18sc_signal_write_ifIbEE ; @_ZTSN7sc_core18sc_signal_write_ifIbEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core18sc_signal_write_ifIbEE
	.weak_definition	__ZTSN7sc_core18sc_signal_write_ifIbEE
__ZTSN7sc_core18sc_signal_write_ifIbEE:
	.asciz	"N7sc_core18sc_signal_write_ifIbEE"

	.section	__DATA,__const
	.globl	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE ; @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE
	.weak_def_can_be_hidden	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE
	.p2align	3, 0x0
__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core15sc_signal_in_ifIbEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZN7sc_core15sc_signal_in_ifIbED1Ev
	.quad	__ZN7sc_core15sc_signal_in_ifIbED0Ev
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv

	.globl	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE ; @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE
	.weak_def_can_be_hidden	__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE
	.p2align	3, 0x0
__ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE:
	.quad	-8
	.quad	0
	.quad	-8
	.quad	-8
	.quad	0
	.quad	__ZTIN7sc_core18sc_signal_write_ifIbEE
	.quad	0
	.quad	0
	.quad	__ZN7sc_core18sc_signal_write_ifIbED1Ev
	.quad	__ZN7sc_core18sc_signal_write_ifIbED0Ev
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv
	.quad	8
	.quad	0
	.quad	0
	.quad	8
	.quad	__ZTIN7sc_core18sc_signal_write_ifIbEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZTv0_n40_N7sc_core18sc_signal_write_ifIbED1Ev
	.quad	__ZTv0_n40_N7sc_core18sc_signal_write_ifIbED0Ev

	.private_extern	__ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE ; @_ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.globl	__ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.weak_definition	__ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE-9223372036854775808
	.quad	__ZTIN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEE

	.private_extern	__ZTSN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE ; @_ZTSN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
	.weak_definition	__ZTSN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE
__ZTSN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE:
	.asciz	"N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE"

	.section	__DATA,__const
	.globl	__ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE ; @_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.weak_def_can_be_hidden	__ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.quad	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	__ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.quad	0
	.quad	0
	.quad	__ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.quad	__ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.quad	-16
	.quad	__ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.quad	__ZNK7sc_core9sc_object16get_child_eventsEv
	.quad	__ZNK7sc_core9sc_object17get_child_objectsEv
	.quad	__ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZN7sc_core9sc_object19get_hierarchy_scopeEv
	.quad	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.quad	__ZN7sc_core15sc_prim_channel25before_end_of_elaborationEv
	.quad	__ZN7sc_core15sc_prim_channel18end_of_elaborationEv
	.quad	__ZN7sc_core15sc_prim_channel19start_of_simulationEv
	.quad	__ZN7sc_core15sc_prim_channel17end_of_simulationEv

	.globl	__ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE ; @_ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.weak_def_can_be_hidden	__ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE:
	.quad	__ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE+48
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE+48
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE+48
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE+48
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE+48
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE+48
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE+136
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE+48
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE+160
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE+48
	.quad	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE+216
	.quad	__ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE+48
	.quad	__ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE+216

	.globl	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE ; @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE
	.weak_def_can_be_hidden	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE
	.p2align	3, 0x0
__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.quad	0
	.quad	0
	.quad	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.quad	__ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv

	.private_extern	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE ; @_ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.globl	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.weak_definition	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTSN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE-9223372036854775808
	.long	2                               ; 0x2
	.long	3                               ; 0x3
	.quad	__ZTIN7sc_core18sc_signal_inout_ifIiEE
	.quad	2                               ; 0x2
	.quad	__ZTIN7sc_core17sc_signal_channelE
	.quad	4098                            ; 0x1002
	.quad	__ZTIN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE
	.quad	26624                           ; 0x6800

	.private_extern	__ZTSN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE ; @_ZTSN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.weak_definition	__ZTSN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
__ZTSN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE:
	.asciz	"N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE"

	.private_extern	__ZTIN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE ; @_ZTIN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE
	.weak_definition	__ZTIN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTIN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE:
	.quad	__ZTVN10__cxxabiv121__vmi_class_type_infoE+16
	.quad	__ZTSN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE-9223372036854775808
	.long	0                               ; 0x0
	.long	2                               ; 0x2
	.quad	__ZTIN7sc_core27sc_writer_policy_check_portE
	.quad	2                               ; 0x2
	.quad	__ZTIN7sc_core28sc_writer_policy_check_writeE
	.quad	2050                            ; 0x802

	.private_extern	__ZTSN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE ; @_ZTSN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE
	.weak_definition	__ZTSN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE
__ZTSN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE:
	.asciz	"N7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE"

	.private_extern	__ZTIN7sc_core27sc_writer_policy_check_portE ; @_ZTIN7sc_core27sc_writer_policy_check_portE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core27sc_writer_policy_check_portE
	.weak_definition	__ZTIN7sc_core27sc_writer_policy_check_portE
	.p2align	3, 0x0
__ZTIN7sc_core27sc_writer_policy_check_portE:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSN7sc_core27sc_writer_policy_check_portE-9223372036854775808

	.private_extern	__ZTSN7sc_core27sc_writer_policy_check_portE ; @_ZTSN7sc_core27sc_writer_policy_check_portE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core27sc_writer_policy_check_portE
	.weak_definition	__ZTSN7sc_core27sc_writer_policy_check_portE
__ZTSN7sc_core27sc_writer_policy_check_portE:
	.asciz	"N7sc_core27sc_writer_policy_check_portE"

	.private_extern	__ZTIN7sc_core28sc_writer_policy_check_writeE ; @_ZTIN7sc_core28sc_writer_policy_check_writeE
	.section	__DATA,__const
	.globl	__ZTIN7sc_core28sc_writer_policy_check_writeE
	.weak_definition	__ZTIN7sc_core28sc_writer_policy_check_writeE
	.p2align	3, 0x0
__ZTIN7sc_core28sc_writer_policy_check_writeE:
	.quad	__ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	__ZTSN7sc_core28sc_writer_policy_check_writeE-9223372036854775808

	.private_extern	__ZTSN7sc_core28sc_writer_policy_check_writeE ; @_ZTSN7sc_core28sc_writer_policy_check_writeE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core28sc_writer_policy_check_writeE
	.weak_definition	__ZTSN7sc_core28sc_writer_policy_check_writeE
__ZTSN7sc_core28sc_writer_policy_check_writeE:
	.asciz	"N7sc_core28sc_writer_policy_check_writeE"

	.section	__DATA,__const
	.globl	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE ; @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE
	.weak_def_can_be_hidden	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE
	.p2align	3, 0x0
__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core18sc_signal_inout_ifIiEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZN7sc_core18sc_signal_inout_ifIiED1Ev
	.quad	__ZN7sc_core18sc_signal_inout_ifIiED0Ev
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	__ZTIN7sc_core18sc_signal_inout_ifIiEE
	.quad	0
	.quad	0
	.quad	__ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev
	.quad	__ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv

	.globl	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE ; @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE
	.weak_def_can_be_hidden	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE
	.p2align	3, 0x0
__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core15sc_signal_in_ifIiEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZN7sc_core15sc_signal_in_ifIiED1Ev
	.quad	__ZN7sc_core15sc_signal_in_ifIiED0Ev
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual

	.globl	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE ; @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE
	.weak_def_can_be_hidden	__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE
	.p2align	3, 0x0
__ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE:
	.quad	-8
	.quad	0
	.quad	-8
	.quad	-8
	.quad	0
	.quad	__ZTIN7sc_core18sc_signal_write_ifIiEE
	.quad	0
	.quad	0
	.quad	__ZN7sc_core18sc_signal_write_ifIiED1Ev
	.quad	__ZN7sc_core18sc_signal_write_ifIiED0Ev
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv
	.quad	8
	.quad	0
	.quad	0
	.quad	8
	.quad	__ZTIN7sc_core18sc_signal_write_ifIiEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev
	.quad	__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev

	.private_extern	__ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE ; @_ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.globl	__ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.weak_definition	__ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE-9223372036854775808
	.quad	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE

	.private_extern	__ZTSN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE ; @_ZTSN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.section	__TEXT,__const
	.globl	__ZTSN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
	.weak_definition	__ZTSN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE
__ZTSN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE:
	.asciz	"N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE"

	.section	__DATA,__const
	.globl	__ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE ; @_ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.weak_def_can_be_hidden	__ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.quad	0
	.quad	0
	.quad	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi
	.quad	__ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv
	.quad	-16
	.quad	__ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE
	.quad	__ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv
	.quad	__ZNK7sc_core9sc_object16get_child_eventsEv
	.quad	__ZNK7sc_core9sc_object17get_child_objectsEv
	.quad	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	.quad	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.quad	__ZN7sc_core9sc_object19get_hierarchy_scopeEv
	.quad	__ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.quad	__ZN7sc_core15sc_prim_channel25before_end_of_elaborationEv
	.quad	__ZN7sc_core15sc_prim_channel18end_of_elaborationEv
	.quad	__ZN7sc_core15sc_prim_channel19start_of_simulationEv
	.quad	__ZN7sc_core15sc_prim_channel17end_of_simulationEv

	.globl	__ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE ; @_ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.weak_def_can_be_hidden	__ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE
	.p2align	3, 0x0
__ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE:
	.quad	__ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE+48
	.quad	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE+48
	.quad	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE+48
	.quad	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE+48
	.quad	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE+48
	.quad	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE+136
	.quad	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE+48
	.quad	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE+160
	.quad	__ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE+48
	.quad	__ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE+216

	.globl	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE ; @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE
	.weak_def_can_be_hidden	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE
	.p2align	3, 0x0
__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core18sc_signal_inout_ifIiEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZN7sc_core18sc_signal_inout_ifIiED1Ev
	.quad	__ZN7sc_core18sc_signal_inout_ifIiED0Ev
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	-8
	.quad	__ZTIN7sc_core18sc_signal_inout_ifIiEE
	.quad	0
	.quad	0
	.quad	__ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev
	.quad	__ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv

	.globl	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE ; @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE
	.weak_def_can_be_hidden	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE
	.p2align	3, 0x0
__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	__ZTIN7sc_core15sc_signal_in_ifIiEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZN7sc_core15sc_signal_in_ifIiED1Ev
	.quad	__ZN7sc_core15sc_signal_in_ifIiED0Ev
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual
	.quad	___cxa_pure_virtual

	.globl	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE ; @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE
	.weak_def_can_be_hidden	__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE
	.p2align	3, 0x0
__ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE:
	.quad	-8
	.quad	0
	.quad	-8
	.quad	-8
	.quad	0
	.quad	__ZTIN7sc_core18sc_signal_write_ifIiEE
	.quad	0
	.quad	0
	.quad	__ZN7sc_core18sc_signal_write_ifIiED1Ev
	.quad	__ZN7sc_core18sc_signal_write_ifIiED0Ev
	.quad	___cxa_pure_virtual
	.quad	__ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv
	.quad	8
	.quad	0
	.quad	0
	.quad	8
	.quad	__ZTIN7sc_core18sc_signal_write_ifIiEE
	.quad	__ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc
	.quad	__ZNK7sc_core12sc_interface13default_eventEv
	.quad	__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev
	.quad	__ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev

	.section	__TEXT,__cstring,cstring_literals
l_.str.18:                              ; @.str.18
	.asciz	"sc_signal"

l_.str.19:                              ; @.str.19
	.asciz	"m_references_n != 0"

l_.str.20:                              ; @.str.20
	.asciz	"/opt/homebrew/opt/systemc/include/sysc/kernel/sc_process.h"

l_.str.21:                              ; @.str.21
	.asciz	"     name = "

l_.str.22:                              ; @.str.22
	.asciz	"    value = "

l_.str.23:                              ; @.str.23
	.asciz	"new value = "

	.section	__DATA,__mod_init_func,mod_init_funcs
	.p2align	3, 0x0
	.quad	__GLOBAL__sub_I_simple_test_for_mir.cpp
.subsections_via_symbols
