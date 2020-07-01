	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"ERROR, uso: %s <tama\303\261o> <constante>\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Error alocando memoria para y"
.LC3:
	.string	"Error alocando memoria para x"
.LC7:
	.string	"y[0] = %i, y[%i] = %i\n"
.LC8:
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
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jle	.L27
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbp), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rbx
	call	strtol@PLT
	movl	%ebx, %r12d
	salq	$2, %r12
	movq	%rax, %r13
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L28
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L5
	testl	%ebx, %ebx
	je	.L29
	leal	-1(%rbx), %r14d
	cmpl	$2, %r14d
	jbe	.L19
	movl	%ebx, %edx
	movdqa	.LC0(%rip), %xmm1
	xorl	%eax, %eax
	movdqa	.LC4(%rip), %xmm4
	shrl	$2, %edx
	movdqa	.LC5(%rip), %xmm3
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L9:
	movdqa	%xmm1, %xmm0
	paddd	%xmm4, %xmm1
	movdqa	%xmm0, %xmm2
	pslld	$1, %xmm0
	paddd	%xmm3, %xmm2
	movups	%xmm0, (%r12,%rax)
	movups	%xmm2, 0(%rbp,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L9
	movl	%ebx, %eax
	andl	$-4, %eax
	testb	$3, %bl
	je	.L30
.L8:
	movl	%eax, %ecx
	leal	2(%rax), %edx
	leal	(%rax,%rax), %esi
	movl	%edx, 0(%rbp,%rcx,4)
	movl	%esi, (%r12,%rcx,4)
	leal	1(%rax), %ecx
	cmpl	%ecx, %ebx
	jbe	.L11
	movl	%ecx, %esi
	leal	3(%rax), %edi
	addl	%ecx, %ecx
	movl	%edi, 0(%rbp,%rsi,4)
	movl	%ecx, (%r12,%rsi,4)
	cmpl	%edx, %ebx
	jbe	.L11
	movl	%edx, %ecx
	addl	$4, %eax
	addl	%edx, %edx
	movl	%eax, 0(%rbp,%rcx,4)
	movl	%edx, (%r12,%rcx,4)
.L11:
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	cmpl	$2, %r14d
	jbe	.L20
.L17:
	movd	%r13d, %xmm5
	movl	%ebx, %edx
	xorl	%eax, %eax
	pshufd	$0, %xmm5, %xmm2
	shrl	$2, %edx
	movdqa	%xmm2, %xmm3
	salq	$4, %rdx
	psrlq	$32, %xmm3
	.p2align 4,,10
	.p2align 3
.L13:
	movdqu	(%r12,%rax), %xmm0
	movdqu	(%r12,%rax), %xmm1
	psrlq	$32, %xmm0
	pmuludq	%xmm2, %xmm1
	pmuludq	%xmm3, %xmm0
	pshufd	$8, %xmm1, %xmm1
	pshufd	$8, %xmm0, %xmm0
	punpckldq	%xmm0, %xmm1
	movdqu	0(%rbp,%rax), %xmm0
	paddd	%xmm1, %xmm0
	movups	%xmm0, 0(%rbp,%rax)
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.L13
	movl	%ebx, %eax
	andl	$-4, %eax
	testb	$3, %bl
	je	.L16
.L15:
	movl	%eax, %edx
	movl	(%r12,%rdx,4), %ecx
	imull	%r13d, %ecx
	addl	%ecx, 0(%rbp,%rdx,4)
	leal	1(%rax), %edx
	cmpl	%ebx, %edx
	jnb	.L16
	movl	(%r12,%rdx,4), %ecx
	addl	$2, %eax
	imull	%r13d, %ecx
	addl	%ecx, 0(%rbp,%rdx,4)
	cmpl	%eax, %ebx
	jbe	.L16
	movl	%eax, %edx
	imull	(%r12,%rdx,4), %r13d
	addl	%r13d, 0(%rbp,%rdx,4)
.L16:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	movl	0(%rbp), %esi
	movl	%r14d, %edx
	subq	24(%rsp), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	divsd	.LC6(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movl	%r14d, %eax
	leaq	.LC7(%rip), %rdi
	movl	0(%rbp,%rax,4), %ecx
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	printf@PLT
	movsd	8(%rsp), %xmm0
	movl	$1, %eax
	leaq	.LC8(%rip), %rdi
	call	printf@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	movq	56(%rsp), %rbx
	subq	%fs:40, %rbx
	jne	.L31
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
.L27:
	.cfi_restore_state
	movq	(%rsi), %rdx
	movq	stderr(%rip), %rdi
	leaq	.LC1(%rip), %rsi
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L1
.L30:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	jmp	.L17
.L29:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	orl	$-1, %r14d
	call	clock_gettime@PLT
	jmp	.L16
.L19:
	xorl	%eax, %eax
	jmp	.L8
.L20:
	xorl	%eax, %eax
	jmp	.L15
.L31:
	call	__stack_chk_fail@PLT
.L5:
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L1
.L28:
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L1
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC4:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC5:
	.long	2
	.long	2
	.long	2
	.long	2
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 10.1.0"
	.section	.note.GNU-stack,"",@progbits
