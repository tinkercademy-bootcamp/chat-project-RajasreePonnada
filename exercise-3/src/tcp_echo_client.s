	.arch armv8-a
	.file	"tcp_echo_client.cc"
	.text
#APP
	.globl _ZSt21ios_base_library_initv
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"\n"
#NO_APP
	.text
	.align	2
	.p2align 5,,15
	.type	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0, %function
_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0:
.LFB2637:
	.cfi_startproc
	mov	x3, x0
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x2, x1
	adrp	x0, :got:_ZSt4cerr;ldr	x0, [x0, :got_lo12:_ZSt4cerr]
	mov	x29, sp
	mov	x1, x3
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x1, .LC0
	add	x1, x1, :lo12:.LC0
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE2637:
	.size	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0, .-_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0
	.align	2
	.p2align 5,,15
	.global	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, %function
_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2092:
	.cfi_startproc
	tbnz	w0, 0, .L9
	ret
.L9:
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	ldp	x0, x1, [x1]
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0
	.cfi_endproc
.LFE2092:
	.size	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"Socket creation error"
	.text
	.align	2
	.p2align 5,,15
	.global	_Z13create_socketv
	.type	_Z13create_socketv, %function
_Z13create_socketv:
.LFB2093:
	.cfi_startproc
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	mov	w2, 0
	adrp	x3, :got:__stack_chk_guard;ldr	x3, [x3, :got_lo12:__stack_chk_guard]
	mov	w1, 1
	stp	x29, x30, [sp, 48]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 48
	mov	w0, 2
	stp	x19, x20, [sp, 64]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	add	x20, sp, 24
	ldr	x4, [x3]
	str	x4, [sp, 40]
	mov	x4, 0
	bl	socket
	mov	w19, w0
	mov	x3, 21
	mov	x1, sp
	mov	x2, 0
	add	x0, sp, 8
	stp	x3, x20, [sp]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	str	x0, [sp, 8]
	ldr	x2, [sp]
	str	x2, [sp, 24]
	ldp	x4, x5, [x1]
	stp	x4, x5, [x0]
	ldr	x3, [sp, 8]
	ldr	x1, [x1, 13]
	str	x1, [x0, 13]
	str	x2, [sp, 16]
	strb	wzr, [x3, x2]
	ldr	x0, [sp, 8]
	tbnz	w19, #31, .L15
	cmp	x0, x20
	beq	.L10
	ldr	x1, [sp, 24]
	add	x1, x1, 1
	bl	_ZdlPvm
.L10:
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 40]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L16
	ldp	x29, x30, [sp, 48]
	mov	w0, w19
	ldp	x19, x20, [sp, 64]
	add	sp, sp, 80
	.cfi_remember_state
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L15:
	.cfi_restore_state
	ldr	x1, [sp, 16]
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0
.L16:
	bl	__stack_chk_fail
	.cfi_endproc
.LFE2093:
	.size	_Z13create_socketv, .-_Z13create_socketv
	.section	.rodata.str1.8
	.align	3
.LC2:
	.string	"Invalid address / Address not supported"
	.text
	.align	2
	.p2align 5,,15
	.global	_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, %function
_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2094:
	.cfi_startproc
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	add	x2, x0, 4
	adrp	x3, :got:__stack_chk_guard;ldr	x3, [x3, :got_lo12:__stack_chk_guard]
	stp	x29, x30, [sp, 48]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	add	x20, sp, 24
	ldr	x1, [x1]
	ldr	x0, [x3]
	str	x0, [sp, 40]
	mov	x0, 0
	mov	w0, 2
	bl	inet_pton
	mov	w19, w0
	mov	x3, 39
	mov	x1, sp
	mov	x2, 0
	add	x0, sp, 8
	stp	x3, x20, [sp]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	str	x0, [sp, 8]
	ldr	x2, [sp]
	str	x2, [sp, 24]
	ldp	q31, q30, [x1]
	ldr	x1, [x1, 31]
	stp	q31, q30, [x0]
	ldr	x3, [sp, 8]
	str	x2, [sp, 16]
	str	x1, [x0, 31]
	strb	wzr, [x3, x2]
	ldr	x0, [sp, 8]
	cmp	w19, 0
	ble	.L22
	cmp	x0, x20
	beq	.L17
	ldr	x1, [sp, 24]
	add	x1, x1, 1
	bl	_ZdlPvm
