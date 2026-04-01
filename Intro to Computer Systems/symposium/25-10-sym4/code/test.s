	.file	"test.c"
	.text
	.globl	foo
	.type	foo, @function
foo:
.LFB0:
	.cfi_startproc
	endbr64
	cmpl	$1, %edi
	je	.L2
	jg	.L3
	testl	%edi, %edi
	jne	.L7
	movl	$114, %edi
.L2:
	leal	514(%rdi), %eax
	ret
.L7:
	movl	$810, %eax
	ret
.L3:
	subl	$3, %edi
	cmpl	$1, %edi
	ja	.L8
	movl	$1919, %eax
	ret
.L8:
	movl	$810, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	foo, .-foo
	.globl	bar
	.type	bar, @function
bar:
.LFB1:
	.cfi_startproc
	endbr64
	cmpl	$4, %edi
	ja	.L10
	leaq	jmpt.0(%rip), %rax
	movslq	%edi, %rdx
	jmp	*(%rax,%rdx,8)
.L11:
	endbr64
	movl	$114, %edi
.L12:
	endbr64
	leal	514(%rdi), %eax
	ret
.L14:
	endbr64
.L10:
	endbr64
	movl	$810, %eax
.L13:
	ret
	.cfi_endproc
.LFE1:
	.size	bar, .-bar
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	jmpt.0, @object
	.size	jmpt.0, 40
jmpt.0:
	.quad	.L11
	.quad	.L12
	.quad	.L10
	.quad	.L14
	.quad	.L14
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
