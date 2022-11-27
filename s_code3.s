	.file	"c_code3.c"
	.intel_syntax noprefix
	.section .rdata,"dr"
LC0:
	.ascii "r\0"
	.align 4
LC1:
	.ascii "Error: there is no such file in directory\0"
LC2:
	.ascii "%lu %lu\0"
	.text
	.globl	_open
	.def	_open;	.scl	2;	.type	32;	.endef
_open:
LFB18:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 40
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC0
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_fopen
	mov	DWORD PTR [ebp-12], eax
	cmp	DWORD PTR [ebp-12], 0
	jne	L2
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_printf
	mov	eax, -1
	jmp	L3
L2:
	mov	eax, DWORD PTR [ebp+16]
	mov	DWORD PTR [esp+12], eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC2
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	call	_fscanf
L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_generate
	.def	_generate;	.scl	2;	.type	32;	.endef
_generate:
LFB19:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 24
	mov	DWORD PTR [esp], 0
	call	_time
	mov	DWORD PTR [esp], eax
	call	_srand
	call	_rand
	mov	DWORD PTR [esp], eax
	call	_srand
	call	_rand
	add	eax, 1000
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [eax], edx
	call	_rand
	mov	ecx, eax
	mov	edx, 2021161081
	mov	eax, ecx
	imul	edx
	sar	edx, 3
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	edx, eax
	sal	edx, 4
	add	edx, eax
	mov	eax, ecx
	sub	eax, edx
	mov	edx, eax
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [eax], edx
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_factorial
	.def	_factorial;	.scl	2;	.type	32;	.endef
_factorial:
LFB20:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	mov	DWORD PTR [ebp-4], 1
	mov	DWORD PTR [ebp-8], 2
	jmp	L6
L7:
	mov	eax, DWORD PTR [ebp-4]
	imul	eax, DWORD PTR [ebp-8]
	mov	DWORD PTR [ebp-4], eax
	add	DWORD PTR [ebp-8], 1
L6:
	mov	eax, DWORD PTR [ebp-8]
	cmp	eax, DWORD PTR [ebp+8]
	jbe	L7
	mov	eax, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC4:
	.ascii "w\0"
LC5:
	.ascii "Ranom_output.txt\0"
LC6:
	.ascii "File_output.txt\0"
LC7:
	.ascii "Error: too many args\0"
LC10:
	.ascii "%.*f\0"
	.align 4
LC12:
	.ascii "Operating time of the program: %f\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB21:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 96
	call	___main
	call	_clock
	mov	DWORD PTR [esp+72], eax
	fld	QWORD PTR LC3
	fstp	QWORD PTR [esp+64]
	cmp	DWORD PTR [ebp+8], 1
	jne	L10
	lea	eax, [esp+52]
	mov	DWORD PTR [esp+4], eax
	lea	eax, [esp+56]
	mov	DWORD PTR [esp], eax
	call	_generate
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	mov	DWORD PTR [esp], OFFSET FLAT:LC5
	call	_fopen
	mov	DWORD PTR [esp+92], eax
	jmp	L11
L10:
	cmp	DWORD PTR [ebp+8], 2
	jne	L12
	mov	eax, DWORD PTR [ebp+12]
	add	eax, 4
	mov	eax, DWORD PTR [eax]
	lea	edx, [esp+52]
	mov	DWORD PTR [esp+8], edx
	lea	edx, [esp+56]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	_open
	cmp	eax, -1
	jne	L13
	mov	eax, 0
	jmp	L17
L13:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC4
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_fopen
	mov	DWORD PTR [esp+92], eax
	jmp	L11
L12:
	mov	DWORD PTR [esp], OFFSET FLAT:LC7
	call	_printf
	mov	eax, 0
	jmp	L17
L11:
	fldz
	fstp	QWORD PTR [esp+80]
	mov	DWORD PTR [esp+76], 0
	jmp	L15
L16:
	mov	eax, DWORD PTR [esp+76]
	mov	DWORD PTR [esp], eax
	call	_factorial
	mov	DWORD PTR [esp+32], eax
	mov	DWORD PTR [esp+36], 0
	fild	QWORD PTR [esp+32]
	fstp	QWORD PTR [esp+40]
	fld	QWORD PTR [esp+40]
	fld1
	fdivrp	st(1), st
	fld	QWORD PTR [esp+80]
	faddp	st(1), st
	fstp	QWORD PTR [esp+80]
	add	DWORD PTR [esp+76], 1
L15:
	fld	QWORD PTR [esp+80]
	fsub	QWORD PTR [esp+64]
	fld	QWORD PTR [esp+80]
	fsub	QWORD PTR [esp+64]
	fmulp	st(1), st
	mov	eax, DWORD PTR [esp+56]
	mov	DWORD PTR [esp+32], eax
	mov	DWORD PTR [esp+36], 0
	fild	QWORD PTR [esp+32]
	fstp	QWORD PTR [esp+40]
	fld	QWORD PTR [esp+40]
	fld	QWORD PTR [esp+64]
	fdivrp	st(1), st
	mov	eax, DWORD PTR [esp+56]
	mov	DWORD PTR [esp+32], eax
	mov	DWORD PTR [esp+36], 0
	fild	QWORD PTR [esp+32]
	fstp	QWORD PTR [esp+40]
	fld	QWORD PTR [esp+40]
	fld	QWORD PTR [esp+64]
	fdivrp	st(1), st
	fmulp	st(1), st
	fxch	st(1)
	fucompp
	fnstsw	ax
	sahf
	ja	L16
	mov	eax, DWORD PTR [esp+52]
	fld	QWORD PTR [esp+80]
	fstp	QWORD PTR [esp+12]
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC10
	mov	eax, DWORD PTR [esp+92]
	mov	DWORD PTR [esp], eax
	call	_fprintf
	call	_clock
	mov	DWORD PTR [esp+60], eax
	mov	eax, DWORD PTR [esp+60]
	sub	eax, DWORD PTR [esp+72]
	mov	DWORD PTR [esp+32], eax
	fild	DWORD PTR [esp+32]
	fld	QWORD PTR LC11
	fdivp	st(1), st
	fstp	QWORD PTR [esp+4]
	mov	DWORD PTR [esp], OFFSET FLAT:LC12
	call	_printf
	mov	eax, 0
L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
	.align 8
LC3:
	.long	-1961601175
	.long	1074118410
	.align 8
LC11:
	.long	0
	.long	1083129856
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fscanf;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_clock;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
