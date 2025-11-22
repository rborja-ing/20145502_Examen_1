	.file	"20145502.c"
	.text
	.globl	suma_divisores_propios
	.type	suma_divisores_propios, @function
suma_divisores_propios:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	$0, -4(%rbp)
	cmpl	$1, -20(%rbp)
	jg	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	$1, -8(%rbp)
	jmp	.L4
.L6:
	movl	-20(%rbp), %eax
	cltd
	idivl	-8(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L5
	movl	-8(%rbp), %eax
	addl	%eax, -4(%rbp)
.L5:
	addl	$1, -8(%rbp)
.L4:
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -8(%rbp)
	jle	.L6
	movl	-4(%rbp), %eax
.L3:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	suma_divisores_propios, .-suma_divisores_propios
	.section	.rodata
.LC0:
	.string	"Deficiente"
.LC1:
	.string	"Perfecto"
.LC2:
	.string	"Abundante"
	.text
	.globl	clasificar
	.type	clasificar, @function
clasificar:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	suma_divisores_propios
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L8
	leaq	.LC0(%rip), %rax
	jmp	.L9
.L8:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jne	.L10
	leaq	.LC1(%rip), %rax
	jmp	.L9
.L10:
	leaq	.LC2(%rip), %rax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	clasificar, .-clasificar
	.section	.rodata
.LC3:
	.string	"El arreglo es: "
.LC4:
	.string	"%d\n"
.LC5:
	.string	"%d, "
.LC6:
	.string	"%d - %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, -4(%rbp)
	jmp	.L12
.L13:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$1374389535, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$5, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	addl	$1, %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, -80(%rbp,%rax,4)
	addl	$1, -4(%rbp)
.L12:
	cmpl	$14, -4(%rbp)
	jle	.L13
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -8(%rbp)
	jmp	.L14
.L17:
	cmpl	$14, -8(%rbp)
	jne	.L15
	movl	-8(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L16
.L15:
	movl	-8(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L16:
	addl	$1, -8(%rbp)
.L14:
	cmpl	$14, -8(%rbp)
	jle	.L17
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, -12(%rbp)
	jmp	.L18
.L19:
	movl	-12(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %edi
	call	clasificar
	movq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -12(%rbp)
.L18:
	cmpl	$14, -12(%rbp)
	jle	.L19
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14+deb12u1) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
