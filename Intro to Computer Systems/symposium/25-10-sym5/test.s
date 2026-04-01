	.file	"test.c"
	.text
	.globl	bubble
	.type	bubble, @function
bubble:
.LFB23:
	.cfi_startproc
	endbr64
	leaq	-8(%rdi,%rsi,8), %rsi
	jmp	.L2
.L3:
	addq	$8, %rax
.L5:
	cmpq	%rsi, %rax
	jnb	.L7
	movq	8(%rax), %rdx
	movq	(%rax), %rcx
	cmpq	%rcx, %rdx
	jge	.L3
	movq	%rcx, 8(%rax)
	movq	%rdx, (%rax)
	jmp	.L3
.L7:
	subq	$8, %rsi
.L2:
	cmpq	%rdi, %rsi
	jbe	.L8
	movq	%rdi, %rax
	jmp	.L5
.L8:
	ret
	.cfi_endproc
.LFE23:
	.size	bubble, .-bubble
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	$3, (%rsp)
	movq	$1, 8(%rsp)
	movq	$4, 16(%rsp)
	movq	$1, 24(%rsp)
	movq	$5, 32(%rsp)
	movq	$9, 40(%rsp)
	movq	%rsp, %rdi
	movl	$6, %esi
	call	bubble
	movl	$0, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
