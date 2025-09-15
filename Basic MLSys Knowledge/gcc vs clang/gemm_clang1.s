	.text
	.file	"compare_matmul.cpp"
	.globl	_Z10gemm_basicPfS_S_iii         # -- Begin function _Z10gemm_basicPfS_S_iii
	.p2align	4, 0x90
	.type	_Z10gemm_basicPfS_S_iii,@function
_Z10gemm_basicPfS_S_iii:                # @_Z10gemm_basicPfS_S_iii
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	testl	%ecx, %ecx
	jle	.LBB0_10
# %bb.1:
	testl	%r8d, %r8d
	jle	.LBB0_10
# %bb.2:
	testl	%r9d, %r9d
	movl	%r8d, %r10d
	jle	.LBB0_3
# %bb.4:
	movl	%r9d, %r14d
	movl	%ecx, %r8d
	leaq	(,%r10,4), %rax
	xorl	%r11d, %r11d
	leaq	(,%r14,4), %r9
	.p2align	4, 0x90
.LBB0_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_6 Depth 2
                                        #       Child Loop BB0_7 Depth 3
	movq	%r11, %r15
	movq	%rsi, %r12
	xorl	%r13d, %r13d
	imulq	%r10, %r15
	.p2align	4, 0x90
.LBB0_6:                                #   Parent Loop BB0_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_7 Depth 3
	vxorps	%xmm0, %xmm0, %xmm0
	movq	%r14, %rcx
	movq	%rdi, %rbx
	movq	%r12, %rbp
	.p2align	4, 0x90
.LBB0_7:                                #   Parent Loop BB0_5 Depth=1
                                        #     Parent Loop BB0_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	(%rbx), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	addq	$4, %rbx
	vfmadd231ss	(%rbp), %xmm1, %xmm0    # xmm0 = (xmm1 * mem) + xmm0
	addq	%rax, %rbp
	addq	$-1, %rcx
	jne	.LBB0_7
# %bb.8:                                #   in Loop: Header=BB0_6 Depth=2
	leaq	(%r13,%r15), %rcx
	addq	$1, %r13
	addq	$4, %r12
	cmpq	%r10, %r13
	vmovss	%xmm0, (%rdx,%rcx,4)
	jne	.LBB0_6
# %bb.9:                                #   in Loop: Header=BB0_5 Depth=1
	addq	$1, %r11
	addq	%r9, %rdi
	cmpq	%r8, %r11
	jne	.LBB0_5
	jmp	.LBB0_10
.LBB0_3:
	movl	%ecx, %ecx
	movq	%rdx, %rdi
	xorl	%esi, %esi
	imulq	%r10, %rcx
	shlq	$2, %rcx
	movq	%rcx, %rdx
	callq	memset@PLT
.LBB0_10:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	_Z10gemm_basicPfS_S_iii, .Lfunc_end0-_Z10gemm_basicPfS_S_iii
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_compare_matmul.cpp
	.type	_GLOBAL__sub_I_compare_matmul.cpp,@function
_GLOBAL__sub_I_compare_matmul.cpp:      # @_GLOBAL__sub_I_compare_matmul.cpp
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	leaq	_ZStL8__ioinit(%rip), %rbx
	movq	%rbx, %rdi
	callq	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	__dso_handle(%rip), %rdx
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit@PLT                # TAILCALL
.Lfunc_end1:
	.size	_GLOBAL__sub_I_compare_matmul.cpp, .Lfunc_end1-_GLOBAL__sub_I_compare_matmul.cpp
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_compare_matmul.cpp
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _GLOBAL__sub_I_compare_matmul.cpp
	.addrsig_sym _ZStL8__ioinit
	.addrsig_sym __dso_handle
