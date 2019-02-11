	.file	"test.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	cmpl	$999, -4(%rbp)
	jg	.L2
	movl	$0, -12(%rbp)
	jmp	.L3
.L4:
	addl	$1, -8(%rbp)
	addl	$1, -12(%rbp)
.L3:
	cmpl	$3, -12(%rbp)
	jle	.L4
	movl	$0, %eax
	jmp	.L1
.L2:
.L1:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
