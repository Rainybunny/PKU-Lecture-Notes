	.file	"switch.cpp"
	.text
	.type	_ZZ4mainENUliE_4_FUNEi, @function
_ZZ4mainENUliE_4_FUNEi:
.LFB34:
	.cfi_startproc
	endbr64
	leal	1(%rdi), %eax
	ret
	.cfi_endproc
.LFE34:
	.size	_ZZ4mainENUliE_4_FUNEi, .-_ZZ4mainENUliE_4_FUNEi
	.globl	_Z12iterate_4perPFiiEii
	.type	_Z12iterate_4perPFiiEii, @function
_Z12iterate_4perPFiiEii:
.LFB30:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movl	%esi, %ebp
	movl	%edx, %edi
	movl	%esi, %eax
	andl	$3, %eax
	cmpl	$2, %eax
	je	.L3
	cmpl	$3, %eax
	je	.L4
	cmpl	$1, %eax
	jne	.L6
	jmp	.L5
.L4:
	call	*%rbx
	movl	%eax, %edi
.L3:
	call	*%rbx
	movl	%eax, %edi
.L5:
	call	*%rbx
	movl	%eax, %edi
.L6:
	sarl	$2, %ebp
	movl	$1, %r12d
	jmp	.L7
.L8:
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	addl	$1, %r12d
.L7:
	cmpl	%ebp, %r12d
	jle	.L8
	movl	%edi, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	_Z12iterate_4perPFiiEii, .-_Z12iterate_4perPFiiEii
	.globl	_Z12iterate_8perPFiiEii
	.type	_Z12iterate_8perPFiiEii, @function
_Z12iterate_8perPFiiEii:
.LFB31:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movl	%esi, %ebp
	movl	%edx, %edi
	movl	%esi, %eax
	andl	$7, %eax
	leaq	.L13(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L13:
	.long	.L11-.L13
	.long	.L19-.L13
	.long	.L18-.L13
	.long	.L17-.L13
	.long	.L16-.L13
	.long	.L15-.L13
	.long	.L14-.L13
	.long	.L12-.L13
	.text
.L12:
	call	*%rbx
	movl	%eax, %edi
.L14:
	call	*%rbx
	movl	%eax, %edi
.L15:
	call	*%rbx
	movl	%eax, %edi
.L16:
	call	*%rbx
	movl	%eax, %edi
.L17:
	call	*%rbx
	movl	%eax, %edi
.L18:
	call	*%rbx
	movl	%eax, %edi
.L19:
	call	*%rbx
	movl	%eax, %edi
.L11:
	sarl	$3, %ebp
	movl	$1, %r12d
	jmp	.L20
.L21:
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	call	*%rbx
	movl	%eax, %edi
	addl	$1, %r12d
.L20:
	cmpl	%ebp, %r12d
	jle	.L21
	movl	%edi, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE31:
	.size	_Z12iterate_8perPFiiEii, .-_Z12iterate_8perPFiiEii
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB32:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %edx
	movl	$10, %esi
	leaq	_ZZ4mainENUliE_4_FUNEi(%rip), %rdi
	call	_Z12iterate_8perPFiiEii
	movl	%eax, %edx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE32:
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