.L17:
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 40]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L23
	ldp	x29, x30, [sp, 48]
	ldp	x19, x20, [sp, 64]
	add	sp, sp, 80
	.cfi_remember_state
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L22:
	.cfi_restore_state
	ldr	x1, [sp, 16]
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0
.L23:
	bl	__stack_chk_fail
	.cfi_endproc
.LFE2094:
	.size	_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z18set_binary_addressR11sockaddr_inRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.align	2
	.p2align 5,,15
	.global	_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi
	.type	_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi, %function
_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi:
.LFB2095:
	.cfi_startproc
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	rev16	w3, w1
	adrp	x2, :got:__stack_chk_guard;ldr	x2, [x2, :got_lo12:__stack_chk_guard]
	mov	w4, 2
	stp	x29, x30, [sp, 64]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 64
	stp	x19, x20, [sp, 80]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	add	x20, sp, 40
	ldr	x1, [x0]
	ldr	x0, [x2]
	str	x0, [sp, 56]
	mov	x0, 0
	mov	w0, 2
	add	x2, sp, 12
	strh	w4, [sp, 8]
	strh	w3, [sp, 10]
	str	xzr, [sp, 12]
	str	wzr, [sp, 20]
	bl	inet_pton
	mov	x3, 39
	mov	x1, sp
	mov	x2, 0
	mov	w19, w0
	add	x0, sp, 24
	str	x3, [sp]
	str	x20, [sp, 24]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	ldr	x2, [sp]
	str	x0, [sp, 24]
	ldp	q31, q30, [x1]
	str	x2, [sp, 40]
	ldr	x1, [x1, 31]
	stp	q31, q30, [x0]
	ldr	x3, [sp, 24]
	str	x1, [x0, 31]
	str	x2, [sp, 32]
	strb	wzr, [x3, x2]
	ldr	x0, [sp, 24]
	cmp	w19, 0
	ble	.L29
	cmp	x0, x20
	beq	.L26
	ldr	x1, [sp, 40]
	add	x1, x1, 1
	bl	_ZdlPvm
.L26:
	adrp	x1, :got:__stack_chk_guard;ldr	x1, [x1, :got_lo12:__stack_chk_guard]
	ldp	x2, x3, [sp, 8]
	ldr	x0, [sp, 56]
	ldr	x4, [x1]
	subs	x0, x0, x4
	mov	x4, 0
	bne	.L30
	ldp	x29, x30, [sp, 64]
	mov	x0, x2
	ldp	x19, x20, [sp, 80]
	mov	x1, x3
	add	sp, sp, 96
	.cfi_remember_state
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L29:
	.cfi_restore_state
	ldr	x1, [sp, 32]
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0
.L30:
	bl	__stack_chk_fail
	.cfi_endproc
.LFE2095:
	.size	_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi, .-_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi
	.section	.rodata.str1.8
	.align	3
.LC3:
	.string	"Connection Failed"
	.text
	.align	2
	.p2align 5,,15
	.global	_Z17connect_to_serveriR11sockaddr_in
	.type	_Z17connect_to_serveriR11sockaddr_in, %function
_Z17connect_to_serveriR11sockaddr_in:
.LFB2096:
	.cfi_startproc
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	mov	w2, 16
	adrp	x3, :got:__stack_chk_guard;ldr	x3, [x3, :got_lo12:__stack_chk_guard]
	stp	x29, x30, [sp, 48]
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	add	x29, sp, 48
	stp	x19, x20, [sp, 64]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	add	x20, sp, 24
	ldr	x4, [x3]
	str	x4, [sp, 40]
	mov	x4, 0
	bl	connect
	mov	w19, w0
	mov	x3, 17
	mov	x1, sp
	mov	x2, 0
	add	x0, sp, 8
	stp	x3, x20, [sp]
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	str	x0, [sp, 8]
	ldr	x2, [sp]
	str	x2, [sp, 24]
	ldp	x4, x5, [x1]
	stp	x4, x5, [x0]
	ldrb	w3, [x1, 16]
	ldr	x1, [sp, 8]
	strb	w3, [x0, 16]
	str	x2, [sp, 16]
	strb	wzr, [x1, x2]
	ldr	x0, [sp, 8]
	tbnz	w19, #31, .L36
	cmp	x0, x20
	beq	.L31
	ldr	x1, [sp, 24]
	add	x1, x1, 1
	bl	_ZdlPvm
