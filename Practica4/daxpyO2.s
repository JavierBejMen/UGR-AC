	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"ERROR, uso: %s <tama\303\261o> <constante>\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Error alocando memoria para y"
.LC2:
	.string	"Error alocando memoria para x"
.LC4:
	.string	"y[0] = %i, y[%i] = %i\n"
.LC5:
	.string	"\nTiempo (segundos) = %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L20
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %r13
	call	strtol@PLT
	movl	%r13d, %ebx
	leaq	0(,%rbx,4), %r12
	movl	%eax, %r14d
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L21
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L5
	xorl	%eax, %eax
	testl	%r13d, %r13d
	je	.L22
	.p2align 4,,10
	.p2align 3
.L8:
	leal	2(%rax), %edx
	movl	%edx, 0(%rbp,%rax,4)
	leal	(%rax,%rax), %edx
	movl	%edx, (%r12,%rax,4)
	addq	$1, %rax
	cmpq	%rbx, %rax
	jne	.L8
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movl	(%r12,%rax,4), %edx
	imull	%r14d, %edx
	addl	%edx, 0(%rbp,%rax,4)
	addq	$1, %rax
	cmpq	%rbx, %rax
	jne	.L10
.L11:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movl	0(%rbp), %esi
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	leaq	.LC4(%rip), %rdi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	divsd	.LC3(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	leal	-1(%r13), %eax
	movl	0(%rbp,%rax,4), %ecx
	movq	%rax, %rdx
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	printf@PLT
	movsd	8(%rsp), %xmm0
	movl	$1, %eax
	leaq	.LC5(%rip), %rdi
	call	printf@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	movq	56(%rsp), %rcx
	subq	%fs:40, %rcx
	jne	.L23
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
	movq	(%rsi), %rdx
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rsi
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L1
.L22:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	jmp	.L11
.L23:
	call	__stack_chk_fail@PLT
.L5:
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L1
.L21:
	leaq	.LC1(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L1
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 10.1.0"
	.section	.note.GNU-stack,"",@progbits
