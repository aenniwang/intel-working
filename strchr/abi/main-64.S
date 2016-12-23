	.file	"main.c"
	.text
	.p2align 4,,15
	.globl	simple_l
	.type	simple_l, @function
simple_l:
.LFB0:
	.cfi_startproc
	movq	%rsi, %rax
	addq	(%rdi), %rax
	movq	%rax, (%rdi)
	ret
	.cfi_endproc
.LFE0:
	.size	simple_l, .-simple_l
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
