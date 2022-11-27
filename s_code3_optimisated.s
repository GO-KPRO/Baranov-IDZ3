	.file	"c_code3.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
	.align 8
.LC1:
	.string	"Error: there is no such file in directory"
.LC2:
	.string	"%lu %lu"
	.text
	.globl	open
	.type	open, @function
open:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L2
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, -1
	jmp	.L3
.L2:
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
.L3:
	leave
	ret
	.size	open, .-open
	.globl	generate
	.type	generate, @function
generate:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	QWORD PTR -16[rbp], rsi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	add	eax, 1000
	movsx	rdx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 2021161081
	shr	rdx, 32
	sar	edx, 3
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	mov	ecx, edx
	sal	ecx, 4
	add	ecx, edx
	sub	eax, ecx
	mov	edx, eax
	movsx	rdx, edx
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR [rax], rdx
	nop
	leave
	ret
	.size	generate, .-generate
	.globl	factorial
	.type	factorial, @function
factorial:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -16[rbp], 1
	mov	QWORD PTR -8[rbp], 2
	jmp	.L6
.L7:
	mov	rax, QWORD PTR -16[rbp]
	imul	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -16[rbp], rax
	add	QWORD PTR -8[rbp], 1
.L6:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -24[rbp]
	jbe	.L7
	mov	rax, QWORD PTR -16[rbp]
	pop	rbp
	ret
	.size	factorial, .-factorial
	.section	.rodata
.LC4:
	.string	"w"
.LC5:
	.string	"Ranom_output.txt"
.LC6:
	.string	"File_output.txt"
.LC7:
	.string	"Error: too many args"
.LC10:
	.string	"%.*f"
	.align 8
.LC12:
	.string	"Operating time of the program: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	movsd	xmm0, QWORD PTR .LC3[rip]
	movsd	QWORD PTR -24[rbp], xmm0
	cmp	DWORD PTR -84[rbp], 1
	jne	.L10
	lea	rdx, -64[rbp]
	lea	rax, -72[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	generate
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	jmp	.L11
.L10:
	cmp	DWORD PTR -84[rbp], 2
	jne	.L12
	mov	rax, QWORD PTR -96[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, -64[rbp]
	lea	rcx, -72[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	open
	cmp	eax, -1
	jne	.L13
	mov	eax, 0
	jmp	.L23
.L13:
	lea	rax, .LC4[rip]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	jmp	.L11
.L12:
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L23
.L11:
	pxor	xmm0, xmm0
	movsd	QWORD PTR -48[rbp], xmm0
	mov	QWORD PTR -40[rbp], 0
	jmp	.L15
.L22:
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	factorial
	test	rax, rax
	js	.L16
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	jmp	.L17
.L16:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	addsd	xmm0, xmm0
.L17:
	movsd	xmm1, QWORD PTR .LC9[rip]
	divsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -48[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0
	add	QWORD PTR -40[rbp], 1
.L15:
	movsd	xmm0, QWORD PTR -48[rbp]
	movapd	xmm1, xmm0
	subsd	xmm1, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -48[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm1, xmm0
	mov	rax, QWORD PTR -72[rbp]
	test	rax, rax
	js	.L18
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	jmp	.L19
.L18:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	addsd	xmm0, xmm0
.L19:
	movsd	xmm2, QWORD PTR -24[rbp]
	movapd	xmm3, xmm2
	divsd	xmm3, xmm0
	mov	rax, QWORD PTR -72[rbp]
	test	rax, rax
	js	.L20
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	jmp	.L21
.L20:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	addsd	xmm0, xmm0
.L21:
	movsd	xmm2, QWORD PTR -24[rbp]
	divsd	xmm2, xmm0
	mulsd	xmm3, xmm2
	movapd	xmm0, xmm3
	comisd	xmm1, xmm0
	ja	.L22
	mov	rax, QWORD PTR -64[rbp]
	mov	ecx, eax
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rdx
	mov	edx, ecx
	lea	rcx, .LC10[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rax, QWORD PTR -32[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC11[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L23:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC3:
	.long	-1961601175
	.long	1074118410
	.align 8
.LC9:
	.long	0
	.long	1072693248
	.align 8
.LC11:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