.L31:
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 40]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L37
	ldp	x29, x30, [sp, 48]
	ldp	x19, x20, [sp, 64]
	add	sp, sp, 80
	.cfi_remember_state
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L36:
	.cfi_restore_state
	ldr	x1, [sp, 16]
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0
.L37:
	bl	__stack_chk_fail
	.cfi_endproc
.LFE2096:
	.size	_Z17connect_to_serveriR11sockaddr_in, .-_Z17connect_to_serveriR11sockaddr_in
	.section	.rodata.str1.8
	.align	3
.LC4:
	.string	"Send failed"
	.align	3
.LC5:
	.string	"Sent: "
	.align	3
.LC6:
	.string	"Read error"
	.align	3
.LC7:
	.string	"Server closed connection.\n"
	.align	3
.LC8:
	.string	"Received: "
	.text
	.align	2
	.p2align 5,,15
	.global	_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, %function
_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB2097:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	sub	sp, sp, #1072
	.cfi_def_cfa_offset 1120
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	str	xzr, [sp, 1024]
	mov	x19, x1
	adrp	x2, :got:__stack_chk_guard;ldr	x2, [x2, :got_lo12:__stack_chk_guard]
	mov	w21, w0
	add	x22, sp, 40
	mov	w1, 0
	ldr	x0, [x2]
	str	x0, [sp, 1064]
	mov	x0, 0
	mov	x2, 1024
	mov	x0, x22
	bl	memset
	ldp	x1, x2, [x19]
	mov	w3, 0
	mov	w0, w21
	add	x20, sp, 24
	bl	send
	strb	wzr, [sp, 35]
	adrp	x2, .LC4
	add	x2, x2, :lo12:.LC4
	mov	x1, 11
	stp	x20, x1, [sp, 8]
	ldr	x3, [x2]
	str	x3, [sp, 24]
	ldr	w2, [x2, 7]
	str	w2, [x20, 7]
	tbnz	x0, #63, .L45
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	mov	x2, 6
	adrp	x1, .LC5
	add	x1, x1, :lo12:.LC5
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldp	x1, x2, [x19]
	adrp	x19, .LC0
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	add	x19, x19, :lo12:.LC0
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x1, x19
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x1, x22
	mov	x2, 1024
	mov	w0, w21
	bl	read
	adrp	x3, .LC6
	add	x3, x3, :lo12:.LC6
	mov	x2, 10
	stp	x20, x2, [sp, 8]
	ldr	x1, [x3]
	str	x1, [sp, 24]
	ldrh	w1, [x3, 8]
	strb	wzr, [sp, 34]
	strh	w1, [x20, 8]
	cmp	x0, 0
	blt	.L46
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	beq	.L47
	adrp	x1, .LC8
	add	x1, x1, :lo12:.LC8
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x22
	bl	strlen
	mov	x2, x0
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	mov	x1, x22
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x0, :got:_ZSt4cout;ldr	x0, [x0, :got_lo12:_ZSt4cout]
	mov	x1, x19
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.L38:
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 1064]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L48
	add	sp, sp, 1072
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L47:
	.cfi_restore_state
	adrp	x1, .LC7
	mov	x2, 26
	add	x1, x1, :lo12:.LC7
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	b	.L38
.L46:
	mov	x1, x2
.L45:
	mov	x0, x20
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0
.L48:
	bl	__stack_chk_fail
	.cfi_endproc
