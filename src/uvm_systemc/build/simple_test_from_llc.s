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
Lloh0:
	adrp	x0, __ZN7sc_coreL17api_version_checkE@PAGE
Lloh1:
	add	x0, x0, __ZN7sc_coreL17api_version_checkE@PAGEOFF
	mov	w1, #0                          ; =0x0
	mov	w2, #0                          ; =0x0
	bl	__ZN7sc_core31sc_api_version_3_0_1_cxx201703LC1ENS_16sc_writer_policyEb
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
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
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #1552
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	sub	x8, x29, #32
	add	x19, sp, #836
	str	w0, [x8, #12]
	str	x1, [x8]
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	add	x0, sp, #1008
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
	adrp	x1, l_.str.1@PAGE
	add	x1, x1, l_.str.1@PAGEOFF
	add	x0, sp, #16
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
	mov	w8, #1                          ; =0x1
	strb	w8, [sp, #15]
Ltmp23:
	add	x0, sp, #848
	add	x1, sp, #15
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
	strb	wzr, [sp, #14]
Ltmp27:
	add	x0, sp, #848
	add	x1, sp, #14
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
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB1_13:
Ltmp2:
	stur	x0, [x19, #4]
	str	w1, [x19]
	b	LBB1_21
LBB1_14:
Ltmp5:
	stur	x0, [x19, #4]
	str	w1, [x19]
	b	LBB1_20
LBB1_15:
Ltmp16:
	stur	x0, [x19, #4]
	str	w1, [x19]
	b	LBB1_19
LBB1_16:
Ltmp10:
	stur	x0, [x19, #4]
	str	w1, [x19]
Ltmp11:
	add	x0, sp, #16
	bl	__ZN7sc_core14sc_module_nameD1Ev
Ltmp12:
	b	LBB1_17
LBB1_17:
	b	LBB1_19
LBB1_18:
Ltmp31:
	stur	x0, [x19, #4]
	str	w1, [x19]
	add	x0, sp, #80
	bl	__ZN14simple_counterD1Ev
LBB1_19:
	add	x0, sp, #696
	bl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
LBB1_20:
	add	x0, sp, #848
	bl	__ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev
LBB1_21:
	add	x0, sp, #1008
	bl	__ZN7sc_core8sc_clockD1Ev
; %bb.22:
	ldur	x0, [x19, #4]
	bl	__Unwind_Resume
LBB1_23:
Ltmp13:
                                        ; kill: killed $x1
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
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	ldr	x19, [sp, #24]
	mov	x0, x19
	bl	__ZN7sc_core12sc_interfaceC2Ev
Ltmp32:
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	mov	w1, #0                          ; =0x0
	bl	__ZN7sc_core18sc_gen_unique_nameEPKcb
	mov	x2, x0
Ltmp33:
	b	LBB2_1
LBB2_1:
	strb	wzr, [sp, #11]
Ltmp34:
	adrp	x8, __ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	add	x1, x8, #8
	mov	x0, x19
	add	x3, sp, #11
	bl	__ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEC2EPKcRKb
Ltmp35:
	b	LBB2_2
LBB2_2:
	adrp	x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #48                         ; =0x30
	add	x8, x8, x9
	str	x8, [x19]
	adrp	x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #48                         ; =0x30
	add	x8, x8, x9
	str	x8, [x19]
	adrp	x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #264                        ; =0x108
	add	x8, x8, x9
	str	x8, [x19, #8]
	adrp	x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #328                        ; =0x148
	add	x8, x8, x9
	str	x8, [x19, #16]
	str	xzr, [x19, #136]
	str	xzr, [x19, #144]
	str	xzr, [x19, #152]
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB2_3:
Ltmp36:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	mov	x0, x19
	bl	__ZN7sc_core12sc_interfaceD2Ev
; %bb.4:
	ldr	x0, [sp, #16]
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
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	ldr	x19, [sp, #24]
	mov	x0, x19
	bl	__ZN7sc_core12sc_interfaceC2Ev
Ltmp37:
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	mov	w1, #0                          ; =0x0
	bl	__ZN7sc_core18sc_gen_unique_nameEPKcb
	mov	x2, x0
Ltmp38:
	b	LBB3_1
LBB3_1:
	str	wzr, [sp, #8]
Ltmp39:
	adrp	x8, __ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	add	x1, x8, #8
	mov	x0, x19
	add	x3, sp, #8
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi
Ltmp40:
	b	LBB3_2
LBB3_2:
	adrp	x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #48                         ; =0x30
	add	x8, x8, x9
	str	x8, [x19]
	adrp	x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #48                         ; =0x30
	add	x8, x8, x9
	str	x8, [x19]
	adrp	x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #216                        ; =0xd8
	add	x8, x8, x9
	str	x8, [x19, #8]
	adrp	x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #280                        ; =0x118
	add	x8, x8, x9
	str	x8, [x19, #16]
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB3_3:
Ltmp41:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	mov	x0, x19
	bl	__ZN7sc_core12sc_interfaceD2Ev
; %bb.4:
	ldr	x0, [sp, #16]
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN14simple_counterC2EN7sc_core14sc_module_nameE
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	ldur	w8, [x29, #-4]
	scvtf	d0, w8
	ldur	w1, [x29, #-8]
	add	x0, sp, #8
	bl	__ZN7sc_core7sc_timeC1EdNS_12sc_time_unitE
	ldur	w1, [x29, #-12]
	add	x0, sp, #8
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN14simple_counterD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev ; -- Begin function _ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.p2align	2
__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev: ; @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	adrp	x8, __ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x1, [x8, __ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x0, x19
	bl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev
	mov	x0, x19
	bl	__ZN7sc_core12sc_interfaceD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	str	x0, [sp, #40]
	str	x1, [sp, #32]
	ldr	x19, [sp, #40]
	mov	x0, x19
	bl	__ZN7sc_core9sc_moduleC2Ev
	adrp	x8, __ZTV14simple_counter@GOTPAGE
	ldr	x8, [x8, __ZTV14simple_counter@GOTPAGEOFF]
	add	x9, x8, #16
	str	x9, [x19]
	add	x8, x8, #168
	str	x8, [x19, #112]
	add	x20, x19, #232
Ltmp42:
	mov	x0, x20
	bl	__ZN7sc_core5sc_inIbEC1Ev
Ltmp43:
	b	LBB11_1
LBB11_1:
	add	x21, x19, #360
Ltmp45:
	mov	x0, x21
	bl	__ZN7sc_core5sc_inIbEC1Ev
Ltmp46:
	b	LBB11_2
LBB11_2:
	add	x22, x19, #488
Ltmp48:
	mov	x0, x22
	bl	__ZN7sc_core6sc_outIiEC1Ev
Ltmp49:
	b	LBB11_3
LBB11_3:
	str	wzr, [x19, #608]
	mov	x8, #-224                       ; =0xffffffffffffff20
	str	x8, [sp, #8]
	adrp	x8, __ZN14simple_counter13count_processEv@GOTPAGE
	ldr	x8, [x8, __ZN14simple_counter13count_processEv@GOTPAGEOFF]
	str	x8, [sp]
	ldr	x2, [sp, #8]
	ldr	x1, [sp]
Ltmp51:
	adrp	x3, l_.str.2@PAGE
	add	x3, x3, l_.str.2@PAGEOFF
	mov	x0, x19
	bl	__ZN7sc_core9sc_module22declare_method_processEMNS_15sc_process_hostEFvvEPKc
Ltmp52:
	b	LBB11_4
LBB11_4:
	add	x23, x19, #120
	add	x0, x19, #232
Ltmp53:
	bl	__ZNK7sc_core5sc_inIbE3posEv
	mov	x1, x0
Ltmp54:
	b	LBB11_5
LBB11_5:
Ltmp55:
	mov	x0, x23
	bl	__ZN7sc_core12sc_sensitivelsERNS_15sc_event_finderE
Ltmp56:
	b	LBB11_6
LBB11_6:
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB11_7:
Ltmp44:
	str	x0, [sp, #24]
	str	w1, [sp, #20]
	b	LBB11_13
LBB11_8:
Ltmp47:
	str	x0, [sp, #24]
	str	w1, [sp, #20]
	b	LBB11_12
LBB11_9:
Ltmp50:
	str	x0, [sp, #24]
	str	w1, [sp, #20]
	b	LBB11_11
LBB11_10:
Ltmp57:
	str	x0, [sp, #24]
	str	w1, [sp, #20]
	mov	x0, x22
	bl	__ZN7sc_core6sc_outIiED1Ev
LBB11_11:
	mov	x0, x21
	bl	__ZN7sc_core5sc_inIbED1Ev
LBB11_12:
	mov	x0, x20
	bl	__ZN7sc_core5sc_inIbED1Ev
LBB11_13:
	mov	x0, x19
	bl	__ZN7sc_core9sc_moduleD2Ev
; %bb.14:
	ldr	x0, [sp, #24]
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core5sc_inIbEC2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core6sc_outIiEC1Ev      ; -- Begin function _ZN7sc_core6sc_outIiEC1Ev
	.weak_def_can_be_hidden	__ZN7sc_core6sc_outIiEC1Ev
	.p2align	2
__ZN7sc_core6sc_outIiEC1Ev:             ; @_ZN7sc_core6sc_outIiEC1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core6sc_outIiEC2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN14simple_counter13count_processEv ; -- Begin function _ZN14simple_counter13count_processEv
	.weak_definition	__ZN14simple_counter13count_processEv
	.p2align	2
__ZN14simple_counter13count_processEv:  ; @_ZN14simple_counter13count_processEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	add	x0, x19, #360
	bl	__ZNK7sc_core5sc_inIbE4readEv
	ldrb	w8, [x0]
	tbz	w8, #0, LBB14_2
; %bb.1:
	str	wzr, [x19, #608]
	b	LBB14_3
LBB14_2:
	ldr	w8, [x19, #608]
	add	w8, w8, #1
	str	w8, [x19, #608]
LBB14_3:
	add	x0, x19, #488
	add	x1, x19, #608
	bl	__ZN7sc_core8sc_inoutIiE5writeERKi
	adrp	x8, __ZNSt3__14coutE@GOTPAGE
	ldr	x0, [x8, __ZNSt3__14coutE@GOTPAGEOFF]
	adrp	x8, l_.str.13@PAGE
	add	x1, x8, l_.str.13@PAGEOFF
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	ldr	w1, [x19, #608]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	adrp	x8, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGE
	add	x1, x8, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGEOFF
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	add	x0, x1, #120
	mov	w8, #1                          ; =0x1
	str	x8, [sp, #16]
	mov	w8, #40                         ; =0x28
	str	x8, [sp, #8]
	ldr	x3, [sp, #16]
	ldr	x2, [sp, #8]
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core6sc_outIiED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core5sc_inIbED1Ev       ; -- Begin function _ZN7sc_core5sc_inIbED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core5sc_inIbED1Ev
	.p2align	2
__ZN7sc_core5sc_inIbED1Ev:              ; @_ZN7sc_core5sc_inIbED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core5sc_inIbED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	adrp	x8, l_.str.16@PAGE
	add	x0, x8, l_.str.16@PAGEOFF
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN14simple_counterD1Ev
	mov	x0, x19
	mov	x1, #616                        ; =0x268
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core7sc_portINS_15sc_signal_in_ifIbEELi1ELNS_14sc_port_policyE0EEC2Ev
	adrp	x8, __ZTVN7sc_core5sc_inIbEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core5sc_inIbEE@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	str	xzr, [x19, #96]
	str	xzr, [x19, #104]
	str	xzr, [x19, #112]
	str	xzr, [x19, #120]
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core6sc_outIiEC2Ev      ; -- Begin function _ZN7sc_core6sc_outIiEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core6sc_outIiEC2Ev
	.p2align	2
__ZN7sc_core6sc_outIiEC2Ev:             ; @_ZN7sc_core6sc_outIiEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core8sc_inoutIiEC2Ev
	adrp	x8, __ZTVN7sc_core6sc_outIiEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core6sc_outIiEE@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_inoutIiEC2Ev    ; -- Begin function _ZN7sc_core8sc_inoutIiEC2Ev
	.weak_def_can_be_hidden	__ZN7sc_core8sc_inoutIiEC2Ev
	.p2align	2
__ZN7sc_core8sc_inoutIiEC2Ev:           ; @_ZN7sc_core8sc_inoutIiEC2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev
	adrp	x8, __ZTVN7sc_core8sc_inoutIiEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core8sc_inoutIiEE@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	str	xzr, [x19, #96]
	str	xzr, [x19, #104]
	str	xzr, [x19, #112]
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	adrp	x8, l_.str.6@PAGE
	add	x0, x8, l_.str.6@PAGEOFF
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core6sc_outIiED1Ev
	mov	x0, x19
	mov	x1, #120                        ; =0x78
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x8, [x8, #64]
	mov	x0, #0                          ; =0x0
	cbz	x8, LBB29_2
; %bb.1:
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x0, x8, x9
LBB29_2:
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv ; -- Begin function _ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.weak_def_can_be_hidden	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.p2align	2
__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv: ; @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x8, [x8, #64]
	mov	x0, #0                          ; =0x0
	cbz	x8, LBB30_2
; %bb.1:
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x0, x8, x9
LBB30_2:
	add	sp, sp, #16
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
	adrp	x8, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGE
	add	x1, x8, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGEOFF
	add	x0, sp, #8
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x19, [sp, #16]
	ldr	x0, [sp, #8]
	cbz	x0, LBB32_2
; %bb.1:
	adrp	x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x8, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGE
	add	x2, x8, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	b	LBB32_3
LBB32_2:
	mov	x0, #0                          ; =0x0
	b	LBB32_3
LBB32_3:
	str	x0, [sp]
	ldr	x8, [sp]
	cbnz	x8, LBB32_5
; %bb.4:
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-20]
	b	LBB32_6
LBB32_5:
	ldr	x8, [sp]
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x1, x8, x9
	mov	x0, x19
	bl	__ZN7sc_core12sc_port_base4bindERNS_12sc_interfaceE
	stur	wzr, [x29, #-20]
LBB32_6:
	ldur	w0, [x29, #-20]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x19, [sp, #16]
	ldr	x0, [sp, #8]
	cbz	x0, LBB33_2
; %bb.1:
	adrp	x8, __ZTIN7sc_core12sc_port_baseE@GOTPAGE
	ldr	x1, [x8, __ZTIN7sc_core12sc_port_baseE@GOTPAGEOFF]
	adrp	x8, __ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@PAGE
	add	x2, x8, __ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@PAGEOFF
	mov	x3, #0                          ; =0x0
	bl	___dynamic_cast
	b	LBB33_3
LBB33_2:
	mov	x0, #0                          ; =0x0
	b	LBB33_3
LBB33_3:
	str	x0, [sp]
	ldr	x8, [sp]
	cbnz	x8, LBB33_5
; %bb.4:
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-20]
	b	LBB33_6
LBB33_5:
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZN7sc_core12sc_port_base4bindERS0_
	stur	wzr, [x29, #-20]
LBB33_6:
	ldur	w0, [x29, #-20]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x19, [sp, #24]
	ldr	x0, [sp, #16]
	cbz	x0, LBB34_2
; %bb.1:
	adrp	x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x8, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGE
	add	x2, x8, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	b	LBB34_3
LBB34_2:
	mov	x0, #0                          ; =0x0
	b	LBB34_3
LBB34_3:
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	cbz	x8, LBB34_5
; %bb.4:
	b	LBB34_6
LBB34_5:
	adrp	x8, l_.str.7@PAGE
	add	x0, x8, l_.str.7@PAGEOFF
	adrp	x8, l_.str.8@PAGE
	add	x1, x8, l_.str.8@PAGEOFF
	mov	w2, #548                        ; =0x224
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB34_6:
	mov	x0, x19
	bl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	str	w0, [sp, #4]
	str	wzr, [sp]
LBB34_7:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp]
	ldr	w9, [sp, #4]
	cmp	w8, w9
	b.ge	LBB34_12
; %bb.8:                                ;   in Loop: Header=BB34_7 Depth=1
	ldr	x20, [sp, #8]
	add	x0, x19, #72
	ldrsw	x1, [sp]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	ldr	x8, [x0]
	cmp	x20, x8
	b.ne	LBB34_10
; %bb.9:                                ;   in Loop: Header=BB34_7 Depth=1
	adrp	x8, __ZN7sc_core22SC_ID_BIND_IF_TO_PORT_E@GOTPAGE
	ldr	x1, [x8, __ZN7sc_core22SC_ID_BIND_IF_TO_PORT_E@GOTPAGEOFF]
	adrp	x8, l_.str.9@PAGE
	add	x2, x8, l_.str.9@PAGEOFF
	mov	x0, x19
	bl	__ZNK7sc_core12sc_port_base12report_errorEPKcS2_
LBB34_10:                               ;   in Loop: Header=BB34_7 Depth=1
	b	LBB34_11
LBB34_11:                               ;   in Loop: Header=BB34_7 Depth=1
	ldr	w8, [sp]
	add	w8, w8, #1
	str	w8, [sp]
	b	LBB34_7
LBB34_12:
	add	x0, x19, #72
	add	x1, sp, #8
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_
	add	x0, x19, #72
	mov	x1, #0                          ; =0x0
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	ldr	x8, [x0]
	str	x8, [x19, #64]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	ldr	x19, [sp, #24]
	ldr	x8, [x19, #96]
	cbz	x8, LBB36_4
; %bb.1:
	ldr	x1, [x19, #96]
	mov	x0, x19
	bl	__ZN7sc_core8sc_inoutIiE5writeERKi
	ldr	x0, [x19, #96]
	cbz	x0, LBB36_3
; %bb.2:
	mov	x1, #4                          ; =0x4
	bl	__ZdlPvm
LBB36_3:
	str	xzr, [x19, #96]
LBB36_4:
	ldr	x8, [x19, #104]
	cbz	x8, LBB36_13
; %bb.5:
	str	wzr, [sp, #20]
LBB36_6:                                ; =>This Inner Loop Header: Depth=1
	ldr	w20, [sp, #20]
	ldr	x0, [x19, #104]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	cmp	w20, w0
	b.ge	LBB36_12
; %bb.7:                                ;   in Loop: Header=BB36_6 Depth=1
	ldr	x0, [x19, #104]
	ldrsw	x1, [sp, #20]
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em
	ldr	x8, [x0]
	str	x8, [sp, #8]
	ldr	x8, [x19]
	ldr	x8, [x8, #72]
	mov	x0, x19
	blr	x8
	cbz	x0, LBB36_9
; %bb.8:                                ;   in Loop: Header=BB36_6 Depth=1
	adrp	x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x8, __ZTIN7sc_core15sc_signal_in_ifIiEE@PAGE
	add	x2, x8, __ZTIN7sc_core15sc_signal_in_ifIiEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	b	LBB36_10
LBB36_9:                                ;   in Loop: Header=BB36_6 Depth=1
	mov	x0, #0                          ; =0x0
	b	LBB36_10
LBB36_10:                               ;   in Loop: Header=BB36_6 Depth=1
	str	x0, [sp]
	ldr	x8, [sp, #8]
	ldr	x20, [x8]
	ldr	x0, [sp]
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	blr	x8
	mov	x1, x0
	ldr	x8, [sp, #8]
	add	x2, x8, #8
	mov	x0, x20
	mov	w3, #32                         ; =0x20
	bl	__ZN7sc_core8sc_traceEPNS_13sc_trace_fileERKiRKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi
; %bb.11:                               ;   in Loop: Header=BB36_6 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB36_6
LBB36_12:
	mov	x0, x19
	bl	__ZNK7sc_core8sc_inoutIiE13remove_tracesEv
LBB36_13:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-24]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	ldur	x19, [x29, #-24]
	ldr	x8, [x19, #56]
	cbnz	x8, LBB37_9
; %bb.1:
	mov	x0, x19
	bl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	str	w0, [sp, #20]
	str	wzr, [sp, #16]
LBB37_2:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	ldr	w9, [sp, #20]
	cmp	w8, w9
	b.ge	LBB37_8
; %bb.3:                                ;   in Loop: Header=BB37_2 Depth=1
	add	x0, x19, #72
	ldrsw	x1, [sp, #16]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	ldr	x8, [x0]
	str	x8, [sp, #8]
	ldr	x8, [sp, #8]
	cbz	x8, LBB37_5
; %bb.4:                                ;   in Loop: Header=BB37_2 Depth=1
	b	LBB37_6
LBB37_5:
	adrp	x8, l_.str.12@PAGE
	add	x0, x8, l_.str.12@PAGEOFF
	adrp	x8, l_.str.8@PAGE
	add	x1, x8, l_.str.8@PAGEOFF
	mov	w2, #596                        ; =0x254
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB37_6:                                ;   in Loop: Header=BB37_2 Depth=1
	ldr	x20, [sp, #32]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x0, x8, x9
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	mov	x2, x0
	mov	x0, x19
	mov	x1, x20
	bl	__ZNK7sc_core12sc_port_base16add_static_eventEPNS_17sc_thread_processERKNS_8sc_eventE
; %bb.7:                                ;   in Loop: Header=BB37_2 Depth=1
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB37_2
LBB37_8:
	b	LBB37_10
LBB37_9:
	ldr	x1, [sp, #32]
	ldr	x2, [sp, #24]
	mov	x0, x19
	bl	__ZNK7sc_core12sc_port_base14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE
LBB37_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
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
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-24]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	ldur	x19, [x29, #-24]
	ldr	x8, [x19, #56]
	cbnz	x8, LBB38_9
; %bb.1:
	mov	x0, x19
	bl	__ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv
	str	w0, [sp, #20]
	str	wzr, [sp, #16]
LBB38_2:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	ldr	w9, [sp, #20]
	cmp	w8, w9
	b.ge	LBB38_8
; %bb.3:                                ;   in Loop: Header=BB38_2 Depth=1
	add	x0, x19, #72
	ldrsw	x1, [sp, #16]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em
	ldr	x8, [x0]
	str	x8, [sp, #8]
	ldr	x8, [sp, #8]
	cbz	x8, LBB38_5
; %bb.4:                                ;   in Loop: Header=BB38_2 Depth=1
	b	LBB38_6
LBB38_5:
	adrp	x8, l_.str.12@PAGE
	add	x0, x8, l_.str.12@PAGEOFF
	adrp	x8, l_.str.8@PAGE
	add	x1, x8, l_.str.8@PAGEOFF
	mov	w2, #617                        ; =0x269
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB38_6:                                ;   in Loop: Header=BB38_2 Depth=1
	ldr	x20, [sp, #32]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-48]
	add	x0, x8, x9
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
	mov	x2, x0
	mov	x0, x19
	mov	x1, x20
	bl	__ZNK7sc_core12sc_port_base16add_static_eventEPNS_17sc_method_processERKNS_8sc_eventE
; %bb.7:                                ;   in Loop: Header=BB38_2 Depth=1
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB38_2
LBB38_8:
	b	LBB38_10
LBB38_9:
	ldr	x1, [sp, #32]
	ldr	x2, [sp, #24]
	mov	x0, x19
	bl	__ZNK7sc_core12sc_port_base14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE
LBB38_10:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	mov	w2, #0                          ; =0x0
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE
	adrp	x8, __ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	adrp	x8, l_.str.5@PAGE
	add	x0, x8, l_.str.5@PAGEOFF
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core8sc_inoutIiED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core8sc_inoutIiED0Ev    ; -- Begin function _ZN7sc_core8sc_inoutIiED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core8sc_inoutIiED0Ev
	.p2align	2
__ZN7sc_core8sc_inoutIiED0Ev:           ; @_ZN7sc_core8sc_inoutIiED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core8sc_inoutIiED1Ev
	mov	x0, x19
	mov	x1, #120                        ; =0x78
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	str	w2, [sp]
	ldr	x19, [sp, #8]
	ldr	w1, [sp, #4]
	ldr	w2, [sp]
	mov	x0, x19
	bl	__ZN7sc_core12sc_port_baseC2EiNS_14sc_port_policyE
	adrp	x8, __ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	str	xzr, [x19, #64]
	add	x0, x19, #72
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	adrp	x8, l_.str.4@PAGE
	add	x0, x8, l_.str.4@PAGEOFF
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev ; -- Begin function _ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev
	.p2align	2
__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev: ; @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev
	mov	x0, x19
	mov	x1, #96                         ; =0x60
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	adrp	x8, l_.str.3@PAGE
	add	x0, x8, l_.str.3@PAGEOFF
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev ; -- Begin function _ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev
	.p2align	2
__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev: ; @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev
	mov	x0, x19
	mov	x1, #96                         ; =0x60
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	str	xzr, [x19]
	str	xzr, [x19, #8]
	str	xzr, [x19, #16]
	mov	x0, x19
	bl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	adrp	x8, __ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	add	x0, x19, #72
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev
	mov	x0, x19
	bl	__ZN7sc_core12sc_port_baseD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
Ltmp70:
	mov	x0, sp
	mov	x1, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_
Ltmp71:
	b	LBB59_1
LBB59_1:
Ltmp72:
	mov	x0, sp
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev
Ltmp73:
	b	LBB59_2
LBB59_2:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB59_3:
Ltmp74:
                                        ; kill: killed $x1
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	str	x0, [sp, #8]
	ldr	x21, [sp, #8]
	ldr	x8, [x21]
	ldr	x8, [x8]
	cbz	x8, LBB61_2
; %bb.1:
	ldr	x0, [x21]
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev
	ldr	x0, [x21]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev
	ldr	x19, [x21]
	ldr	x8, [x21]
	ldr	x20, [x8]
	ldr	x0, [x21]
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev
	mov	x2, x0
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m
LBB61_2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	str	x0, [sp]
	ldr	x1, [x19]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	ldr	x8, [sp, #8]
	ldr	x9, [x8, #16]
	ldr	x8, [x8]
	sub	x8, x9, x8
	asr	x0, x8, #3
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
	ldr	x8, [sp, #8]
	ldr	x9, [x8, #8]
	ldr	x8, [x8]
	sub	x8, x9, x8
	asr	x0, x8, #3
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x19, [sp, #24]
	ldr	x8, [x19, #8]
	str	x8, [sp, #8]
LBB68_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #8]
	cmp	x8, x9
	b.eq	LBB68_4
; %bb.2:                                ;   in Loop: Header=BB68_1 Depth=1
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	str	x0, [sp, #8]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
Ltmp79:
	mov	x0, x19
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_
Ltmp80:
	b	LBB68_3
LBB68_3:                                ;   in Loop: Header=BB68_1 Depth=1
	b	LBB68_1
LBB68_4:
	ldr	x8, [sp, #16]
	str	x8, [x19, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB68_5:
Ltmp81:
                                        ; kill: killed $x1
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
; %bb.1:
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
	cmp	x8, #16
	cset	w8, hi
	and	w0, w8, #0x1
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp]
	ldr	x19, [sp]
	str	x19, [sp, #8]
	adrp	x8, __ZTVN7sc_core8sc_inoutIiEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core8sc_inoutIiEE@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	ldr	x0, [x19, #112]
	cbz	x0, LBB79_2
; %bb.1:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB79_2:
	ldr	x0, [x19, #96]
	cbz	x0, LBB79_4
; %bb.3:
	mov	x1, #4                          ; =0x4
	bl	__ZdlPvm
LBB79_4:
Ltmp86:
	mov	x0, x19
	bl	__ZNK7sc_core8sc_inoutIiE13remove_tracesEv
Ltmp87:
	b	LBB79_5
LBB79_5:
	mov	x0, x19
	bl	__ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB79_6:
Ltmp88:
                                        ; kill: killed $x1
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x20, [sp, #8]
	ldr	x8, [x20, #104]
	cbz	x8, LBB80_10
; %bb.1:
	ldr	x0, [x20, #104]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	sub	w8, w0, #1
	str	w8, [sp, #4]
LBB80_2:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	tbnz	w8, #31, LBB80_7
; %bb.3:                                ;   in Loop: Header=BB80_2 Depth=1
	ldr	x0, [x20, #104]
	ldrsw	x1, [sp, #4]
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em
	ldr	x19, [x0]
	cbz	x19, LBB80_5
; %bb.4:                                ;   in Loop: Header=BB80_2 Depth=1
	mov	x0, x19
	bl	__ZN7sc_core15sc_trace_paramsD1Ev
	mov	x0, x19
	mov	x1, #32                         ; =0x20
	bl	__ZdlPvm
LBB80_5:                                ;   in Loop: Header=BB80_2 Depth=1
	b	LBB80_6
LBB80_6:                                ;   in Loop: Header=BB80_2 Depth=1
	ldr	w8, [sp, #4]
	sub	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB80_2
LBB80_7:
	ldr	x19, [x20, #104]
	cbz	x19, LBB80_9
; %bb.8:
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev
	mov	x0, x19
	mov	x1, #24                         ; =0x18
	bl	__ZdlPvm
LBB80_9:
	str	xzr, [x20, #104]
LBB80_10:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	ldr	x8, [sp, #8]
	ldr	x9, [x8, #8]
	ldr	x8, [x8]
	sub	x8, x9, x8
	asr	x0, x8, #3
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
	mov	x10, #8                         ; =0x8
	madd	x0, x9, x10, x8
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core15sc_trace_paramsD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core15sc_trace_paramsD2Ev ; -- Begin function _ZN7sc_core15sc_trace_paramsD2Ev
	.weak_def_can_be_hidden	__ZN7sc_core15sc_trace_paramsD2Ev
	.p2align	2
__ZN7sc_core15sc_trace_paramsD2Ev:      ; @_ZN7sc_core15sc_trace_paramsD2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	add	x0, x19, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
Ltmp91:
	mov	x0, sp
	mov	x1, x19
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_
Ltmp92:
	b	LBB86_1
LBB86_1:
Ltmp93:
	mov	x0, sp
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev
Ltmp94:
	b	LBB86_2
LBB86_2:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB86_3:
Ltmp95:
                                        ; kill: killed $x1
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	sub	sp, sp, #64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	str	x0, [sp, #8]
	ldr	x21, [sp, #8]
	ldr	x8, [x21]
	ldr	x8, [x8]
	cbz	x8, LBB88_2
; %bb.1:
	ldr	x0, [x21]
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev
	ldr	x0, [x21]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev
	ldr	x19, [x21]
	ldr	x8, [x21]
	ldr	x20, [x8]
	ldr	x0, [x21]
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev
	mov	x2, x0
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m
LBB88_2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev
	str	x0, [sp]
	ldr	x1, [x19]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	ldr	x8, [sp, #8]
	ldr	x9, [x8, #16]
	ldr	x8, [x8]
	sub	x8, x9, x8
	asr	x0, x8, #3
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x19, [sp, #24]
	ldr	x8, [x19, #8]
	str	x8, [sp, #8]
LBB94_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #8]
	cmp	x8, x9
	b.eq	LBB94_4
; %bb.2:                                ;   in Loop: Header=BB94_1 Depth=1
	ldr	x8, [sp, #8]
	subs	x0, x8, #8
	str	x0, [sp, #8]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_
	mov	x1, x0
Ltmp99:
	mov	x0, x19
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_
Ltmp100:
	b	LBB94_3
LBB94_3:                                ;   in Loop: Header=BB94_1 Depth=1
	b	LBB94_1
LBB94_4:
	ldr	x8, [sp, #16]
	str	x8, [x19, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB94_5:
Ltmp101:
                                        ; kill: killed $x1
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
; %bb.1:
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNSt3__110type_indexC2B8ne200100ERKSt9type_info
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	mov	x10, #8                         ; =0x8
	madd	x0, x9, x10, x8
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x19, [sp, #24]
	ldr	x8, [x19, #8]
	str	x8, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x19, #16]
	cmp	x8, x9
	b.hs	LBB108_2
; %bb.1:
	ldr	x1, [sp, #16]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_
	ldr	x8, [sp, #8]
	add	x8, x8, #8
	str	x8, [sp, #8]
	b	LBB108_3
LBB108_2:
	ldr	x1, [sp, #16]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_
	str	x0, [sp, #8]
LBB108_3:
	ldr	x8, [sp, #8]
	str	x8, [x19, #8]
	ldr	x8, [sp, #8]
	sub	x0, x8, #8
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	sub	sp, sp, #96
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-24]
	stur	x1, [x29, #-32]
	ldur	x19, [x29, #-24]
	add	x0, sp, #24
	mov	x1, x19
	mov	w2, #1                          ; =0x1
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m
	ldr	x0, [sp, #32]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
	ldur	x2, [x29, #-32]
Ltmp107:
	mov	x0, x19
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_
Ltmp108:
	b	LBB109_1
LBB109_1:
	ldr	x8, [sp, #32]
	add	x8, x8, #8
	str	x8, [sp, #32]
	add	x0, sp, #24
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB109_2:
Ltmp109:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	add	x0, sp, #24
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev
; %bb.3:
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
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-24]
	stur	x1, [x29, #-32]
	ldur	x19, [x29, #-24]
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	add	x1, x0, #1
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em
	mov	x20, x0
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	mov	x2, x0
	add	x0, sp, #24
	mov	x1, x20
	mov	x3, x19
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_
	ldr	x0, [sp, #40]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
	ldur	x2, [x29, #-32]
Ltmp110:
	mov	x0, x19
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_
Ltmp111:
	b	LBB110_1
LBB110_1:
	ldr	x8, [sp, #40]
	add	x8, x8, #8
	str	x8, [sp, #40]
Ltmp112:
	mov	x0, x19
	add	x1, sp, #24
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE
Ltmp113:
	b	LBB110_2
LBB110_2:
	ldr	x19, [x19, #8]
	add	x0, sp, #24
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB110_3:
Ltmp114:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	add	x0, sp, #24
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev
; %bb.4:
	ldr	x0, [sp, #16]
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	ldr	x19, [sp, #24]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	mov	x10, #8                         ; =0x8
	madd	x8, x9, x10, x8
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
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #8]
	ldr	x9, [x9]
	str	x9, [x8]
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
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #32]
	str	x1, [sp, #24]
	ldr	x19, [sp, #32]
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev
	str	x0, [sp, #16]
	ldr	x8, [sp, #24]
	ldr	x9, [sp, #16]
	cmp	x8, x9
	b.ls	LBB117_2
; %bb.1:
	bl	__ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev
LBB117_2:
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #16]
	mov	x10, #1                         ; =0x1
	lsr	x9, x9, x10
	cmp	x8, x9
	b.lo	LBB117_4
; %bb.3:
	ldr	x8, [sp, #16]
	stur	x8, [x29, #-24]
	b	LBB117_5
LBB117_4:
	ldr	x8, [sp, #8]
	lsl	x8, x8, #1
	str	x8, [sp]
	mov	x0, sp
	add	x1, sp, #24
	bl	__ZNSt3__13maxB8ne200100ImEERKT_S3_S3_
	ldr	x8, [x0]
	stur	x8, [x29, #-24]
LBB117_5:
	ldur	x0, [x29, #-24]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
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
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	str	x3, [sp]
	ldr	x19, [sp, #24]
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
	ldr	x3, [sp]
	mov	x0, x19
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
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
	sub	sp, sp, #80
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x19, [sp, #24]
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #8]
	ldr	x9, [x19, #8]
	ldr	x10, [x19]
	sub	x9, x9, x10
	asr	x9, x9, #3
	neg	x9, x9
	mov	x10, #8                         ; =0x8
	madd	x8, x9, x10, x8
	str	x8, [sp, #8]
	ldr	x0, [x19]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x20, x0
	ldr	x0, [x19, #8]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x21, x0
	ldr	x0, [sp, #8]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x3, x0
	mov	x0, x19
	mov	x1, x20
	mov	x2, x21
	bl	__ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #16]
	str	x8, [x9, #8]
	ldr	x8, [x19]
	str	x8, [x19, #8]
	ldr	x8, [sp, #16]
	add	x1, x8, #8
	mov	x0, x19
	bl	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	add	x0, x19, #8
	ldr	x8, [sp, #16]
	add	x1, x8, #16
	bl	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	add	x0, x19, #16
	ldr	x8, [sp, #16]
	add	x1, x8, #24
	bl	__ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #8]
	ldr	x9, [sp, #16]
	str	x8, [x9]
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev
	mov	x1, x0
	mov	x0, x19
	bl	__ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #80
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldur	x0, [x29, #-8]
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_
	str	x0, [sp, #16]
	bl	__ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev
	str	x0, [sp, #8]
Ltmp118:
	add	x0, sp, #16
	add	x1, sp, #8
	bl	__ZNSt3__13minB8ne200100ImEERKT_S3_S3_
Ltmp119:
	b	LBB121_1
LBB121_1:
	ldr	x0, [x0]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB121_2:
Ltmp120:
                                        ; kill: killed $x1
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
	adrp	x8, l_.str.10@PAGE
	add	x0, x8, l_.str.10@PAGEOFF
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
; %bb.1:
	ldr	x0, [sp, #8]
	b	LBB127_3
LBB127_2:
	ldr	x0, [sp, #16]
LBB127_3:
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
	cmp	x8, x9
	cset	w8, lo
	and	w0, w8, #0x1
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	mov	w0, #16                         ; =0x10
	bl	___cxa_allocate_exception
	mov	x19, x0
	ldr	x1, [sp, #24]
Ltmp123:
	mov	x0, x19
	bl	__ZNSt12length_errorC1B8ne200100EPKc
Ltmp124:
	b	LBB131_1
LBB131_1:
	adrp	x8, __ZTISt12length_error@GOTPAGE
	ldr	x1, [x8, __ZTISt12length_error@GOTPAGEOFF]
	adrp	x8, __ZNSt12length_errorD1Ev@GOTPAGE
	ldr	x2, [x8, __ZNSt12length_errorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
LBB131_2:
Ltmp125:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	mov	x0, x19
	bl	___cxa_free_exception
; %bb.3:
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNSt12length_errorC2B8ne200100EPKc
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNSt11logic_errorC2EPKc
	adrp	x8, __ZTVSt12length_error@GOTPAGE
	ldr	x8, [x8, __ZTVSt12length_error@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
; %bb.1:
	ldr	x0, [sp, #8]
	b	LBB134_3
LBB134_2:
	ldr	x0, [sp, #16]
LBB134_3:
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
	sub	sp, sp, #96
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-32]
	str	x1, [sp, #40]
	str	x2, [sp, #32]
	str	x3, [sp, #24]
	ldur	x19, [x29, #-32]
	stur	x19, [x29, #-24]
	str	xzr, [x19, #24]
	ldr	x8, [sp, #24]
	str	x8, [x19, #32]
	ldr	x8, [sp, #40]
	cbnz	x8, LBB135_2
; %bb.1:
	str	xzr, [x19]
	b	LBB135_3
LBB135_2:
	ldr	x0, [x19, #32]
	ldr	x1, [sp, #40]
	bl	__ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m
	str	x1, [sp, #16]
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	str	x8, [x19]
	ldr	x8, [sp, #16]
	str	x8, [sp, #40]
LBB135_3:
	ldr	x8, [x19]
	ldr	x9, [sp, #32]
	mov	x10, #8                         ; =0x8
	madd	x8, x9, x10, x8
	str	x8, [x19, #16]
	str	x8, [x19, #8]
	ldr	x8, [x19]
	ldr	x9, [sp, #40]
	mov	x10, #8                         ; =0x8
	madd	x8, x9, x10, x8
	str	x8, [x19, #24]
	ldur	x0, [x29, #-24]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #96
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x19, [sp]
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_
	cmp	x19, x0
	b.ls	LBB137_2
; %bb.1:
	bl	__ZSt28__throw_bad_array_new_lengthB8ne200100v
LBB137_2:
	ldr	x0, [sp]
	mov	x1, #8                          ; =0x8
	bl	__ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x0, #8                          ; =0x8
	bl	___cxa_allocate_exception
	mov	x19, x0
	mov	x0, x19
	bl	__ZNSt20bad_array_new_lengthC1Ev
	adrp	x8, __ZTISt20bad_array_new_length@GOTPAGE
	ldr	x1, [x8, __ZTISt20bad_array_new_length@GOTPAGEOFF]
	adrp	x8, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGE
	ldr	x2, [x8, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGEOFF]
	mov	x0, x19
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
; %bb.1:
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
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x2, [sp, #8]
	str	x3, [sp]
	ldr	x0, [sp]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x19, x0
	ldr	x0, [sp, #16]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
	ldr	x8, [sp, #8]
	ldr	x9, [sp, #16]
	sub	x8, x8, x9
	asr	x8, x8, #3
	lsl	x2, x8, #3
	mov	x0, x19
	bl	_memcpy
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
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
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	str	x0, [sp]
	ldr	x20, [sp]
	str	x20, [sp, #8]
	mov	x0, x20
	bl	__ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev
	ldr	x8, [x20]
	cbz	x8, LBB145_3
; %bb.1:
	ldr	x19, [x20, #32]
	ldr	x21, [x20]
Ltmp128:
	mov	x0, x20
	bl	__ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev
	mov	x2, x0
Ltmp129:
	b	LBB145_2
LBB145_2:
	mov	x0, x19
	mov	x1, x21
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m
LBB145_3:
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB145_4:
Ltmp130:
                                        ; kill: killed $x1
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
	ldr	x8, [sp, #8]
	ldr	x9, [x8, #24]
	ldr	x8, [x8]
	sub	x8, x9, x8
	asr	x0, x8, #3
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
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x20, [sp, #16]
LBB149_1:                               ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #8]
	ldr	x9, [x20, #16]
	cmp	x8, x9
	b.eq	LBB149_4
; %bb.2:                                ;   in Loop: Header=BB149_1 Depth=1
	ldr	x19, [x20, #32]
	ldr	x8, [x20, #16]
	subs	x0, x8, #8
	str	x0, [x20, #16]
	bl	__ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_
	mov	x1, x0
Ltmp132:
	mov	x0, x19
	bl	__ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_
Ltmp133:
	b	LBB149_3
LBB149_3:                               ;   in Loop: Header=BB149_1 Depth=1
	b	LBB149_1
LBB149_4:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB149_5:
Ltmp134:
                                        ; kill: killed $x1
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
	add	x8, x0, #8
	ldr	x1, [sp]
	ldr	x9, [x0, #8]
	ldr	x9, [x9, #32]
	mov	x0, x8
	blr	x9
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
	ldr	x0, [sp, #8]
	ldr	x8, [x0, #64]
	cbnz	x8, LBB151_2
; %bb.1:
	adrp	x8, __ZN7sc_core13SC_ID_GET_IF_E@GOTPAGE
	ldr	x1, [x8, __ZN7sc_core13SC_ID_GET_IF_E@GOTPAGEOFF]
	adrp	x8, l_.str.11@PAGE
	add	x2, x8, l_.str.11@PAGEOFF
	bl	__ZNK7sc_core12sc_port_base12report_errorEPKcS2_
	bl	__ZN7sc_core8sc_abortEv
LBB151_2:
	ldr	x0, [x0, #64]
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
	mov	x10, #8                         ; =0x8
	madd	x0, x9, x10, x8
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x20, [sp]
	ldr	x0, [sp]
	bl	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	mov	x2, x0
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
	mov	w8, #10                         ; =0xa
	sxtb	w1, w8
	bl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec
	mov	x8, x0
	mov	x0, x19
	sxtb	w1, w8
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	ldr	x0, [sp, #8]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	ldr	x0, [sp, #8]
	ldr	x8, [x0, #64]
	cbnz	x8, LBB158_2
; %bb.1:
	adrp	x8, __ZN7sc_core13SC_ID_GET_IF_E@GOTPAGE
	ldr	x1, [x8, __ZN7sc_core13SC_ID_GET_IF_E@GOTPAGEOFF]
	adrp	x8, l_.str.11@PAGE
	add	x2, x8, l_.str.11@PAGEOFF
	bl	__ZNK7sc_core12sc_port_base12report_errorEPKcS2_
	bl	__ZN7sc_core8sc_abortEv
LBB158_2:
	ldr	x0, [x0, #64]
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
	sub	sp, sp, #128
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	stur	x0, [x29, #-40]
	stur	x1, [x29, #-48]
	str	x2, [sp, #56]
	ldur	x1, [x29, #-40]
Ltmp136:
	add	x0, sp, #40
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp137:
	b	LBB159_1
LBB159_1:
Ltmp139:
	add	x0, sp, #40
	bl	__ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev
Ltmp140:
	b	LBB159_2
LBB159_2:
	tbz	w0, #0, LBB159_18
	b	LBB159_3
LBB159_3:
	ldur	x1, [x29, #-40]
	add	x0, sp, #8
	bl	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE
	ldur	x19, [x29, #-48]
	ldur	x8, [x29, #-40]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
Ltmp141:
	bl	__ZNKSt3__18ios_base5flagsB8ne200100Ev
Ltmp142:
	b	LBB159_4
LBB159_4:
	mov	w8, #176                        ; =0xb0
	and	w8, w0, w8
	cmp	w8, #32
	b.ne	LBB159_6
; %bb.5:
	ldur	x8, [x29, #-48]
	ldr	x9, [sp, #56]
	add	x20, x8, x9
	b	LBB159_7
LBB159_6:
	ldur	x20, [x29, #-48]
LBB159_7:
	ldur	x8, [x29, #-48]
	ldr	x9, [sp, #56]
	add	x21, x8, x9
	ldur	x8, [x29, #-40]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x22, x8, x9
Ltmp143:
	mov	x0, x22
	bl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev
Ltmp144:
	b	LBB159_8
LBB159_8:
	ldr	x8, [sp, #8]
Ltmp145:
	sxtb	w5, w0
	mov	x0, x8
	mov	x1, x19
	mov	x2, x20
	mov	x3, x21
	mov	x4, x22
	bl	__ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp146:
	b	LBB159_9
LBB159_9:
	str	x0, [sp, #16]
	add	x0, sp, #16
	bl	__ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev
	tbz	w0, #0, LBB159_17
; %bb.10:
	ldur	x8, [x29, #-40]
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
	str	x0, [sp, #32]
	str	w1, [sp, #28]
	b	LBB159_14
LBB159_13:
Ltmp149:
	str	x0, [sp, #32]
	str	w1, [sp, #28]
	add	x0, sp, #40
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB159_14:
	ldr	x0, [sp, #32]
	bl	___cxa_begin_catch
	ldur	x8, [x29, #-40]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
Ltmp150:
	bl	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp151:
	b	LBB159_15
LBB159_15:
	bl	___cxa_end_catch
LBB159_16:
	ldur	x0, [x29, #-40]
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
LBB159_17:
	b	LBB159_18
LBB159_18:
	add	x0, sp, #40
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	b	LBB159_16
LBB159_19:
Ltmp152:
	str	x0, [sp, #32]
	str	w1, [sp, #28]
Ltmp153:
	bl	___cxa_end_catch
Ltmp154:
	b	LBB159_20
LBB159_20:
	b	LBB159_21
LBB159_21:
	ldr	x0, [sp, #32]
	bl	__Unwind_Resume
LBB159_22:
Ltmp155:
                                        ; kill: killed $x1
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
	stp	x20, x19, [sp, #128]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #144]            ; 16-byte Folded Spill
	add	x29, sp, #144
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-32]
	stur	x1, [x29, #-40]
	stur	x2, [x29, #-48]
	stur	x3, [x29, #-56]
	stur	x4, [x29, #-64]
	sturb	w5, [x29, #-65]
	ldur	x8, [x29, #-32]
	cbnz	x8, LBB162_2
; %bb.1:
	ldur	x8, [x29, #-32]
	stur	x8, [x29, #-24]
	b	LBB162_23
LBB162_2:
	ldur	x8, [x29, #-56]
	ldur	x9, [x29, #-40]
	sub	x8, x8, x9
	str	x8, [sp, #64]
	ldur	x0, [x29, #-64]
	bl	__ZNKSt3__18ios_base5widthB8ne200100Ev
	str	x0, [sp, #56]
	ldr	x8, [sp, #56]
	ldr	x9, [sp, #64]
	cmp	x8, x9
	b.le	LBB162_4
; %bb.3:
	ldr	x8, [sp, #64]
	ldr	x9, [sp, #56]
	sub	x8, x9, x8
	str	x8, [sp, #56]
	b	LBB162_5
LBB162_4:
	str	xzr, [sp, #56]
LBB162_5:
	ldur	x8, [x29, #-48]
	ldur	x9, [x29, #-40]
	sub	x8, x8, x9
	str	x8, [sp, #48]
	ldr	x8, [sp, #48]
	cmp	x8, #0
	b.le	LBB162_9
; %bb.6:
	ldur	x0, [x29, #-32]
	ldur	x1, [x29, #-40]
	ldr	x2, [sp, #48]
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	ldr	x8, [sp, #48]
	cmp	x0, x8
	b.eq	LBB162_8
; %bb.7:
	stur	xzr, [x29, #-32]
	ldur	x8, [x29, #-32]
	stur	x8, [x29, #-24]
	b	LBB162_23
LBB162_8:
	b	LBB162_9
LBB162_9:
	ldr	x8, [sp, #56]
	cmp	x8, #0
	b.le	LBB162_18
; %bb.10:
	ldr	x1, [sp, #56]
	ldursb	w2, [x29, #-65]
	add	x0, sp, #24
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc
	ldur	x19, [x29, #-32]
	add	x0, sp, #24
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev
	mov	x1, x0
	ldr	x2, [sp, #56]
Ltmp157:
	mov	x0, x19
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
Ltmp158:
	b	LBB162_11
LBB162_11:
	ldr	x8, [sp, #56]
	cmp	x0, x8
	b.eq	LBB162_14
; %bb.12:
	stur	xzr, [x29, #-32]
	ldur	x8, [x29, #-32]
	stur	x8, [x29, #-24]
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #8]
	b	LBB162_15
LBB162_13:
Ltmp159:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	add	x0, sp, #24
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	b	LBB162_24
LBB162_14:
	str	wzr, [sp, #8]
LBB162_15:
	add	x0, sp, #24
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	ldr	w8, [sp, #8]
	cbz	w8, LBB162_17
	b	LBB162_16
LBB162_16:
	b	LBB162_23
LBB162_17:
	b	LBB162_18
LBB162_18:
	ldur	x8, [x29, #-56]
	ldur	x9, [x29, #-48]
	sub	x8, x8, x9
	str	x8, [sp, #48]
	ldr	x8, [sp, #48]
	cmp	x8, #0
	b.le	LBB162_22
; %bb.19:
	ldur	x0, [x29, #-32]
	ldur	x1, [x29, #-48]
	ldr	x2, [sp, #48]
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl
	ldr	x8, [sp, #48]
	cmp	x0, x8
	b.eq	LBB162_21
; %bb.20:
	stur	xzr, [x29, #-32]
	ldur	x8, [x29, #-32]
	stur	x8, [x29, #-24]
	b	LBB162_23
LBB162_21:
	b	LBB162_22
LBB162_22:
	ldur	x0, [x29, #-64]
	mov	x1, #0                          ; =0x0
	bl	__ZNSt3__18ios_base5widthB8ne200100El
	ldur	x8, [x29, #-32]
	stur	x8, [x29, #-24]
LBB162_23:
	ldur	x0, [x29, #-24]
	ldp	x29, x30, [sp, #144]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]            ; 16-byte Folded Reload
	add	sp, sp, #160
	ret
LBB162_24:
	ldr	x0, [sp, #16]
	bl	__Unwind_Resume
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	add	x0, x19, #144
	bl	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev
	tbnz	w0, #0, LBB165_2
; %bb.1:
	mov	w8, #32                         ; =0x20
	mov	x0, x19
	sxtb	w1, w8
	bl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec
	sxtb	w1, w0
	add	x0, x19, #144
	bl	__ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei
LBB165_2:
	add	x0, x19, #144
	bl	__ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev
	sxtb	w0, w0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	cmp	x8, #0
	cset	w8, eq
	and	w0, w8, #0x1
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	strb	w2, [sp, #15]
	ldr	x19, [sp, #24]
	ldr	x1, [sp, #16]
	ldrb	w8, [sp, #15]
	mov	x0, x19
	sxtb	w2, w8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	ldr	x8, [sp, #24]
	ldr	x9, [x8, #24]
	str	x9, [sp, #8]
	ldr	x9, [sp, #16]
	str	x9, [x8, #24]
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	strb	w2, [sp, #15]
	ldr	x19, [sp, #24]
	mov	x0, x19
	bl	__ZNSt3__19allocatorIcEC1B8ne200100Ev
	ldr	x1, [sp, #16]
	ldrb	w8, [sp, #15]
	mov	x0, x19
	sxtb	w2, w8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__19allocatorIcEC2B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	tbz	w0, #0, LBB178_2
; %bb.1:
	mov	x0, x19
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	b	LBB178_3
LBB178_2:
	mov	x0, x19
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
LBB178_3:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	ubfx	w8, w8, #7, #1
	sxtb	w8, w8
	cmp	w8, #0
	cset	w8, ne
	and	w0, w8, #0x1
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x8, [sp]
	ldr	x9, [x8]
	ldur	x9, [x9, #-24]
	add	x0, x8, x9
Ltmp169:
	bl	__ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev
Ltmp170:
	b	LBB183_1
LBB183_1:
	str	x0, [x19]
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB183_2:
Ltmp171:
                                        ; kill: killed $x1
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldr	w19, [x8]
	bl	__ZNSt3__111char_traitsIcE3eofB8ne200100Ev
	cmp	w19, w0
	cset	w8, ne
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-24]
	sturb	w1, [x29, #-25]
	ldur	x0, [x29, #-24]
	add	x8, sp, #24
	bl	__ZNKSt3__18ios_base6getlocEv
Ltmp173:
	add	x0, sp, #24
	bl	__ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE
Ltmp174:
	b	LBB187_1
LBB187_1:
	ldursb	w1, [x29, #-25]
Ltmp175:
	bl	__ZNKSt3__15ctypeIcE5widenB8ne200100Ec
	mov	x19, x0
Ltmp176:
	b	LBB187_2
LBB187_2:
	add	x0, sp, #24
	bl	__ZNSt3__16localeD1Ev
	sxtb	w0, w19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB187_3:
Ltmp177:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	add	x0, sp, #24
	bl	__ZNSt3__16localeD1Ev
; %bb.4:
	ldr	x0, [sp, #16]
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
	adrp	x8, __ZNSt3__15ctypeIcE2idE@GOTPAGE
	ldr	x1, [x8, __ZNSt3__15ctypeIcE2idE@GOTPAGEOFF]
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
	ldrb	w8, [sp, #7]
	ldr	x9, [x0]
	ldr	x9, [x9, #56]
	sxtb	w1, w8
	blr	x9
	sxtb	w0, w0
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
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x2, [x29, #-32]
	stur	x3, [x29, #-24]
	ldur	x8, [x29, #-32]
	ldur	x9, [x29, #-24]
	stur	x0, [x29, #-40]
	str	x1, [sp, #48]
	str	x9, [sp, #40]
	str	x8, [sp, #32]
	ldur	x8, [x29, #-40]
	ldr	x8, [x8]
	cbnz	x8, LBB195_4
; %bb.1:
	mov	w0, #32                         ; =0x20
	bl	__Znwm
	mov	x19, x0
	ldr	x1, [sp, #48]
	ldr	x8, [sp, #32]
	ldr	x9, [sp, #40]
	str	x9, [sp, #24]
	str	x8, [sp, #16]
	ldr	x3, [sp, #24]
	ldr	x2, [sp, #16]
Ltmp180:
	mov	x0, x19
	bl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
Ltmp181:
	b	LBB195_2
LBB195_2:
	ldur	x8, [x29, #-40]
	str	x19, [x8]
	b	LBB195_4
LBB195_3:
Ltmp182:
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	mov	x0, x19
	mov	x1, #32                         ; =0x20
	bl	__ZdlPvm
	b	LBB195_8
LBB195_4:
	ldr	x19, [sp, #48]
	ldur	x8, [x29, #-40]
	ldr	x0, [x8]
	bl	__ZNK7sc_core15sc_event_finder4portEv
	cmp	x19, x0
	b.ne	LBB195_6
; %bb.5:
	b	LBB195_7
LBB195_6:
	adrp	x8, l_.str.14@PAGE
	add	x0, x8, l_.str.14@PAGEOFF
	adrp	x8, l_.str.15@PAGE
	add	x1, x8, l_.str.15@PAGEOFF
	mov	w2, #139                        ; =0x8b
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB195_7:
	ldur	x8, [x29, #-40]
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB195_8:
	ldr	x0, [sp, #8]
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
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x2, [x29, #-16]
	stur	x3, [x29, #-8]
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-8]
	stur	x0, [x29, #-24]
	str	x1, [sp, #32]
	str	x9, [sp, #24]
	str	x8, [sp, #16]
	ldur	x0, [x29, #-24]
	ldr	x1, [sp, #32]
	ldr	x8, [sp, #16]
	ldr	x9, [sp, #24]
	str	x9, [sp, #8]
	str	x8, [sp]
	ldr	x3, [sp, #8]
	ldr	x2, [sp]
	bl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
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
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x2, [x29, #-16]
	stur	x3, [x29, #-8]
	ldur	x8, [x29, #-16]
	ldur	x9, [x29, #-8]
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	str	x9, [sp, #8]
	str	x8, [sp]
	ldr	x0, [sp, #24]
	ldr	x1, [sp, #16]
	bl	__ZN7sc_core15sc_event_finderC2ERKNS_12sc_port_baseE
	adrp	x8, __ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldr	x8, [sp]
	ldr	x9, [sp, #8]
	str	x9, [x0, #24]
	str	x8, [x0, #16]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev ; -- Begin function _ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	.p2align	2
__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev: ; @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev ; -- Begin function _ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev
	.p2align	2
__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev: ; @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev
	mov	x0, x19
	mov	x1, #32                         ; =0x20
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE ; -- Begin function _ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE
	.weak_def_can_be_hidden	__ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE
	.p2align	2
__ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE: ; @_ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x19, [sp, #16]
	ldr	x8, [sp, #8]
	cbz	x8, LBB201_5
; %bb.1:
	ldr	x0, [sp, #8]
	cbz	x0, LBB201_3
; %bb.2:
	adrp	x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x8, __ZTIN7sc_core15sc_signal_in_ifIbEE@PAGE
	add	x2, x8, __ZTIN7sc_core15sc_signal_in_ifIbEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	b	LBB201_4
LBB201_3:
	mov	x0, #0                          ; =0x0
	b	LBB201_4
LBB201_4:
	b	LBB201_9
LBB201_5:
	mov	x0, x19
	bl	__ZNK7sc_core15sc_event_finder4portEv
	ldr	x8, [x0]
	ldr	x8, [x8, #80]
	blr	x8
	cbz	x0, LBB201_7
; %bb.6:
	adrp	x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGE
	ldr	x1, [x8, __ZTIN7sc_core12sc_interfaceE@GOTPAGEOFF]
	adrp	x8, __ZTIN7sc_core15sc_signal_in_ifIbEE@PAGE
	add	x2, x8, __ZTIN7sc_core15sc_signal_in_ifIbEE@PAGEOFF
	mov	x3, #-1                         ; =0xffffffffffffffff
	bl	___dynamic_cast
	b	LBB201_8
LBB201_7:
	mov	x0, #0                          ; =0x0
	b	LBB201_8
LBB201_8:
LBB201_9:
	str	x0, [sp]
	ldr	x8, [sp]
	cbnz	x8, LBB201_11
; %bb.10:
	adrp	x8, __ZN7sc_core17SC_ID_FIND_EVENT_E@GOTPAGE
	ldr	x1, [x8, __ZN7sc_core17SC_ID_FIND_EVENT_E@GOTPAGEOFF]
	adrp	x8, l_.str.11@PAGE
	add	x2, x8, l_.str.11@PAGEOFF
	mov	x0, x19
	bl	__ZNK7sc_core15sc_event_finder12report_errorEPKcS2_
	bl	__ZN7sc_core8sc_event4noneEv
	str	x0, [sp, #24]
	b	LBB201_15
LBB201_11:
	ldr	x9, [sp]
	ldr	x10, [x19, #24]
	ldr	x8, [x19, #16]
	asr	x11, x10, #1
	add	x0, x9, x11
	tbz	w10, #0, LBB201_13
; %bb.12:
	ldr	x9, [x0]
                                        ; kill: def $w8 killed $w8 killed $x8 def $x8
	ubfx	x8, x8, #0, #32
	add	x8, x9, x8
	ldr	x8, [x8]
	b	LBB201_14
LBB201_13:
LBB201_14:
	blr	x8
	str	x0, [sp, #24]
LBB201_15:
	ldr	x0, [sp, #24]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev ; -- Begin function _ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev
	.p2align	2
__ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev: ; @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core15sc_event_finderD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	adrp	x8, __ZN7sc_core18sc_curr_simcontextE@GOTPAGE
	ldr	x8, [x8, __ZN7sc_core18sc_curr_simcontextE@GOTPAGEOFF]
	ldr	x8, [x8]
	cbnz	x8, LBB204_4
; %bb.1:
	mov	w0, #456                        ; =0x1c8
	bl	__Znwm
	mov	x19, x0
Ltmp184:
	mov	x0, x19
	bl	__ZN7sc_core13sc_simcontextC1Ev
Ltmp185:
	b	LBB204_2
LBB204_2:
	adrp	x8, __ZN7sc_core25sc_default_global_contextE@GOTPAGE
	ldr	x8, [x8, __ZN7sc_core25sc_default_global_contextE@GOTPAGEOFF]
	str	x19, [x8]
	adrp	x8, __ZN7sc_core25sc_default_global_contextE@GOTPAGE
	ldr	x8, [x8, __ZN7sc_core25sc_default_global_contextE@GOTPAGEOFF]
	ldr	x8, [x8]
	adrp	x9, __ZN7sc_core18sc_curr_simcontextE@GOTPAGE
	ldr	x9, [x9, __ZN7sc_core18sc_curr_simcontextE@GOTPAGEOFF]
	str	x8, [x9]
	b	LBB204_4
LBB204_3:
Ltmp186:
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	mov	x0, x19
	mov	x1, #456                        ; =0x1c8
	bl	__ZdlPvm
	b	LBB204_5
LBB204_4:
	adrp	x8, __ZN7sc_core18sc_curr_simcontextE@GOTPAGE
	ldr	x8, [x8, __ZN7sc_core18sc_curr_simcontextE@GOTPAGEOFF]
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB204_5:
	ldr	x0, [sp, #8]
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core8sc_inoutIiED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp]
	ldr	x19, [sp]
	str	x19, [sp, #8]
	adrp	x8, __ZTVN7sc_core5sc_inIbEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core5sc_inIbEE@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x19]
Ltmp187:
	mov	x0, x19
	bl	__ZNK7sc_core5sc_inIbE13remove_tracesEv
Ltmp188:
	b	LBB206_1
LBB206_1:
	ldr	x0, [x19, #104]
	cbz	x0, LBB206_3
; %bb.2:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB206_3:
	ldr	x0, [x19, #112]
	cbz	x0, LBB206_5
; %bb.4:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB206_5:
	ldr	x0, [x19, #120]
	cbz	x0, LBB206_7
; %bb.6:
	ldr	x8, [x0]
	ldr	x8, [x8, #8]
	blr	x8
LBB206_7:
	mov	x0, x19
	bl	__ZN7sc_core7sc_portINS_15sc_signal_in_ifIbEELi1ELNS_14sc_port_policyE0EED2Ev
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
LBB206_8:
Ltmp189:
                                        ; kill: killed $x1
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	adrp	x8, __ZTV14simple_counter@GOTPAGE
	ldr	x8, [x8, __ZTV14simple_counter@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	adrp	x8, __ZTV14simple_counter@GOTPAGE
	ldr	x8, [x8, __ZTV14simple_counter@GOTPAGEOFF]
	mov	x9, #168                        ; =0xa8
	add	x8, x8, x9
	str	x8, [x19, #112]
	add	x0, x19, #488
	bl	__ZN7sc_core6sc_outIiED1Ev
	add	x0, x19, #360
	bl	__ZN7sc_core5sc_inIbED1Ev
	add	x0, x19, #232
	bl	__ZN7sc_core5sc_inIbED1Ev
	mov	x0, x19
	bl	__ZN7sc_core9sc_moduleD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	str	x8, [sp, #8]
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	ldr	x8, [x19]
	ldr	x8, [x8, #72]
	mov	x0, x19
	blr	x8
	mov	w8, #0                          ; =0x0
	tbz	w0, #0, LBB220_2
; %bb.1:
	ldrb	w8, [x19, #128]
LBB220_2:
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	ldr	x8, [x19]
	ldr	x8, [x8, #72]
	mov	x0, x19
	blr	x8
	mov	w8, #0                          ; =0x0
	tbz	w0, #0, LBB221_2
; %bb.1:
	ldrb	w8, [x19, #128]
	eor	w8, w8, #0x1
LBB221_2:
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	and	w0, wzr, #0x1
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
	str	x8, [sp, #8]
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
	str	x8, [sp, #8]
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
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-24]
	str	x1, [sp, #32]
	str	x2, [sp, #24]
	str	x3, [sp, #16]
	ldur	x19, [x29, #-24]
	ldr	x20, [sp, #32]
	add	x1, x20, #8
	mov	x0, x19
	bl	__ZN7sc_core18sc_signal_inout_ifIiEC2Ev
	add	x0, x19, #16
	ldr	x1, [sp, #24]
Ltmp207:
	bl	__ZN7sc_core17sc_signal_channelC2EPKc
Ltmp208:
	b	LBB227_1
LBB227_1:
	add	x0, x19, #104
Ltmp210:
	bl	__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev
Ltmp211:
	b	LBB227_2
LBB227_2:
	ldr	x8, [x20]
	str	x8, [x19]
	ldr	x8, [x20, #64]
	ldr	x9, [x19]
	ldur	x9, [x9, #-48]
	add	x9, x19, x9
	str	x8, [x9]
	ldr	x8, [x20, #72]
	str	x8, [x19, #8]
	adrp	x8, __ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x9, #280                        ; =0x118
	add	x8, x8, x9
	str	x8, [x19, #16]
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	str	w8, [x19, #128]
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	str	w8, [x19, #132]
	mov	x0, x19
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
LBB227_3:
Ltmp209:
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	b	LBB227_5
LBB227_4:
Ltmp212:
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	add	x0, x19, #16
	bl	__ZN7sc_core17sc_signal_channelD2Ev
LBB227_5:
	add	x1, x20, #8
	mov	x0, x19
	bl	__ZN7sc_core18sc_signal_inout_ifIiED2Ev
; %bb.6:
	ldr	x0, [sp, #8]
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
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	stur	x0, [x29, #-24]
	stur	x1, [x29, #-32]
	str	x2, [sp, #40]
	ldur	x20, [x29, #-24]
	ldr	x1, [sp, #40]
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc
	adrp	x8, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGE
	add	x0, x8, __ZTIN7sc_core18sc_signal_inout_ifIiEE@PAGEOFF
	bl	__ZNKSt9type_info4nameB8ne200100Ev
	mov	x1, x0
	add	x0, sp, #8
	bl	__ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_
	mov	x19, x0
	add	x0, sp, #8
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev
	and	w8, w19, #0x1
	strb	w8, [sp, #39]
	add	x0, x20, #104
	add	x1, x20, #16
	ldur	x2, [x29, #-32]
	ldrb	w8, [sp, #39]
	and	w3, w8, #0x1
	bl	__ZN7sc_core27sc_writer_policy_check_port10check_portEPNS_9sc_objectEPNS_12sc_port_baseEb
	tbnz	w0, #0, LBB228_2
; %bb.1:
	b	LBB228_2
LBB228_2:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	adrp	x8, __ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE@GOTPAGE
	ldr	x1, [x8, __ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE@GOTPAGEOFF]
	mov	x0, x19
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev
	mov	x0, x19
	bl	__ZN7sc_core12sc_interfaceD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev
	mov	x0, x19
	mov	x1, #136                        ; =0x88
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	add	x0, x19, #16
	bl	__ZNK7sc_core17sc_signal_channel23deprecated_get_data_refEv
	add	x0, x19, #128
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	and	w0, w0, #0x1
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
	adrp	x8, l_.str.18@PAGE
	add	x0, x8, l_.str.18@PAGEOFF
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
	sub	sp, sp, #64
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x19, [sp, #24]
	ldr	w8, [x19, #132]
	ldr	x9, [sp, #16]
	ldr	w9, [x9]
	cmp	w8, w9
	cset	w8, eq
	eor	w8, w8, #0x1
	and	w8, w8, #0x1
	strb	w8, [sp, #15]
	add	x8, x19, #104
	add	x0, x8, #8
	add	x1, x19, #16
	ldrb	w8, [sp, #15]
	and	w2, w8, #0x1
	bl	__ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb
	tbnz	w0, #0, LBB238_2
; %bb.1:
	b	LBB238_5
LBB238_2:
	ldr	x8, [sp, #16]
	ldr	w8, [x8]
	str	w8, [x19, #132]
	ldrb	w8, [sp, #15]
	tbnz	w8, #0, LBB238_4
; %bb.3:
	add	x8, x19, #104
	add	x0, x8, #8
	bl	__ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv
	tbz	w0, #0, LBB238_5
LBB238_4:
	add	x0, x19, #16
	bl	__ZN7sc_core15sc_prim_channel14request_updateEv
LBB238_5:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
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
; %bb.1:
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x20, [sp, #8]
	ldr	x0, [sp]
	adrp	x8, l_.str.21@PAGE
	add	x1, x8, l_.str.21@PAGEOFF
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	mov	x19, x0
	add	x0, x20, #16
	bl	__ZNK7sc_core9sc_object4nameEv
	mov	x1, x0
	mov	x0, x19
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	adrp	x8, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGE
	add	x1, x8, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGEOFF
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	ldr	x0, [sp]
	adrp	x8, l_.str.22@PAGE
	add	x1, x8, l_.str.22@PAGEOFF
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	ldr	w1, [x20, #128]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	adrp	x8, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGE
	add	x1, x8, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGEOFF
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	ldr	x0, [sp]
	adrp	x8, l_.str.23@PAGE
	add	x1, x8, l_.str.23@PAGEOFF
	bl	__ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	ldr	w1, [x20, #132]
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	adrp	x8, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGE
	add	x1, x8, __ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_@PAGEOFF
	bl	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv ; -- Begin function _ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.weak_def_can_be_hidden	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.p2align	2
__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv: ; @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	add	x8, x19, #104
	add	x0, x8, #8
	bl	__ZN7sc_core28sc_writer_policy_check_write6updateEv
	ldr	w8, [x19, #132]
	ldr	w9, [x19, #128]
	cmp	w8, w9
	b.eq	LBB242_2
; %bb.1:
	mov	x0, x19
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv
LBB242_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	subs	x0, x8, #8
	ldr	x1, [sp]
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
	str	x8, [sp, #8]
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev
	mov	x0, x19
	mov	x1, #136                        ; =0x88
	bl	__ZdlPvm
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	subs	x0, x8, #16
	ldr	x1, [sp]
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
	subs	x0, x8, #16
	ldr	x1, [sp]
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
	subs	x0, x8, #16
	ldr	x1, [sp]
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
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #24]
	str	x1, [sp, #16]
	ldr	x19, [sp, #24]
	ldr	x20, [sp, #16]
	add	x1, x20, #8
	mov	x0, x19
	bl	__ZN7sc_core15sc_signal_in_ifIiEC2Ev
	add	x0, x19, #8
	add	x1, x20, #24
Ltmp240:
	bl	__ZN7sc_core18sc_signal_write_ifIiEC2Ev
Ltmp241:
	b	LBB268_1
LBB268_1:
	ldr	x8, [x20]
	str	x8, [x19]
	ldr	x8, [x20, #40]
	ldr	x9, [x19]
	ldur	x9, [x9, #-48]
	add	x9, x19, x9
	str	x8, [x9]
	ldr	x8, [x20, #48]
	str	x8, [x19, #8]
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB268_2:
Ltmp242:
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	add	x1, x20, #8
	mov	x0, x19
	bl	__ZN7sc_core15sc_signal_in_ifIiED2Ev
; %bb.3:
	ldr	x0, [sp, #8]
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZN7sc_core15sc_prim_channelC2EPKc
	adrp	x8, __ZTVN7sc_core17sc_signal_channelE@GOTPAGE
	ldr	x8, [x8, __ZTVN7sc_core17sc_signal_channelE@GOTPAGEOFF]
	mov	x9, #16                         ; =0x10
	add	x8, x8, x9
	str	x8, [x19]
	str	xzr, [x19, #72]
	mov	x8, #-2                         ; =0xfffffffffffffffe
	str	x8, [x19, #80]
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core27sc_writer_policy_check_portC2Ev
	add	x20, x19, #8
	bl	__ZN7sc_core28sc_writer_policy_check_write10only_deltaEv
	mov	x8, x0
	mov	x0, x20
	and	w1, w8, #0x1
	bl	__ZN7sc_core28sc_writer_policy_check_writeC2Eb
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x20, [sp]
	add	x0, x19, #8
	add	x1, x20, #24
	bl	__ZN7sc_core18sc_signal_write_ifIiED2Ev
	add	x1, x20, #8
	mov	x0, x19
	bl	__ZN7sc_core15sc_signal_in_ifIiED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	add	x9, x0, x9
	str	x8, [x9]
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
	add	x9, x0, x9
	str	x8, [x9]
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	strb	w1, [sp, #7]
	ldr	x19, [sp, #8]
	ldrb	w8, [sp, #7]
	and	w8, w8, #0x1
	strb	w8, [x19]
	add	x0, x19, #8
	bl	__ZN7sc_core17sc_process_handleC1Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core17sc_process_handleC2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #16]
	str	x1, [sp, #8]
	ldr	x0, [sp, #8]
	bl	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	str	x0, [sp]
; %bb.1:
	ldr	x19, [sp]
	ldr	x0, [sp, #16]
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev
	cmp	x19, x0
	b.eq	LBB282_3
; %bb.2:
	sturb	wzr, [x29, #-17]
	b	LBB282_5
LBB282_3:
	ldr	x0, [sp, #16]
	ldr	x3, [sp, #8]
	ldr	x4, [sp]
Ltmp251:
	mov	x1, #0                          ; =0x0
	mov	x2, #-1                         ; =0xffffffffffffffff
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm
Ltmp252:
	b	LBB282_4
LBB282_4:
	cmp	w0, #0
	cset	w8, eq
	and	w8, w8, #0x1
	sturb	w8, [x29, #-17]
LBB282_5:
	ldurb	w8, [x29, #-17]
	and	w8, w8, #0x1
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
LBB282_6:
Ltmp253:
                                        ; kill: killed $x1
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	add	x0, x8, x9
	ldr	x1, [sp, #16]
	ldr	x2, [sp, #8]
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
	cmp	x8, #23
	cset	w8, lo
	and	w0, w8, #0x1
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	tbz	w0, #0, LBB287_2
; %bb.1:
	mov	x0, x19
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev
	b	LBB287_3
LBB287_2:
	mov	x0, x19
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev
LBB287_3:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	and	w8, w8, #0x7f
	ubfx	x0, x8, #0, #8
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNSt3__19allocatorIcEC1B8ne200100Ev
	ldr	x20, [sp]
	ldr	x0, [sp]
	bl	__ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc
	mov	x2, x0
	mov	x0, x19
	mov	x1, x20
	bl	__ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x20, [sp]
	add	x0, x19, #104
	bl	__ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev
	add	x0, x19, #16
	bl	__ZN7sc_core17sc_signal_channelD2Ev
	add	x1, x20, #8
	mov	x0, x19
	bl	__ZN7sc_core18sc_signal_inout_ifIiED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	str	x8, [sp, #8]
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	add	x0, x19, #8
	bl	__ZN7sc_core28sc_writer_policy_check_writeD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core28sc_writer_policy_check_writeD2Ev ; -- Begin function _ZN7sc_core28sc_writer_policy_check_writeD2Ev
	.weak_def_can_be_hidden	__ZN7sc_core28sc_writer_policy_check_writeD2Ev
	.p2align	2
__ZN7sc_core28sc_writer_policy_check_writeD2Ev: ; @_ZN7sc_core28sc_writer_policy_check_writeD2Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	add	x0, x19, #8
	bl	__ZN7sc_core17sc_process_handleD1Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZN7sc_core17sc_process_handleD1Ev ; -- Begin function _ZN7sc_core17sc_process_handleD1Ev
	.weak_def_can_be_hidden	__ZN7sc_core17sc_process_handleD1Ev
	.p2align	2
__ZN7sc_core17sc_process_handleD1Ev:    ; @_ZN7sc_core17sc_process_handleD1Ev
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZN7sc_core17sc_process_handleD2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #8]
	ldr	x9, [x8]
	cbz	x9, LBB297_3
; %bb.1:
	ldr	x0, [x8]
Ltmp261:
	bl	__ZN7sc_core12sc_process_b19reference_decrementEv
Ltmp262:
	b	LBB297_2
LBB297_2:
	b	LBB297_3
LBB297_3:
	ldr	x0, [sp, #8]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
LBB297_4:
Ltmp263:
                                        ; kill: killed $x1
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
	ldr	x0, [sp, #8]
	ldr	w8, [x0, #196]
	sub	w8, w8, #1
	str	w8, [x0, #196]
	ldr	w8, [x0, #196]
	cbnz	w8, LBB298_2
; %bb.1:
	bl	__ZN7sc_core12sc_process_b14delete_processEv
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNK7sc_core9sc_object10simcontextEv
	ldr	x1, [x19, #80]
	bl	__ZNK7sc_core13sc_simcontext14event_occurredEy
	and	w0, w0, #0x1
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	cmp	x8, x9
	cset	w8, eq
	and	w0, w8, #0x1
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
	sub	sp, sp, #112
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	stur	x0, [x29, #-40]
	str	x1, [sp, #48]
	strb	w2, [sp, #47]
	ldur	x21, [x29, #-40]
	bl	__ZN7sc_core22sc_get_curr_simcontextEv
	bl	__ZNK7sc_core13sc_simcontext18get_current_writerEv
	str	x0, [sp, #32]
	add	x0, x21, #8
	bl	__ZNK7sc_core17sc_process_handle5validEv
	eor	w8, w0, #0x1
	eor	w8, w8, #0x1
	eor	w8, w8, #0x1
	tbz	w8, #0, LBB303_4
; %bb.1:
	ldr	x1, [sp, #32]
	add	x0, sp, #24
	bl	__ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE
	add	x1, x21, #8
Ltmp270:
	add	x0, sp, #24
	bl	__ZN7sc_core17sc_process_handle4swapERS0_
Ltmp271:
	b	LBB303_2
LBB303_2:
	add	x0, sp, #24
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB303_11
LBB303_3:
Ltmp272:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	add	x0, sp, #24
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB303_12
LBB303_4:
	add	x0, x21, #8
	bl	__ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv
	ldr	x8, [sp, #32]
	cmp	x0, x8
	mov	w8, #0                          ; =0x0
	b.eq	LBB303_6
; %bb.5:
	ldr	x8, [sp, #32]
	cmp	x8, #0
	cset	w8, ne
LBB303_6:
	eor	w8, w8, #0x1
	eor	w8, w8, #0x1
	tbz	w8, #0, LBB303_10
; %bb.7:
	ldr	x19, [sp, #48]
	add	x20, x21, #8
	mov	x0, x20
	bl	__ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv
	mov	x1, x0
	ldr	x2, [sp, #32]
	ldrb	w8, [x21]
	and	w3, w8, #0x1
	mov	x0, x19
	bl	__ZN7sc_core24sc_signal_invalid_writerEPNS_9sc_objectES1_S1_b
	ldr	x1, [sp, #32]
	mov	x0, sp
	bl	__ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE
Ltmp267:
	mov	x0, sp
	mov	x1, x20
	bl	__ZN7sc_core17sc_process_handle4swapERS0_
Ltmp268:
	b	LBB303_8
LBB303_8:
	mov	x0, sp
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB303_10
LBB303_9:
Ltmp269:
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	mov	x0, sp
	bl	__ZN7sc_core17sc_process_handleD1Ev
	b	LBB303_12
LBB303_10:
	b	LBB303_11
LBB303_11:
	mov	w8, #1                          ; =0x1
	and	w0, w8, #0x1
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #112
	ret
LBB303_12:
	ldr	x0, [sp, #16]
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
	ldr	x1, [sp, #8]
	ldr	x8, [x1, #64]
	cbnz	x8, LBB305_2
; %bb.1:
	ldr	x0, [x1, #56]
	bl	__ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE
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
	ldr	x8, [x8]
	cmp	x8, #0
	cset	w8, ne
	orr	w8, w8, wzr
	and	w0, w8, #0x1
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x1, [sp]
	mov	x0, x19
	bl	__ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	ldr	x8, [sp, #24]
	ldr	x9, [x8]
	str	x9, [sp, #8]
	ldr	x9, [sp, #16]
	ldr	x9, [x9]
	str	x9, [x8]
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
	stur	x8, [x29, #-8]
	ldr	x9, [sp, #8]
	str	x9, [x8]
	ldr	x9, [x8]
	cbz	x9, LBB311_2
; %bb.1:
	ldr	x0, [x8]
	bl	__ZN7sc_core12sc_process_b19reference_incrementEv
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
	ldr	w9, [x8, #196]
	cbz	w9, LBB312_2
; %bb.1:
	b	LBB312_3
LBB312_2:
	adrp	x8, l_.str.19@PAGE
	add	x0, x8, l_.str.19@PAGEOFF
	adrp	x8, l_.str.20@PAGE
	add	x1, x8, l_.str.20@PAGEOFF
	mov	w2, #582                        ; =0x246
	bl	__ZN7sc_core19sc_assertion_failedEPKcS1_i
LBB312_3:
	ldr	w9, [x8, #196]
	add	w9, w9, #1
	str	w9, [x8, #196]
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
	ldr	x8, [sp, #8]
	ldr	x9, [x8, #56]
	ldr	x10, [sp]
	str	x9, [x10, #64]
	ldr	x9, [sp]
	str	x9, [x8, #56]
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	mov	x0, x19
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev
	tbz	w0, #0, LBB318_2
; %bb.1:
	mov	x0, x19
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev
	b	LBB318_3
LBB318_2:
	mov	x0, x19
	bl	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev
LBB318_3:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	ldrb	w8, [x19]
	tbz	w8, #0, LBB322_2
; %bb.1:
	mov	x0, sp
	bl	__ZN7sc_core17sc_process_handleC1Ev
	add	x1, x19, #8
	mov	x0, sp
	bl	__ZN7sc_core17sc_process_handle4swapERS0_
	mov	x0, sp
	bl	__ZN7sc_core17sc_process_handleD1Ev
LBB322_2:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	sub	sp, sp, #48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	ldr	x19, [sp, #8]
	add	x0, x19, #16
	bl	__ZN7sc_core17sc_signal_channel9do_updateEv
	ldr	w8, [x19, #132]
	str	w8, [x19, #128]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #48
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
	str	x8, [sp, #8]
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
	str	x8, [sp, #8]
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
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x19, [sp, #8]
	ldr	x8, [sp]
	add	x1, x8, #8
	mov	x0, x19
	bl	__ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
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
	str	x8, [sp, #8]
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
