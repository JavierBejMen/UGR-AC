	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"ERROR, uso: %s <tama\303\261o> <constante>\n"
.LC1:
	.string	"Error alocando memoria para y"
.LC2:
	.string	"Error alocando memoria para x"
.LC4:
	.string	"y[0] = %i, y[%i] = %i\n"
.LC5:
	.string	"\nTiempo (segundos) = %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB6:
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
	jg	.L2
	movq	(%rsi), %rdx
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rsi
	call	fprintf@PLT
	jmp	.L14
.L2:
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbp), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, %rbx
	movl	%eax, %r14d
	call	strtol@PLT
	movl	%ebx, %r12d
	salq	$2, %r12
	movl	%eax, %r13d
	movq	%r12, %rdi
	call	malloc@PLT
	leaq	.LC1(%rip), %rdi
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L13
	movq	%r12, %rdi
	call	malloc@PLT
	movq	%rax, %r12
	xorl	%eax, %eax
	testq	%r12, %r12
	jne	.L5
	leaq	.LC2(%rip), %rdi
.L13:
	call	perror@PLT
.L14:
	movl	$1, %eax
	jmp	.L1
.L5:
	cmpl	%eax, %r14d
	jbe	.L16
	leal	2(%rax), %edx
	movl	%edx, 0(%rbp,%rax,4)
	leal	(%rax,%rax), %edx
	movl	%edx, (%r12,%rax,4)
	incq	%rax
	jmp	.L5
.L16:
	leaq	24(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
.L7:
	cmpl	%eax, %r14d
	jbe	.L17
	movl	(%r12,%rax,4), %edx
	imull	%r13d, %edx
	addl	%edx, 0(%rbp,%rax,4)
	incq	%rax
	jmp	.L7
.L17:
	leaq	40(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	48(%rsp), %rax
	movl	0(%rbp), %esi
	leaq	.LC4(%rip), %rdi
	subq	32(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	divsd	.LC3(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	leal	-1(%rbx), %eax
	movl	0(%rbp,%rax,4), %ecx
	movq	%rax, %rdx
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	printf@PLT
	movsd	8(%rsp), %xmm0
	leaq	.LC5(%rip), %rdi
	movb	$1, %al
	call	printf@PLT
	movq	%rbp, %rdi
	call	free@PLT
	movq	%r12, %rdi
	call	free@PLT
	xorl	%eax, %eax
.L1:
	movq	56(%rsp), %rcx
	subq	%fs:40, %rcx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	addq	$64, %rsp
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
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 10.1.0"
	.section	.note.GNU-stack,"",@progbits