.LFE2097:
	.size	_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"Usage: "
	.align	3
.LC10:
	.string	"basic_string::append"
	.align	3
.LC11:
	.string	" <message>"
	.align	3
.LC12:
	.string	"basic_string: construction from null is not valid"
	.text
	.align	2
	.p2align 5,,15
	.global	_Z9read_argsB5cxx11iPPc
	.type	_Z9read_argsB5cxx11iPPc, %function
_Z9read_argsB5cxx11iPPc:
.LFB2098:
	.cfi_startproc
	sub	sp, sp, #192
	.cfi_def_cfa_offset 192
	adrp	x2, .LC9
	add	x2, x2, :lo12:.LC9
	adrp	x3, :got:__stack_chk_guard;ldr	x3, [x3, :got_lo12:__stack_chk_guard]
	stp	x29, x30, [sp, 112]
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	add	x29, sp, 112
	ldr	w4, [x2]
	stp	x19, x20, [sp, 128]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	x19, x8
	stp	x21, x22, [sp, 144]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	mov	x22, x1
	stp	x23, x24, [sp, 160]
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	add	x24, sp, 24
	mov	w23, w0
	ldr	x20, [x1]
	str	x25, [sp, 176]
	.cfi_offset 25, -16
	ldr	w1, [x2, 3]
	ldr	x2, [x3]
	str	x2, [sp, 104]
	mov	x2, 0
	str	w4, [sp, 24]
	mov	x2, 7
	stp	x24, x2, [sp, 8]
	mov	x0, x20
	strb	wzr, [sp, 31]
	str	w1, [x24, 3]
	bl	strlen
	mov	x1, 4611686018427387896
	cmp	x0, x1
	bhi	.L53
	add	x21, sp, 8
	mov	x2, x0
	mov	x1, x20
	mov	x0, x21
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
	mov	x21, x0
	add	x25, sp, 56
	str	x25, [sp, 40]
	mov	x20, x0
	ldr	x0, [x21], 16
	cmp	x0, x21
	beq	.L70
	ldr	x1, [x20, 16]
	str	x0, [sp, 40]
	str	x1, [sp, 56]
.L52:
	ldr	x1, [x20, 8]
	str	x1, [sp, 48]
	mov	x0, 4611686018427387903
	stp	x21, xzr, [x20]
	sub	x0, x0, x1
	strb	wzr, [x20, 16]
	cmp	x0, 9
	bls	.L53
	add	x0, sp, 40
	adrp	x1, .LC11
	mov	x2, 10
	add	x1, x1, :lo12:.LC11
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
	mov	x21, x0
	add	x3, sp, 88
	str	x3, [sp, 72]
	mov	x20, x0
	ldr	x0, [x21], 16
	cmp	x0, x21
	beq	.L71
	ldr	x1, [x20, 16]
	str	x0, [sp, 72]
	str	x1, [sp, 88]
.L55:
	ldr	x1, [x20, 8]
	str	x1, [sp, 80]
	stp	x21, xzr, [x20]
	strb	wzr, [x20, 16]
	ldr	x0, [sp, 72]
	cmp	w23, 1
	ble	.L72
	cmp	x0, x3
	beq	.L57
	ldr	x1, [sp, 88]
	add	x1, x1, 1
	bl	_ZdlPvm
.L57:
	ldr	x0, [sp, 40]
	cmp	x0, x25
	beq	.L58
	ldr	x1, [sp, 56]
	add	x1, x1, 1
	bl	_ZdlPvm
.L58:
	ldr	x0, [sp, 8]
	cmp	x0, x24
	beq	.L59
	ldr	x1, [sp, 24]
	add	x1, x1, 1
	bl	_ZdlPvm
.L59:
	ldr	x22, [x22, 8]
	add	x21, x19, 16
	str	x21, [x19]
	cbz	x22, .L73
	mov	x0, x22
	bl	strlen
	str	x0, [sp]
	mov	x20, x0
	cmp	x0, 15
	bhi	.L74
	cmp	x0, 1
	bne	.L63
	ldrb	w0, [x22]
	strb	w0, [x19, 16]
.L64:
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	str	x20, [x19, 8]
	strb	wzr, [x21, x20]
	ldr	x2, [sp, 104]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L75
	ldr	x25, [sp, 176]
	mov	x0, x19
	ldp	x29, x30, [sp, 112]
	ldp	x19, x20, [sp, 128]
	ldp	x21, x22, [sp, 144]
	ldp	x23, x24, [sp, 160]
	add	sp, sp, 192
	.cfi_remember_state
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L63:
	.cfi_restore_state
	cbz	x0, .L64
	b	.L62
	.p2align 2,,3
.L74:
	mov	x1, sp
	mov	x0, x19
	mov	x2, 0
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	ldr	x1, [sp]
	mov	x21, x0
	str	x0, [x19]
	str	x1, [x19, 16]
.L62:
	mov	x2, x20
	mov	x0, x21
	mov	x1, x22
	bl	memcpy
	ldr	x21, [x19]
	ldr	x20, [sp]
	b	.L64
	.p2align 2,,3
.L71:
	ldr	x2, [x20, 8]
	mov	x0, x3
	mov	x1, x21
	add	x2, x2, 1
	bl	memcpy
	mov	x3, x0
	b	.L55
	.p2align 2,,3
.L70:
	ldr	x2, [x20, 8]
	mov	x1, x21
	mov	x0, x25
	add	x2, x2, 1
	bl	memcpy
	b	.L52
.L75:
	bl	__stack_chk_fail
.L72:
	bl	_Z11check_errorbNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE.part.0.isra.0
.L53:
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	_ZSt20__throw_length_errorPKc
.L73:
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	bl	_ZSt19__throw_logic_errorPKc
	.cfi_endproc
.LFE2098:
	.size	_Z9read_argsB5cxx11iPPc, .-_Z9read_argsB5cxx11iPPc
	.section	.rodata.str1.8
	.align	3
.LC13:
	.string	"127.0.0.1"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 5,,15
	.global	main
	.type	main, %function
main:
.LFB2099:
	.cfi_startproc
	sub	sp, sp, #144
	.cfi_def_cfa_offset 144
	adrp	x3, .LC13
	adrp	x4, :got:__stack_chk_guard;ldr	x4, [x4, :got_lo12:__stack_chk_guard]
	add	x3, x3, :lo12:.LC13
	stp	x29, x30, [sp, 96]
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	add	x29, sp, 96
	add	x2, sp, 40
	ldr	x6, [x3]
	stp	x19, x20, [sp, 112]
	ldrb	w5, [x3, 8]
	str	x21, [sp, 128]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	mov	x3, x4
	add	x19, sp, 56
	add	x21, sp, 24
	ldr	x4, [x3]
	str	x4, [sp, 88]
	mov	x4, 0
	mov	x8, x19
	mov	x3, 9
	stp	x2, x3, [sp, 24]
	str	x6, [sp, 40]
	strb	w5, [sp, 48]
	strb	wzr, [sp, 49]
	bl	_Z9read_argsB5cxx11iPPc
	bl	_Z13create_socketv
	mov	w20, w0
	mov	w1, 8080
	mov	x0, x21
	bl	_Z14create_addressRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi
	mov	x2, x0
	mov	x3, x1
	mov	w0, w20
	add	x1, sp, 8
	stp	x2, x3, [sp, 8]
	bl	_Z17connect_to_serveriR11sockaddr_in
	mov	x1, x19
	mov	w0, w20
	bl	_Z24send_and_receive_messageiRKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	mov	w0, w20
	bl	close
	mov	x0, x19
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	mov	x0, x21
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	adrp	x0, :got:__stack_chk_guard;ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 88]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L79
	ldr	x21, [sp, 128]
	mov	w0, 0
	ldp	x29, x30, [sp, 96]
	ldp	x19, x20, [sp, 112]
	add	sp, sp, 144
	.cfi_remember_state
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
.L79:
	.cfi_restore_state
	bl	__stack_chk_fail
	.cfi_endproc
.LFE2099:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 14.2.0-4ubuntu2~24.04) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
