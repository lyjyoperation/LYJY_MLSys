	.text
	.file	"gemm_test.cpp"
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
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function _Z11init_matrixPfii
.LCPI1_0:
	.long	0x4f800000                      # float 4.2949673E+9
.LCPI1_1:
	.long	0x40000000                      # float 2
.LCPI1_2:
	.long	0x5f000000                      # float 9.22337203E+18
.LCPI1_3:
	.long	0x3f800000                      # float 1
.LCPI1_10:
	.long	0x00000000                      # float 0
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_4:
	.quad	-2147483648                     # 0xffffffff80000000
.LCPI1_5:
	.quad	2147483646                      # 0x7ffffffe
.LCPI1_6:
	.quad	2567483615                      # 0x9908b0df
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI1_7:
	.quad	-2147483648                     # 0xffffffff80000000
	.quad	-2147483648                     # 0xffffffff80000000
.LCPI1_8:
	.quad	2147483646                      # 0x7ffffffe
	.quad	2147483646                      # 0x7ffffffe
.LCPI1_9:
	.quad	2567483615                      # 0x9908b0df
	.quad	2567483615                      # 0x9908b0df
	.text
	.globl	_Z11init_matrixPfii
	.p2align	4, 0x90
	.type	_Z11init_matrixPfii,@function
_Z11init_matrixPfii:                    # @_Z11init_matrixPfii
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception0
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
	subq	$10200, %rsp                    # imm = 0x27D8
	.cfi_def_cfa_offset 10256
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	216(%rsp), %rbp
	movl	%edx, %ebx
	movl	%esi, %r14d
	movq	%rdi, 16(%rsp)                  # 8-byte Spill
	movq	%rbp, 200(%rsp)
	movl	$1634100580, 216(%rsp)          # imm = 0x61666564
	movl	$1953264993, 219(%rsp)          # imm = 0x746C7561
	movq	$7, 208(%rsp)
	movb	$0, 223(%rsp)
.Ltmp0:
	leaq	5200(%rsp), %rdi
	leaq	200(%rsp), %rsi
	callq	_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.Ltmp1:
# %bb.1:
	movq	200(%rsp), %rdi
	cmpq	%rbp, %rdi
	je	.LBB1_3
# %bb.2:
	callq	_ZdlPv@PLT
.LBB1_3:
.Ltmp3:
	leaq	5200(%rsp), %rdi
	callq	_ZNSt13random_device9_M_getvalEv@PLT
.Ltmp4:
# %bb.4:
	movl	%eax, %r15d
	movl	$1, %eax
	movq	$-4984, %rcx                    # imm = 0xEC88
	movabsq	$945986875574848801, %rsi       # imm = 0xD20D20D20D20D21
	movq	%r15, %rdi
	movq	%r15, 200(%rsp)
	.p2align	4, 0x90
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdx
	movl	%eax, %ebp
	addq	$1, %rax
	shrq	$4, %rdx
	mulxq	%rsi, %rdx, %rdx
	shrq	%rdx
	imull	$624, %edx, %edx                # imm = 0x270
	subl	%edx, %ebp
	movq	%rdi, %rdx
	shrq	$30, %rdx
	xorl	%edi, %edx
	imull	$1812433253, %edx, %edi         # imm = 0x6C078965
	addl	%ebp, %edi
	movq	%rdi, 5192(%rsp,%rcx)
	addq	$8, %rcx
	jne	.LBB1_5
# %bb.6:
	imull	%r14d, %ebx
	movq	$624, 5192(%rsp)                # imm = 0x270
	testl	%ebx, %ebx
	jle	.LBB1_26
# %bb.7:
	vbroadcastsd	.LCPI1_4(%rip), %ymm0   # ymm0 = [18446744071562067968,18446744071562067968,18446744071562067968,18446744071562067968]
	vpbroadcastq	.LCPI1_5(%rip), %ymm2   # ymm2 = [2147483646,2147483646,2147483646,2147483646]
	vpbroadcastq	.LCPI1_6(%rip), %ymm1   # ymm1 = [2567483615,2567483615,2567483615,2567483615]
	flds	.LCPI1_0(%rip)
	fstpt	72(%rsp)                        # 10-byte Folded Spill
	movl	%ebx, %r14d
	movl	$2567483615, %ebp               # imm = 0x9908B0DF
	movl	$624, %r12d                     # imm = 0x270
	xorl	%r13d, %r13d
	movq	$-2147483648, %rbx              # imm = 0x80000000
	flds	.LCPI1_1(%rip)
	fstpt	60(%rsp)                        # 10-byte Folded Spill
	flds	.LCPI1_2(%rip)
	fstpt	48(%rsp)                        # 10-byte Folded Spill
	fldz
	fstpt	36(%rsp)                        # 10-byte Folded Spill
	vmovups	%ymm0, 160(%rsp)                # 32-byte Spill
	vmovdqu	%ymm2, 128(%rsp)                # 32-byte Spill
	vmovdqu	%ymm1, 96(%rsp)                 # 32-byte Spill
	.p2align	4, 0x90
.LBB1_8:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_9 Depth 2
                                        #       Child Loop BB1_11 Depth 3
                                        #       Child Loop BB1_13 Depth 3
	fldt	72(%rsp)                        # 10-byte Folded Reload
	fstpt	(%rsp)
	vzeroupper
	callq	logl@PLT
	fstpt	84(%rsp)                        # 10-byte Folded Spill
	fldt	60(%rsp)                        # 10-byte Folded Reload
	fstpt	(%rsp)
	callq	logl@PLT
	fldt	84(%rsp)                        # 10-byte Folded Reload
	fdivp	%st, %st(1)
	fldt	48(%rsp)                        # 10-byte Folded Reload
	xorl	%ecx, %ecx
	fxch	%st(1)
	fucomi	%st(1), %st
	fldt	36(%rsp)                        # 10-byte Folded Reload
	fcmovnb	%st(2), %st
	fstp	%st(2)
	fsubp	%st, %st(1)
	fisttpll	24(%rsp)
	vmovdqa	.LCPI1_7(%rip), %xmm1           # xmm1 = [18446744071562067968,18446744071562067968]
	vmovss	.LCPI1_3(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	vxorps	%xmm15, %xmm15, %xmm15
	setae	%cl
	xorl	%edx, %edx
	shlq	$63, %rcx
	xorq	24(%rsp), %rcx
	leaq	23(%rcx), %rax
	divq	%rcx
	movl	$1, %ecx
	testq	%rax, %rax
	cmoveq	%rcx, %rax
	jmp	.LBB1_9
	.p2align	4, 0x90
.LBB1_21:                               #   in Loop: Header=BB1_9 Depth=2
	vcvtsi2ss	%rcx, %xmm11, %xmm2
	vfmadd231ss	%xmm2, %xmm0, %xmm15    # xmm15 = (xmm0 * xmm2) + xmm15
	vmulss	.LCPI1_0(%rip), %xmm0, %xmm0
	addq	$-1, %rax
	je	.LBB1_23
.LBB1_9:                                #   Parent Loop BB1_8 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_11 Depth 3
                                        #       Child Loop BB1_13 Depth 3
	cmpq	$624, %r12                      # imm = 0x270
	jb	.LBB1_15
# %bb.10:                               #   in Loop: Header=BB1_9 Depth=2
	vmovdqu	160(%rsp), %ymm11               # 32-byte Reload
	vmovdqu	128(%rsp), %ymm12               # 32-byte Reload
	vmovdqu	96(%rsp), %ymm14                # 32-byte Reload
	vmovq	%r15, %xmm2
	movq	$-224, %rcx
	vpxor	%xmm13, %xmm13, %xmm13
	vpbroadcastq	%xmm2, %ymm2
	.p2align	4, 0x90
.LBB1_11:                               #   Parent Loop BB1_8 Depth=1
                                        #     Parent Loop BB1_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu	2000(%rsp,%rcx,8), %ymm5
	vmovdqu	2032(%rsp,%rcx,8), %ymm4
	vmovdqu	2064(%rsp,%rcx,8), %ymm3
	vperm2i128	$33, %ymm5, %ymm2, %ymm6 # ymm6 = ymm2[2,3],ymm5[0,1]
	vmovdqu	2096(%rsp,%rcx,8), %ymm2
	vperm2i128	$33, %ymm4, %ymm5, %ymm7 # ymm7 = ymm5[2,3],ymm4[0,1]
	vperm2i128	$33, %ymm3, %ymm4, %ymm8 # ymm8 = ymm4[2,3],ymm3[0,1]
	vpand	%ymm5, %ymm12, %ymm10
	vpalignr	$8, %ymm6, %ymm5, %ymm6         # ymm6 = ymm6[8,9,10,11,12,13,14,15],ymm5[0,1,2,3,4,5,6,7],ymm6[24,25,26,27,28,29,30,31],ymm5[16,17,18,19,20,21,22,23]
	vpalignr	$8, %ymm7, %ymm4, %ymm7         # ymm7 = ymm7[8,9,10,11,12,13,14,15],ymm4[0,1,2,3,4,5,6,7],ymm7[24,25,26,27,28,29,30,31],ymm4[16,17,18,19,20,21,22,23]
	vpalignr	$8, %ymm8, %ymm3, %ymm8         # ymm8 = ymm8[8,9,10,11,12,13,14,15],ymm3[0,1,2,3,4,5,6,7],ymm8[24,25,26,27,28,29,30,31],ymm3[16,17,18,19,20,21,22,23]
	vpsllq	$63, %ymm5, %ymm5
	vpand	%ymm6, %ymm11, %ymm6
	vpand	%ymm7, %ymm11, %ymm7
	vpand	%ymm11, %ymm8, %ymm8
	vpcmpgtq	%ymm5, %ymm13, %ymm5
	vpor	%ymm6, %ymm10, %ymm6
	vperm2i128	$33, %ymm2, %ymm3, %ymm9 # ymm9 = ymm3[2,3],ymm2[0,1]
	vpand	%ymm4, %ymm12, %ymm10
	vpand	%ymm5, %ymm14, %ymm5
	vpsllq	$63, %ymm4, %ymm4
	vpor	%ymm7, %ymm10, %ymm7
	vpalignr	$8, %ymm9, %ymm2, %ymm9         # ymm9 = ymm9[8,9,10,11,12,13,14,15],ymm2[0,1,2,3,4,5,6,7],ymm9[24,25,26,27,28,29,30,31],ymm2[16,17,18,19,20,21,22,23]
	vpand	%ymm3, %ymm12, %ymm10
	vpsrlq	$1, %ymm6, %ymm6
	vpxor	5168(%rsp,%rcx,8), %ymm6, %ymm6
	vpsllq	$63, %ymm3, %ymm3
	vpcmpgtq	%ymm4, %ymm13, %ymm4
	vpor	%ymm8, %ymm10, %ymm8
	vpand	%ymm11, %ymm9, %ymm9
	vpand	%ymm2, %ymm12, %ymm10
	vpsrlq	$1, %ymm7, %ymm7
	vpxor	5200(%rsp,%rcx,8), %ymm7, %ymm7
	vpcmpgtq	%ymm3, %ymm13, %ymm3
	vpand	%ymm4, %ymm14, %ymm4
	vpor	%ymm9, %ymm10, %ymm9
	vpsrlq	$1, %ymm8, %ymm8
	vpxor	5232(%rsp,%rcx,8), %ymm8, %ymm8
	vpand	%ymm3, %ymm14, %ymm3
	vpsrlq	$1, %ymm9, %ymm9
	vpxor	5264(%rsp,%rcx,8), %ymm9, %ymm9
	vpxor	%ymm5, %ymm6, %ymm5
	vpsllq	$63, %ymm2, %ymm6
	vpcmpgtq	%ymm6, %ymm13, %ymm6
	vpxor	%ymm4, %ymm7, %ymm4
	vmovdqu	%ymm5, 1992(%rsp,%rcx,8)
	vpand	%ymm6, %ymm14, %ymm6
	vpxor	%ymm3, %ymm8, %ymm3
	vmovdqu	%ymm4, 2024(%rsp,%rcx,8)
	vpxor	%ymm6, %ymm9, %ymm6
	vmovdqu	%ymm3, 2056(%rsp,%rcx,8)
	vmovdqu	%ymm6, 2088(%rsp,%rcx,8)
	addq	$16, %rcx
	jne	.LBB1_11
# %bb.12:                               #   in Loop: Header=BB1_9 Depth=2
	movq	2000(%rsp), %rsi
	vextracti128	$1, %ymm2, %xmm2
	movq	2008(%rsp), %rcx
	vmovdqa	.LCPI1_8(%rip), %xmm5           # xmm5 = [2147483646,2147483646]
	vmovdqa	.LCPI1_9(%rip), %xmm7           # xmm7 = [2567483615,2567483615]
	vpxor	%xmm6, %xmm6, %xmm6
	vpextrq	$1, %xmm2, %rdx
	andq	$-2147483648, %rdx              # imm = 0x80000000
	movl	%esi, %edi
	andl	$2147483646, %edi               # imm = 0x7FFFFFFE
	orq	%rdx, %rdi
	movl	%esi, %edx
	andq	$-2147483648, %rsi              # imm = 0x80000000
	shrq	%rdi
	xorq	5168(%rsp), %rdi
	andl	$1, %edx
	negl	%edx
	andl	%ebp, %edx
	xorq	%rdi, %rdx
	movq	%rdx, 1992(%rsp)
	movl	%ecx, %edx
	andl	$2147483646, %edx               # imm = 0x7FFFFFFE
	orq	%rsi, %rdx
	movl	%ecx, %esi
	andq	$-2147483648, %rcx              # imm = 0x80000000
	shrq	%rdx
	xorq	5176(%rsp), %rdx
	andl	$1, %esi
	negl	%esi
	andl	%ebp, %esi
	xorq	%rdx, %rsi
	movq	%rsi, 2000(%rsp)
	movq	2016(%rsp), %rdx
	movl	%edx, %esi
	vmovq	%rdx, %xmm2
                                        # kill: def $edx killed $edx killed $rdx def $rdx
	andl	$2147483646, %edx               # imm = 0x7FFFFFFE
	orq	%rcx, %rdx
	andl	$1, %esi
	vpbroadcastq	%xmm2, %xmm2
	movq	$-396, %rcx                     # imm = 0xFE74
	shrq	%rdx
	xorq	5184(%rsp), %rdx
	negl	%esi
	andl	%ebp, %esi
	xorq	%rdx, %rsi
	movq	%rsi, 2008(%rsp)
	.p2align	4, 0x90
.LBB1_13:                               #   Parent Loop BB1_8 Depth=1
                                        #     Parent Loop BB1_9 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovdqu	5192(%rsp,%rcx,8), %xmm3
	vpalignr	$8, %xmm2, %xmm3, %xmm2         # xmm2 = xmm2[8,9,10,11,12,13,14,15],xmm3[0,1,2,3,4,5,6,7]
	vpand	%xmm5, %xmm3, %xmm4
	vpand	%xmm1, %xmm2, %xmm2
	vpor	%xmm2, %xmm4, %xmm2
	vpsllq	$63, %xmm3, %xmm4
	vpsrlq	$1, %xmm2, %xmm2
	vpxor	3368(%rsp,%rcx,8), %xmm2, %xmm2
	vpcmpgtq	%xmm4, %xmm6, %xmm4
	vpand	%xmm7, %xmm4, %xmm4
	vpxor	%xmm4, %xmm2, %xmm2
	vmovdqu	%xmm2, 5184(%rsp,%rcx,8)
	addq	$2, %rcx
	vmovdqa	%xmm3, %xmm2
	jne	.LBB1_13
# %bb.14:                               #   in Loop: Header=BB1_9 Depth=2
	movq	200(%rsp), %r15
	movq	5184(%rsp), %rcx
	movl	$2567483615, %esi               # imm = 0x9908B0DF
	xorl	%r12d, %r12d
	movl	%r15d, %edx
	andq	%rbx, %rcx
	andl	$2147483646, %edx               # imm = 0x7FFFFFFE
	orq	%rcx, %rdx
	movl	%r15d, %ecx
	shrq	%rdx
	xorq	3368(%rsp), %rdx
	andl	$1, %ecx
	negl	%ecx
	andl	%ecx, %esi
	xorq	%rdx, %rsi
	movq	%rsi, 5184(%rsp)
.LBB1_15:                               #   in Loop: Header=BB1_9 Depth=2
	movq	%r12, %rcx
	addq	$1, %r12
	movq	%r12, 5192(%rsp)
	movq	200(%rsp,%rcx,8), %rcx
	movq	%rcx, %rdx
	shrq	$11, %rdx
	movl	%edx, %edx
	xorq	%rcx, %rdx
	movl	%edx, %ecx
	andl	$20601005, %ecx                 # imm = 0x13A58AD
	shlq	$7, %rcx
	xorq	%rdx, %rcx
	movl	%ecx, %edx
	andl	$122764, %edx                   # imm = 0x1DF8C
	shlq	$15, %rdx
	xorq	%rcx, %rdx
	movq	%rdx, %rcx
	shrq	$18, %rcx
	xorq	%rdx, %rcx
	jns	.LBB1_21
# %bb.16:                               #   in Loop: Header=BB1_9 Depth=2
	movq	%rcx, %rdx
	andl	$1, %ecx
	shrq	%rdx
	orq	%rdx, %rcx
	vcvtsi2ss	%rcx, %xmm11, %xmm2
	vaddss	%xmm2, %xmm2, %xmm2
	vfmadd231ss	%xmm2, %xmm0, %xmm15    # xmm15 = (xmm0 * xmm2) + xmm15
	vmulss	.LCPI1_0(%rip), %xmm0, %xmm0
	addq	$-1, %rax
	jne	.LBB1_9
.LBB1_23:                               #   in Loop: Header=BB1_8 Depth=1
	vdivss	%xmm0, %xmm15, %xmm0
	vucomiss	.LCPI1_3(%rip), %xmm0
	jae	.LBB1_24
.LBB1_25:                               #   in Loop: Header=BB1_8 Depth=1
	vaddss	.LCPI1_10(%rip), %xmm0, %xmm0
	movq	16(%rsp), %rax                  # 8-byte Reload
	vmovss	%xmm0, (%rax,%r13,4)
	addq	$1, %r13
	cmpq	%r14, %r13
	jne	.LBB1_8
	jmp	.LBB1_26
.LBB1_24:                               #   in Loop: Header=BB1_8 Depth=1
	vmovss	.LCPI1_3(%rip), %xmm0           # xmm0 = mem[0],zero,zero,zero
	vpxor	%xmm1, %xmm1, %xmm1
	vzeroupper
	callq	nextafterf@PLT
	jmp	.LBB1_25
.LBB1_26:
.Ltmp9:
	leaq	5200(%rsp), %rdi
	vzeroupper
	callq	_ZNSt13random_device7_M_finiEv@PLT
.Ltmp10:
# %bb.27:
	addq	$10200, %rsp                    # imm = 0x27D8
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
.LBB1_20:
	.cfi_def_cfa_offset 10256
.Ltmp11:
	movq	%rax, %rdi
	callq	__clang_call_terminate
.LBB1_29:
.Ltmp5:
	movq	%rax, %rbx
.Ltmp6:
	leaq	5200(%rsp), %rdi
	callq	_ZNSt13random_device7_M_finiEv@PLT
.Ltmp7:
	jmp	.LBB1_19
.LBB1_28:
.Ltmp8:
	movq	%rax, %rdi
	callq	__clang_call_terminate
.LBB1_17:
.Ltmp2:
	movq	200(%rsp), %rdi
	movq	%rax, %rbx
	cmpq	%rbp, %rdi
	je	.LBB1_19
# %bb.18:
	callq	_ZdlPv@PLT
.LBB1_19:
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end1:
	.size	_Z11init_matrixPfii, .Lfunc_end1-_Z11init_matrixPfii
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2
GCC_except_table1:
.Lexception0:
	.byte	255                             # @LPStart Encoding = omit
	.byte	155                             # @TType Encoding = indirect pcrel sdata4
	.uleb128 .Lttbase0-.Lttbaseref0
.Lttbaseref0:
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Ltmp0-.Lfunc_begin0           # >> Call Site 1 <<
	.uleb128 .Ltmp1-.Ltmp0                  #   Call between .Ltmp0 and .Ltmp1
	.uleb128 .Ltmp2-.Lfunc_begin0           #     jumps to .Ltmp2
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp3-.Lfunc_begin0           # >> Call Site 2 <<
	.uleb128 .Ltmp4-.Ltmp3                  #   Call between .Ltmp3 and .Ltmp4
	.uleb128 .Ltmp5-.Lfunc_begin0           #     jumps to .Ltmp5
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp9-.Lfunc_begin0           # >> Call Site 3 <<
	.uleb128 .Ltmp10-.Ltmp9                 #   Call between .Ltmp9 and .Ltmp10
	.uleb128 .Ltmp11-.Lfunc_begin0          #     jumps to .Ltmp11
	.byte	1                               #   On action: 1
	.uleb128 .Ltmp6-.Lfunc_begin0           # >> Call Site 4 <<
	.uleb128 .Ltmp7-.Ltmp6                  #   Call between .Ltmp6 and .Ltmp7
	.uleb128 .Ltmp8-.Lfunc_begin0           #     jumps to .Ltmp8
	.byte	1                               #   On action: 1
	.uleb128 .Ltmp7-.Lfunc_begin0           # >> Call Site 5 <<
	.uleb128 .Lfunc_end1-.Ltmp7             #   Call between .Ltmp7 and .Lfunc_end1
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end0:
	.byte	1                               # >> Action Record 1 <<
                                        #   Catch TypeInfo 1
	.byte	0                               #   No further actions
	.p2align	2
                                        # >> Catch TypeInfos <<
	.long	0                               # TypeInfo 1
.Lttbase0:
	.p2align	2
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function _Z13verify_resultPfS_S_iii
.LCPI2_0:
	.long	0x7fffffff                      # float NaN
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI2_1:
	.quad	0x3f1a36e2eb1c432d              # double 1.0E-4
	.text
	.globl	_Z13verify_resultPfS_S_iii
	.p2align	4, 0x90
	.type	_Z13verify_resultPfS_S_iii,@function
_Z13verify_resultPfS_S_iii:             # @_Z13verify_resultPfS_S_iii
.Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception1
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
	subq	$10104, %rsp                    # imm = 0x2778
	.cfi_def_cfa_offset 10160
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	leaq	120(%rsp), %rbx
	movl	%r9d, %r15d
	movl	%r8d, %r14d
	movl	%ecx, %ebp
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	movq	%rsi, 56(%rsp)                  # 8-byte Spill
	movq	%rdi, 64(%rsp)                  # 8-byte Spill
	movq	%rbx, 104(%rsp)
	movl	$1634100580, 120(%rsp)          # imm = 0x61666564
	movl	$1953264993, 123(%rsp)          # imm = 0x746C7561
	movq	$7, 112(%rsp)
	movb	$0, 127(%rsp)
.Ltmp12:
	leaq	5104(%rsp), %rdi
	leaq	104(%rsp), %rsi
	callq	_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT
.Ltmp13:
# %bb.1:
	movq	104(%rsp), %rdi
	cmpq	%rbx, %rdi
	je	.LBB2_3
# %bb.2:
	callq	_ZdlPv@PLT
.LBB2_3:
.Ltmp15:
	leaq	5104(%rsp), %rdi
	callq	_ZNSt13random_device9_M_getvalEv@PLT
.Ltmp16:
# %bb.4:
	movl	%eax, %eax
	movl	$1, %ecx
	movq	$-4984, %rsi                    # imm = 0xEC88
	movabsq	$945986875574848801, %rdi       # imm = 0xD20D20D20D20D21
	movq	%rax, 104(%rsp)
	.p2align	4, 0x90
.LBB2_5:                                # =>This Inner Loop Header: Depth=1
	movq	%rcx, %rdx
	movl	%ecx, %ebx
	addq	$1, %rcx
	shrq	$4, %rdx
	mulxq	%rdi, %rdx, %rdx
	shrq	%rdx
	imull	$624, %edx, %edx                # imm = 0x270
	subl	%edx, %ebx
	movq	%rax, %rdx
	shrq	$30, %rdx
	xorl	%eax, %edx
	imull	$1812433253, %edx, %eax         # imm = 0x6C078965
	addl	%ebx, %eax
	movq	%rax, 5096(%rsp,%rsi)
	addq	$8, %rsi
	jne	.LBB2_5
# %bb.6:
	addl	$-1, %ebp
	movq	%r14, %rax
	testl	%r15d, %r15d
	leal	-1(%r14), %eax
	movl	$0, 40(%rsp)
	movl	$0, 32(%rsp)
	movq	$624, 5096(%rsp)                # imm = 0x270
	movq	%r14, 16(%rsp)                  # 8-byte Spill
	movl	%ebp, 44(%rsp)
	movl	%eax, 36(%rsp)
	jle	.LBB2_7
# %bb.46:
.Ltmp40:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp41:
# %bb.47:
	movl	%eax, %ebp
.Ltmp42:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp43:
# %bb.48:
	movl	%ebp, %ecx
	movslq	16(%rsp), %r13                  # 4-byte Folded Reload
	movq	56(%rsp), %rdx                  # 8-byte Reload
	movq	64(%rsp), %rsi                  # 8-byte Reload
	movl	%eax, %r12d
	movl	%r15d, %r14d
	vxorps	%xmm1, %xmm1, %xmm1
	movl	%r15d, 52(%rsp)                 # 4-byte Spill
	imull	%r15d, %ecx
	movslq	%r12d, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%r14, %rdx
	movslq	%ecx, %rcx
	shlq	$2, %r13
	leaq	(%rsi,%rcx,4), %rcx
	.p2align	4, 0x90
.LBB2_49:                               # =>This Inner Loop Header: Depth=1
	vmovss	(%rcx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	addq	$4, %rcx
	vfmadd231ss	(%rax), %xmm0, %xmm1    # xmm1 = (xmm0 * mem) + xmm1
	addq	%r13, %rax
	addq	$-1, %rdx
	jne	.LBB2_49
# %bb.50:
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movl	%r12d, %ecx
	vbroadcastss	.LCPI2_0(%rip), %xmm2   # xmm2 = [NaN,NaN,NaN,NaN]
	vmovss	%xmm1, 12(%rsp)                 # 4-byte Spill
	vmovaps	%xmm2, 80(%rsp)                 # 16-byte Spill
	addl	%eax, %ecx
	movslq	%ecx, %r15
	movq	24(%rsp), %rcx                  # 8-byte Reload
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm1, %xmm0, %xmm0
	vandps	%xmm2, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI2_1(%rip), %xmm0
	ja	.LBB2_51
# %bb.26:
.Ltmp44:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp45:
	movl	52(%rsp), %ebx                  # 4-byte Reload
# %bb.27:
	movl	%eax, %ebp
.Ltmp46:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp47:
# %bb.28:
	movl	%ebp, %ecx
	movq	56(%rsp), %rdx                  # 8-byte Reload
	movq	64(%rsp), %rsi                  # 8-byte Reload
	movl	%eax, %r12d
	vxorps	%xmm1, %xmm1, %xmm1
	imull	%ebx, %ecx
	movslq	%r12d, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%r14, %rdx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx,4), %rcx
	.p2align	4, 0x90
.LBB2_29:                               # =>This Inner Loop Header: Depth=1
	vmovss	(%rcx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	addq	$4, %rcx
	vfmadd231ss	(%rax), %xmm0, %xmm1    # xmm1 = (xmm0 * mem) + xmm1
	addq	%r13, %rax
	addq	$-1, %rdx
	jne	.LBB2_29
# %bb.30:
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movl	%r12d, %ecx
	vmovss	%xmm1, 12(%rsp)                 # 4-byte Spill
	addl	%eax, %ecx
	movslq	%ecx, %r15
	movq	24(%rsp), %rcx                  # 8-byte Reload
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm1, %xmm0, %xmm0
	vandps	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI2_1(%rip), %xmm0
	ja	.LBB2_51
# %bb.31:
.Ltmp48:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp49:
	movl	52(%rsp), %ebx                  # 4-byte Reload
# %bb.32:
	movl	%eax, %ebp
.Ltmp50:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp51:
# %bb.33:
	movl	%ebp, %ecx
	movq	56(%rsp), %rdx                  # 8-byte Reload
	movq	64(%rsp), %rsi                  # 8-byte Reload
	movl	%eax, %r12d
	vxorps	%xmm1, %xmm1, %xmm1
	imull	%ebx, %ecx
	movslq	%r12d, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%r14, %rdx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx,4), %rcx
	.p2align	4, 0x90
.LBB2_34:                               # =>This Inner Loop Header: Depth=1
	vmovss	(%rcx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	addq	$4, %rcx
	vfmadd231ss	(%rax), %xmm0, %xmm1    # xmm1 = (xmm0 * mem) + xmm1
	addq	%r13, %rax
	addq	$-1, %rdx
	jne	.LBB2_34
# %bb.35:
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movl	%r12d, %ecx
	vmovss	%xmm1, 12(%rsp)                 # 4-byte Spill
	addl	%eax, %ecx
	movslq	%ecx, %r15
	movq	24(%rsp), %rcx                  # 8-byte Reload
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm1, %xmm0, %xmm0
	vandps	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI2_1(%rip), %xmm0
	ja	.LBB2_51
# %bb.36:
.Ltmp52:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp53:
	movl	52(%rsp), %ebx                  # 4-byte Reload
# %bb.37:
	movl	%eax, %ebp
.Ltmp54:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp55:
# %bb.38:
	movl	%ebp, %ecx
	movq	56(%rsp), %rdx                  # 8-byte Reload
	movq	64(%rsp), %rsi                  # 8-byte Reload
	movl	%eax, %r12d
	vxorps	%xmm1, %xmm1, %xmm1
	imull	%ebx, %ecx
	movslq	%r12d, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%r14, %rdx
	movslq	%ecx, %rcx
	leaq	(%rsi,%rcx,4), %rcx
	.p2align	4, 0x90
.LBB2_39:                               # =>This Inner Loop Header: Depth=1
	vmovss	(%rcx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	addq	$4, %rcx
	vfmadd231ss	(%rax), %xmm0, %xmm1    # xmm1 = (xmm0 * mem) + xmm1
	addq	%r13, %rax
	addq	$-1, %rdx
	jne	.LBB2_39
# %bb.40:
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movl	%r12d, %ecx
	vmovss	%xmm1, 12(%rsp)                 # 4-byte Spill
	addl	%eax, %ecx
	movslq	%ecx, %r15
	movq	24(%rsp), %rcx                  # 8-byte Reload
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm1, %xmm0, %xmm0
	vandps	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI2_1(%rip), %xmm0
	ja	.LBB2_51
# %bb.41:
.Ltmp56:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp57:
	movl	52(%rsp), %r15d                 # 4-byte Reload
# %bb.42:
	movl	%eax, %ebp
.Ltmp59:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp60:
# %bb.43:
	imull	%ebp, %r15d
	movq	56(%rsp), %rdx                  # 8-byte Reload
	movq	64(%rsp), %rsi                  # 8-byte Reload
	movl	%eax, %r12d
	cltq
	vxorps	%xmm1, %xmm1, %xmm1
	movslq	%r15d, %rcx
	leaq	(%rdx,%rax,4), %rax
	leaq	(%rsi,%rcx,4), %rcx
	.p2align	4, 0x90
.LBB2_44:                               # =>This Inner Loop Header: Depth=1
	vmovss	(%rcx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	addq	$4, %rcx
	vfmadd231ss	(%rax), %xmm0, %xmm1    # xmm1 = (xmm0 * mem) + xmm1
	addq	%r13, %rax
	addq	$-1, %r14
	jne	.LBB2_44
# %bb.45:
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movl	%r12d, %ecx
	vmovss	%xmm1, 12(%rsp)                 # 4-byte Spill
	addl	%eax, %ecx
	movslq	%ecx, %r15
	movq	24(%rsp), %rcx                  # 8-byte Reload
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm1, %xmm0, %xmm0
	vandps	80(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	jmp	.LBB2_22
.LBB2_7:
.Ltmp18:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp19:
# %bb.8:
	movl	%eax, %ebp
.Ltmp20:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp21:
# %bb.9:
	movl	%eax, %r12d
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movq	24(%rsp), %rcx                  # 8-byte Reload
	vbroadcastss	.LCPI2_0(%rip), %xmm1   # xmm1 = [NaN,NaN,NaN,NaN]
	vmovaps	%xmm1, 64(%rsp)                 # 16-byte Spill
	addl	%r12d, %eax
	movslq	%eax, %r15
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vandps	%xmm1, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI2_1(%rip), %xmm0
	vxorps	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 12(%rsp)                 # 4-byte Spill
	ja	.LBB2_51
# %bb.10:
.Ltmp22:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp23:
# %bb.11:
	movl	%eax, %ebp
.Ltmp24:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp25:
# %bb.12:
	movl	%eax, %r12d
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movq	24(%rsp), %rcx                  # 8-byte Reload
	addl	%r12d, %eax
	movslq	%eax, %r15
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vandps	64(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI2_1(%rip), %xmm0
	ja	.LBB2_51
# %bb.13:
.Ltmp26:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp27:
# %bb.14:
	movl	%eax, %ebp
.Ltmp28:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp29:
# %bb.15:
	movl	%eax, %r12d
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movq	24(%rsp), %rcx                  # 8-byte Reload
	addl	%r12d, %eax
	movslq	%eax, %r15
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vandps	64(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI2_1(%rip), %xmm0
	ja	.LBB2_51
# %bb.16:
.Ltmp30:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp31:
# %bb.17:
	movl	%eax, %ebp
.Ltmp32:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp33:
# %bb.18:
	movl	%eax, %r12d
	movl	%ebp, %eax
	imull	16(%rsp), %eax                  # 4-byte Folded Reload
	movq	24(%rsp), %rcx                  # 8-byte Reload
	addl	%r12d, %eax
	movslq	%eax, %r15
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vandps	64(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vucomisd	.LCPI2_1(%rip), %xmm0
	ja	.LBB2_51
# %bb.19:
.Ltmp34:
	leaq	40(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp35:
# %bb.20:
	movl	%eax, %ebp
.Ltmp37:
	leaq	32(%rsp), %rdi
	leaq	104(%rsp), %rsi
	movq	%rdi, %rdx
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
.Ltmp38:
# %bb.21:
	movl	%eax, %r12d
	movq	16(%rsp), %rax                  # 8-byte Reload
	movq	24(%rsp), %rcx                  # 8-byte Reload
	imull	%ebp, %eax
	addl	%r12d, %eax
	movslq	%eax, %r15
	vmovss	(%rcx,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vandps	64(%rsp), %xmm0, %xmm0          # 16-byte Folded Reload
.LBB2_22:
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movb	$1, %bl
	vucomisd	.LCPI2_1(%rip), %xmm0
	jbe	.LBB2_73
.LBB2_51:
.Ltmp62:
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	leaq	.L.str(%rip), %rsi
	movl	$13, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.Ltmp63:
# %bb.52:
.Ltmp64:
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movl	%ebp, %esi
	callq	_ZNSolsEi@PLT
.Ltmp65:
# %bb.53:
	movq	%rax, %rbx
.Ltmp66:
	leaq	.L.str.1(%rip), %rsi
	movl	$2, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.Ltmp67:
# %bb.54:
.Ltmp68:
	movq	%rbx, %rdi
	movl	%r12d, %esi
	callq	_ZNSolsEi@PLT
.Ltmp69:
# %bb.55:
	movq	%rax, %rbx
.Ltmp70:
	leaq	.L.str.2(%rip), %rsi
	movl	$3, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.Ltmp71:
# %bb.56:
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	(%rax,%r15,4), %xmm0            # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
.Ltmp72:
	movq	%rbx, %rdi
	callq	_ZNSo9_M_insertIdEERSoT_@PLT
.Ltmp73:
# %bb.57:
	movq	%rax, %rbx
.Ltmp74:
	leaq	.L.str.3(%rip), %rsi
	movl	$4, %edx
	movq	%rax, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.Ltmp75:
# %bb.58:
	vmovss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
.Ltmp76:
	movq	%rbx, %rdi
	callq	_ZNSo9_M_insertIdEERSoT_@PLT
.Ltmp77:
# %bb.59:
	movq	%rax, %rbx
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbx,%rax), %rbp
	testq	%rbp, %rbp
	je	.LBB2_60
# %bb.66:
	cmpb	$0, 56(%rbp)
	je	.LBB2_68
# %bb.67:
	movb	67(%rbp), %al
	jmp	.LBB2_70
.LBB2_68:
.Ltmp78:
	movq	%rbp, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
.Ltmp79:
# %bb.69:
	movq	(%rbp), %rax
	movq	48(%rax), %rax
.Ltmp80:
	movq	%rbp, %rdi
	movl	$10, %esi
	callq	*%rax
.Ltmp81:
.LBB2_70:
.Ltmp82:
	movsbl	%al, %esi
	movq	%rbx, %rdi
	callq	_ZNSo3putEc@PLT
.Ltmp83:
# %bb.71:
.Ltmp84:
	movq	%rax, %rdi
	callq	_ZNSo5flushEv@PLT
.Ltmp85:
# %bb.72:
	xorl	%ebx, %ebx
.LBB2_73:
.Ltmp86:
	leaq	5104(%rsp), %rdi
	callq	_ZNSt13random_device7_M_finiEv@PLT
.Ltmp87:
# %bb.74:
	movl	%ebx, %eax
	addq	$10104, %rsp                    # imm = 0x2778
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
.LBB2_60:
	.cfi_def_cfa_offset 10160
.Ltmp89:
	callq	_ZSt16__throw_bad_castv@PLT
.Ltmp90:
# %bb.65:
.LBB2_64:
.Ltmp39:
	jmp	.LBB2_76
.LBB2_63:
.Ltmp36:
	jmp	.LBB2_76
.LBB2_78:
.Ltmp88:
	movq	%rax, %rdi
	callq	__clang_call_terminate
.LBB2_62:
.Ltmp17:
	jmp	.LBB2_76
.LBB2_23:
.Ltmp14:
	movq	104(%rsp), %rdi
	movq	%rax, %rbp
	cmpq	%rbx, %rdi
	je	.LBB2_25
# %bb.24:
	callq	_ZdlPv@PLT
	jmp	.LBB2_25
.LBB2_61:
.Ltmp61:
	jmp	.LBB2_76
.LBB2_75:
.Ltmp58:
	jmp	.LBB2_76
.LBB2_77:
.Ltmp91:
.LBB2_76:
	movq	%rax, %rbp
.Ltmp92:
	leaq	5104(%rsp), %rdi
	callq	_ZNSt13random_device7_M_finiEv@PLT
.Ltmp93:
.LBB2_25:
	movq	%rbp, %rdi
	callq	_Unwind_Resume@PLT
.LBB2_79:
.Ltmp94:
	movq	%rax, %rdi
	callq	__clang_call_terminate
.Lfunc_end2:
	.size	_Z13verify_resultPfS_S_iii, .Lfunc_end2-_Z13verify_resultPfS_S_iii
	.cfi_endproc
	.section	.gcc_except_table,"a",@progbits
	.p2align	2
GCC_except_table2:
.Lexception1:
	.byte	255                             # @LPStart Encoding = omit
	.byte	155                             # @TType Encoding = indirect pcrel sdata4
	.uleb128 .Lttbase1-.Lttbaseref1
.Lttbaseref1:
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end1-.Lcst_begin1
.Lcst_begin1:
	.uleb128 .Ltmp12-.Lfunc_begin1          # >> Call Site 1 <<
	.uleb128 .Ltmp13-.Ltmp12                #   Call between .Ltmp12 and .Ltmp13
	.uleb128 .Ltmp14-.Lfunc_begin1          #     jumps to .Ltmp14
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp15-.Lfunc_begin1          # >> Call Site 2 <<
	.uleb128 .Ltmp16-.Ltmp15                #   Call between .Ltmp15 and .Ltmp16
	.uleb128 .Ltmp17-.Lfunc_begin1          #     jumps to .Ltmp17
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp40-.Lfunc_begin1          # >> Call Site 3 <<
	.uleb128 .Ltmp41-.Ltmp40                #   Call between .Ltmp40 and .Ltmp41
	.uleb128 .Ltmp58-.Lfunc_begin1          #     jumps to .Ltmp58
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp42-.Lfunc_begin1          # >> Call Site 4 <<
	.uleb128 .Ltmp43-.Ltmp42                #   Call between .Ltmp42 and .Ltmp43
	.uleb128 .Ltmp61-.Lfunc_begin1          #     jumps to .Ltmp61
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp44-.Lfunc_begin1          # >> Call Site 5 <<
	.uleb128 .Ltmp45-.Ltmp44                #   Call between .Ltmp44 and .Ltmp45
	.uleb128 .Ltmp58-.Lfunc_begin1          #     jumps to .Ltmp58
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp46-.Lfunc_begin1          # >> Call Site 6 <<
	.uleb128 .Ltmp47-.Ltmp46                #   Call between .Ltmp46 and .Ltmp47
	.uleb128 .Ltmp61-.Lfunc_begin1          #     jumps to .Ltmp61
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp48-.Lfunc_begin1          # >> Call Site 7 <<
	.uleb128 .Ltmp49-.Ltmp48                #   Call between .Ltmp48 and .Ltmp49
	.uleb128 .Ltmp58-.Lfunc_begin1          #     jumps to .Ltmp58
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp50-.Lfunc_begin1          # >> Call Site 8 <<
	.uleb128 .Ltmp51-.Ltmp50                #   Call between .Ltmp50 and .Ltmp51
	.uleb128 .Ltmp61-.Lfunc_begin1          #     jumps to .Ltmp61
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp52-.Lfunc_begin1          # >> Call Site 9 <<
	.uleb128 .Ltmp53-.Ltmp52                #   Call between .Ltmp52 and .Ltmp53
	.uleb128 .Ltmp58-.Lfunc_begin1          #     jumps to .Ltmp58
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp54-.Lfunc_begin1          # >> Call Site 10 <<
	.uleb128 .Ltmp55-.Ltmp54                #   Call between .Ltmp54 and .Ltmp55
	.uleb128 .Ltmp61-.Lfunc_begin1          #     jumps to .Ltmp61
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp56-.Lfunc_begin1          # >> Call Site 11 <<
	.uleb128 .Ltmp57-.Ltmp56                #   Call between .Ltmp56 and .Ltmp57
	.uleb128 .Ltmp58-.Lfunc_begin1          #     jumps to .Ltmp58
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp59-.Lfunc_begin1          # >> Call Site 12 <<
	.uleb128 .Ltmp60-.Ltmp59                #   Call between .Ltmp59 and .Ltmp60
	.uleb128 .Ltmp61-.Lfunc_begin1          #     jumps to .Ltmp61
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp18-.Lfunc_begin1          # >> Call Site 13 <<
	.uleb128 .Ltmp19-.Ltmp18                #   Call between .Ltmp18 and .Ltmp19
	.uleb128 .Ltmp36-.Lfunc_begin1          #     jumps to .Ltmp36
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp20-.Lfunc_begin1          # >> Call Site 14 <<
	.uleb128 .Ltmp21-.Ltmp20                #   Call between .Ltmp20 and .Ltmp21
	.uleb128 .Ltmp39-.Lfunc_begin1          #     jumps to .Ltmp39
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp22-.Lfunc_begin1          # >> Call Site 15 <<
	.uleb128 .Ltmp23-.Ltmp22                #   Call between .Ltmp22 and .Ltmp23
	.uleb128 .Ltmp36-.Lfunc_begin1          #     jumps to .Ltmp36
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp24-.Lfunc_begin1          # >> Call Site 16 <<
	.uleb128 .Ltmp25-.Ltmp24                #   Call between .Ltmp24 and .Ltmp25
	.uleb128 .Ltmp39-.Lfunc_begin1          #     jumps to .Ltmp39
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp26-.Lfunc_begin1          # >> Call Site 17 <<
	.uleb128 .Ltmp27-.Ltmp26                #   Call between .Ltmp26 and .Ltmp27
	.uleb128 .Ltmp36-.Lfunc_begin1          #     jumps to .Ltmp36
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp28-.Lfunc_begin1          # >> Call Site 18 <<
	.uleb128 .Ltmp29-.Ltmp28                #   Call between .Ltmp28 and .Ltmp29
	.uleb128 .Ltmp39-.Lfunc_begin1          #     jumps to .Ltmp39
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp30-.Lfunc_begin1          # >> Call Site 19 <<
	.uleb128 .Ltmp31-.Ltmp30                #   Call between .Ltmp30 and .Ltmp31
	.uleb128 .Ltmp36-.Lfunc_begin1          #     jumps to .Ltmp36
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp32-.Lfunc_begin1          # >> Call Site 20 <<
	.uleb128 .Ltmp33-.Ltmp32                #   Call between .Ltmp32 and .Ltmp33
	.uleb128 .Ltmp39-.Lfunc_begin1          #     jumps to .Ltmp39
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp34-.Lfunc_begin1          # >> Call Site 21 <<
	.uleb128 .Ltmp35-.Ltmp34                #   Call between .Ltmp34 and .Ltmp35
	.uleb128 .Ltmp36-.Lfunc_begin1          #     jumps to .Ltmp36
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp37-.Lfunc_begin1          # >> Call Site 22 <<
	.uleb128 .Ltmp38-.Ltmp37                #   Call between .Ltmp37 and .Ltmp38
	.uleb128 .Ltmp39-.Lfunc_begin1          #     jumps to .Ltmp39
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp62-.Lfunc_begin1          # >> Call Site 23 <<
	.uleb128 .Ltmp85-.Ltmp62                #   Call between .Ltmp62 and .Ltmp85
	.uleb128 .Ltmp91-.Lfunc_begin1          #     jumps to .Ltmp91
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp86-.Lfunc_begin1          # >> Call Site 24 <<
	.uleb128 .Ltmp87-.Ltmp86                #   Call between .Ltmp86 and .Ltmp87
	.uleb128 .Ltmp88-.Lfunc_begin1          #     jumps to .Ltmp88
	.byte	1                               #   On action: 1
	.uleb128 .Ltmp89-.Lfunc_begin1          # >> Call Site 25 <<
	.uleb128 .Ltmp90-.Ltmp89                #   Call between .Ltmp89 and .Ltmp90
	.uleb128 .Ltmp91-.Lfunc_begin1          #     jumps to .Ltmp91
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp92-.Lfunc_begin1          # >> Call Site 26 <<
	.uleb128 .Ltmp93-.Ltmp92                #   Call between .Ltmp92 and .Ltmp93
	.uleb128 .Ltmp94-.Lfunc_begin1          #     jumps to .Ltmp94
	.byte	1                               #   On action: 1
	.uleb128 .Ltmp93-.Lfunc_begin1          # >> Call Site 27 <<
	.uleb128 .Lfunc_end2-.Ltmp93            #   Call between .Ltmp93 and .Lfunc_end2
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end1:
	.byte	1                               # >> Action Record 1 <<
                                        #   Catch TypeInfo 1
	.byte	0                               #   No further actions
	.p2align	2
                                        # >> Catch TypeInfos <<
	.long	0                               # TypeInfo 1
.Lttbase1:
	.p2align	2
                                        # -- End function
	.text
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
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
	movl	$262144, %edi                   # imm = 0x40000
	callq	_Znam@PLT
	movl	$262144, %edi                   # imm = 0x40000
	movq	%rax, %r14
	callq	_Znam@PLT
	movl	$262144, %edi                   # imm = 0x40000
	movq	%rax, %r15
	callq	_Znam@PLT
	movq	%r14, %rdi
	movl	$256, %esi                      # imm = 0x100
	movl	$256, %edx                      # imm = 0x100
	movq	%rax, %rbx
	callq	_Z11init_matrixPfii
	movq	%r15, %rdi
	movl	$256, %esi                      # imm = 0x100
	movl	$256, %edx                      # imm = 0x100
	callq	_Z11init_matrixPfii
	xorl	%r13d, %r13d
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r12
	movq	%r14, %rax
	.p2align	4, 0x90
.LBB3_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
                                        #       Child Loop BB3_3 Depth 3
	movq	%r13, %rcx
	movq	%r15, %rbp
	xorl	%esi, %esi
	shlq	$8, %rcx
	.p2align	4, 0x90
.LBB3_2:                                #   Parent Loop BB3_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB3_3 Depth 3
	vxorps	%xmm0, %xmm0, %xmm0
	movq	$-1024, %rdi                    # imm = 0xFC00
	movq	%rbp, %rdx
	.p2align	4, 0x90
.LBB3_3:                                #   Parent Loop BB3_1 Depth=1
                                        #     Parent Loop BB3_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vmovss	1024(%rax,%rdi), %xmm1          # xmm1 = mem[0],zero,zero,zero
	vfmadd231ss	(%rdx), %xmm1, %xmm0    # xmm0 = (xmm1 * mem) + xmm0
	addq	$1024, %rdx                     # imm = 0x400
	addq	$4, %rdi
	jne	.LBB3_3
# %bb.4:                                #   in Loop: Header=BB3_2 Depth=2
	leaq	(%rsi,%rcx), %rdx
	addq	$1, %rsi
	addq	$4, %rbp
	cmpq	$256, %rsi                      # imm = 0x100
	vmovss	%xmm0, (%rbx,%rdx,4)
	jne	.LBB3_2
# %bb.5:                                #   in Loop: Header=BB3_1 Depth=1
	addq	$1, %r13
	addq	$1024, %rax                     # imm = 0x400
	cmpq	$256, %r13                      # imm = 0x100
	jne	.LBB3_1
# %bb.6:
	callq	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	subq	%r12, %rax
	movabsq	$4835703278458516699, %rcx      # imm = 0x431BDE82D7B634DB
	movq	_ZSt4cout@GOTPCREL(%rip), %r12
	leaq	.L.str.4(%rip), %rsi
	imulq	%rcx
	movq	%rdx, %rbp
	sarq	$18, %rdx
	shrq	$63, %rbp
	movq	%r12, %rdi
	addq	%rdx, %rbp
	movl	$27, %edx
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r12, %rdi
	movq	%rbp, %rsi
	callq	_ZNSo9_M_insertIlEERSoT_@PLT
	leaq	.L.str.5(%rip), %rsi
	movl	$3, %edx
	movq	%rax, %rdi
	movq	%rax, %r13
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r13), %rax
	movq	-24(%rax), %rax
	movq	240(%r13,%rax), %rbp
	testq	%rbp, %rbp
	je	.LBB3_19
# %bb.7:
	cmpb	$0, 56(%rbp)
	je	.LBB3_9
# %bb.8:
	movb	67(%rbp), %al
	jmp	.LBB3_10
.LBB3_9:
	movq	%rbp, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbp), %rax
	movq	%rbp, %rdi
	movl	$10, %esi
	movq	48(%rax), %rax
	callq	*%rax
.LBB3_10:
	movsbl	%al, %esi
	movq	%r13, %rdi
	callq	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	callq	_ZNSo5flushEv@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	movl	$256, %ecx                      # imm = 0x100
	movl	$256, %r8d                      # imm = 0x100
	movl	$256, %r9d                      # imm = 0x100
	callq	_Z13verify_resultPfS_S_iii
	testb	%al, %al
	je	.LBB3_14
# %bb.11:
	leaq	.L.str.6(%rip), %rsi
	movl	$27, %edx
	movq	%r12, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r12), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbp
	testq	%rbp, %rbp
	je	.LBB3_19
# %bb.12:
	cmpb	$0, 56(%rbp)
	je	.LBB3_17
.LBB3_13:
	movb	67(%rbp), %al
	jmp	.LBB3_18
.LBB3_14:
	leaq	.L.str.7(%rip), %rsi
	movl	$27, %edx
	movq	%r12, %rdi
	callq	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r12), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbp
	testq	%rbp, %rbp
	je	.LBB3_19
# %bb.15:
	cmpb	$0, 56(%rbp)
	jne	.LBB3_13
.LBB3_17:
	movq	%rbp, %rdi
	callq	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%rbp), %rax
	movq	%rbp, %rdi
	movl	$10, %esi
	movq	48(%rax), %rax
	callq	*%rax
.LBB3_18:
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	movsbl	%al, %esi
	callq	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	callq	_ZNSo5flushEv@PLT
	movq	%r14, %rdi
	callq	_ZdaPv@PLT
	movq	%r15, %rdi
	callq	_ZdaPv@PLT
	movq	%rbx, %rdi
	callq	_ZdaPv@PLT
	xorl	%eax, %eax
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
.LBB3_19:
	.cfi_def_cfa_offset 64
	callq	_ZSt16__throw_bad_castv@PLT
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.section	.text.__clang_call_terminate,"axG",@progbits,__clang_call_terminate,comdat
	.hidden	__clang_call_terminate          # -- Begin function __clang_call_terminate
	.weak	__clang_call_terminate
	.p2align	4, 0x90
	.type	__clang_call_terminate,@function
__clang_call_terminate:                 # @__clang_call_terminate
# %bb.0:
	pushq	%rax
	callq	__cxa_begin_catch@PLT
	callq	_ZSt9terminatev@PLT
.Lfunc_end4:
	.size	__clang_call_terminate, .Lfunc_end4-__clang_call_terminate
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function _ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
.LCPI5_0:
	.quad	-2147483648                     # 0xffffffff80000000
.LCPI5_1:
	.quad	2147483646                      # 0x7ffffffe
.LCPI5_2:
	.quad	2567483615                      # 0x9908b0df
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI5_3:
	.quad	-2147483648                     # 0xffffffff80000000
	.quad	-2147483648                     # 0xffffffff80000000
.LCPI5_4:
	.quad	2147483646                      # 0x7ffffffe
	.quad	2147483646                      # 0x7ffffffe
.LCPI5_5:
	.quad	2567483615                      # 0x9908b0df
	.quad	2567483615                      # 0x9908b0df
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv,comdat
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	.p2align	4, 0x90
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv,@function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv: # @_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	.cfi_startproc
# %bb.0:
	movq	4992(%rdi), %rax
	cmpq	$624, %rax                      # imm = 0x270
	jb	.LBB5_6
# %bb.1:
	vpbroadcastq	(%rdi), %ymm2
	vpbroadcastq	.LCPI5_0(%rip), %ymm0   # ymm0 = [18446744071562067968,18446744071562067968,18446744071562067968,18446744071562067968]
	vpbroadcastq	.LCPI5_1(%rip), %ymm1   # ymm1 = [2147483646,2147483646,2147483646,2147483646]
	vpbroadcastq	.LCPI5_2(%rip), %ymm3   # ymm3 = [2567483615,2567483615,2567483615,2567483615]
	movq	$-224, %rax
	vpxor	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	1800(%rdi,%rax,8), %ymm7
	vmovdqu	1832(%rdi,%rax,8), %ymm6
	vmovdqu	1864(%rdi,%rax,8), %ymm5
	vperm2i128	$33, %ymm7, %ymm2, %ymm8 # ymm8 = ymm2[2,3],ymm7[0,1]
	vmovdqu	1896(%rdi,%rax,8), %ymm2
	vperm2i128	$33, %ymm6, %ymm7, %ymm9 # ymm9 = ymm7[2,3],ymm6[0,1]
	vperm2i128	$33, %ymm5, %ymm6, %ymm10 # ymm10 = ymm6[2,3],ymm5[0,1]
	vpand	%ymm1, %ymm7, %ymm12
	vpalignr	$8, %ymm8, %ymm7, %ymm8         # ymm8 = ymm8[8,9,10,11,12,13,14,15],ymm7[0,1,2,3,4,5,6,7],ymm8[24,25,26,27,28,29,30,31],ymm7[16,17,18,19,20,21,22,23]
	vpalignr	$8, %ymm9, %ymm6, %ymm9         # ymm9 = ymm9[8,9,10,11,12,13,14,15],ymm6[0,1,2,3,4,5,6,7],ymm9[24,25,26,27,28,29,30,31],ymm6[16,17,18,19,20,21,22,23]
	vpalignr	$8, %ymm10, %ymm5, %ymm10       # ymm10 = ymm10[8,9,10,11,12,13,14,15],ymm5[0,1,2,3,4,5,6,7],ymm10[24,25,26,27,28,29,30,31],ymm5[16,17,18,19,20,21,22,23]
	vpsllq	$63, %ymm7, %ymm7
	vpand	%ymm0, %ymm8, %ymm8
	vpand	%ymm0, %ymm9, %ymm9
	vpand	%ymm0, %ymm10, %ymm10
	vpcmpgtq	%ymm7, %ymm4, %ymm7
	vpor	%ymm8, %ymm12, %ymm8
	vperm2i128	$33, %ymm2, %ymm5, %ymm11 # ymm11 = ymm5[2,3],ymm2[0,1]
	vpand	%ymm1, %ymm6, %ymm12
	vpand	%ymm3, %ymm7, %ymm7
	vpsllq	$63, %ymm6, %ymm6
	vpor	%ymm9, %ymm12, %ymm9
	vpalignr	$8, %ymm11, %ymm2, %ymm11       # ymm11 = ymm11[8,9,10,11,12,13,14,15],ymm2[0,1,2,3,4,5,6,7],ymm11[24,25,26,27,28,29,30,31],ymm2[16,17,18,19,20,21,22,23]
	vpand	%ymm1, %ymm5, %ymm12
	vpsrlq	$1, %ymm8, %ymm8
	vpxor	4968(%rdi,%rax,8), %ymm8, %ymm8
	vpsllq	$63, %ymm5, %ymm5
	vpcmpgtq	%ymm6, %ymm4, %ymm6
	vpor	%ymm10, %ymm12, %ymm10
	vpand	%ymm0, %ymm11, %ymm11
	vpand	%ymm1, %ymm2, %ymm12
	vpsrlq	$1, %ymm9, %ymm9
	vpxor	5000(%rdi,%rax,8), %ymm9, %ymm9
	vpcmpgtq	%ymm5, %ymm4, %ymm5
	vpand	%ymm3, %ymm6, %ymm6
	vpor	%ymm11, %ymm12, %ymm11
	vpsrlq	$1, %ymm10, %ymm10
	vpxor	5032(%rdi,%rax,8), %ymm10, %ymm10
	vpand	%ymm3, %ymm5, %ymm5
	vpsrlq	$1, %ymm11, %ymm11
	vpxor	5064(%rdi,%rax,8), %ymm11, %ymm11
	vpxor	%ymm7, %ymm8, %ymm7
	vpsllq	$63, %ymm2, %ymm8
	vpcmpgtq	%ymm8, %ymm4, %ymm8
	vpxor	%ymm6, %ymm9, %ymm6
	vmovdqu	%ymm7, 1792(%rdi,%rax,8)
	vpand	%ymm3, %ymm8, %ymm8
	vpxor	%ymm5, %ymm10, %ymm5
	vmovdqu	%ymm6, 1824(%rdi,%rax,8)
	vpxor	%ymm8, %ymm11, %ymm8
	vmovdqu	%ymm5, 1856(%rdi,%rax,8)
	vmovdqu	%ymm8, 1888(%rdi,%rax,8)
	addq	$16, %rax
	jne	.LBB5_2
# %bb.3:
	movq	1800(%rdi), %rax
	vextracti128	$1, %ymm2, %xmm0
	movq	1808(%rdi), %rcx
	vmovdqa	.LCPI5_4(%rip), %xmm1           # xmm1 = [2147483646,2147483646]
	vmovdqa	.LCPI5_5(%rip), %xmm3           # xmm3 = [2567483615,2567483615]
	movl	$2567483615, %r8d               # imm = 0x9908B0DF
	vpxor	%xmm2, %xmm2, %xmm2
	vpextrq	$1, %xmm0, %rsi
	andq	$-2147483648, %rsi              # imm = 0x80000000
	movl	%eax, %edx
	andl	$2147483646, %edx               # imm = 0x7FFFFFFE
	orq	%rsi, %rdx
	movl	%eax, %esi
	andq	$-2147483648, %rax              # imm = 0x80000000
	shrq	%rdx
	xorq	4968(%rdi), %rdx
	andl	$1, %esi
	negl	%esi
	andl	$-1727483681, %esi              # imm = 0x9908B0DF
	xorq	%rdx, %rsi
	movl	%ecx, %edx
	andl	$2147483646, %edx               # imm = 0x7FFFFFFE
	movq	%rsi, 1792(%rdi)
	orq	%rax, %rdx
	movl	%ecx, %eax
	andq	$-2147483648, %rcx              # imm = 0x80000000
	shrq	%rdx
	xorq	4976(%rdi), %rdx
	andl	$1, %eax
	negl	%eax
	andl	$-1727483681, %eax              # imm = 0x9908B0DF
	xorq	%rdx, %rax
	movq	%rax, 1800(%rdi)
	movq	1816(%rdi), %rax
	movl	%eax, %edx
	vmovq	%rax, %xmm0
                                        # kill: def $eax killed $eax killed $rax def $rax
	andl	$2147483646, %eax               # imm = 0x7FFFFFFE
	orq	%rcx, %rax
	andl	$1, %edx
	vpbroadcastq	%xmm0, %xmm4
	vmovdqa	.LCPI5_3(%rip), %xmm0           # xmm0 = [18446744071562067968,18446744071562067968]
	movq	$-396, %rcx                     # imm = 0xFE74
	shrq	%rax
	xorq	4984(%rdi), %rax
	negl	%edx
	andl	$-1727483681, %edx              # imm = 0x9908B0DF
	xorq	%rax, %rdx
	movq	%rdx, 1808(%rdi)
	.p2align	4, 0x90
.LBB5_4:                                # =>This Inner Loop Header: Depth=1
	vmovdqu	4992(%rdi,%rcx,8), %xmm5
	vpalignr	$8, %xmm4, %xmm5, %xmm4         # xmm4 = xmm4[8,9,10,11,12,13,14,15],xmm5[0,1,2,3,4,5,6,7]
	vpand	%xmm1, %xmm5, %xmm6
	vpand	%xmm0, %xmm4, %xmm4
	vpor	%xmm4, %xmm6, %xmm4
	vpsllq	$63, %xmm5, %xmm6
	vpsrlq	$1, %xmm4, %xmm4
	vpxor	3168(%rdi,%rcx,8), %xmm4, %xmm4
	vpcmpgtq	%xmm6, %xmm2, %xmm6
	vpand	%xmm3, %xmm6, %xmm6
	vpxor	%xmm6, %xmm4, %xmm4
	vmovdqu	%xmm4, 4984(%rdi,%rcx,8)
	addq	$2, %rcx
	vmovdqa	%xmm5, %xmm4
	jne	.LBB5_4
# %bb.5:
	movq	(%rdi), %rcx
	movq	$-2147483648, %rax              # imm = 0x80000000
	andq	4984(%rdi), %rax
	movl	%ecx, %edx
	andl	$1, %ecx
	andl	$2147483646, %edx               # imm = 0x7FFFFFFE
	negl	%ecx
	orq	%rax, %rdx
	andl	%ecx, %r8d
	xorl	%eax, %eax
	shrq	%rdx
	xorq	3168(%rdi), %rdx
	xorq	%rdx, %r8
	movq	%r8, 4984(%rdi)
.LBB5_6:
	leaq	1(%rax), %rcx
	movq	%rcx, 4992(%rdi)
	movq	(%rdi,%rax,8), %rax
	movq	%rax, %rcx
	shrq	$11, %rcx
	movl	%ecx, %ecx
	xorq	%rax, %rcx
	movl	%ecx, %eax
	andl	$20601005, %eax                 # imm = 0x13A58AD
	shlq	$7, %rax
	xorq	%rcx, %rax
	movl	%eax, %ecx
	andl	$122764, %ecx                   # imm = 0x1DF8C
	shlq	$15, %rcx
	xorq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$18, %rax
	xorq	%rcx, %rax
	vzeroupper
	retq
.Lfunc_end5:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv, .Lfunc_end5-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	.cfi_endproc
                                        # -- End function
	.section	.text._ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE,"axG",@progbits,_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE,comdat
	.weak	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE # -- Begin function _ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
	.p2align	4, 0x90
	.type	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE,@function
_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE: # @_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movslq	4(%rdx), %r15
	movslq	(%rdx), %rax
	movq	%rsi, %rbx
	movq	%rdx, %rbp
	movq	%rdx, 8(%rsp)                   # 8-byte Spill
	subq	%rax, %r15
	movl	$4294967294, %eax               # imm = 0xFFFFFFFE
	cmpq	%rax, %r15
	ja	.LBB6_6
# %bb.1:
	movq	%rbx, %rdi
	leal	1(%r15), %r12d
	callq	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	movq	%rax, %rcx
	imulq	%r12, %rcx
	cmpl	%ecx, %r15d
	jb	.LBB6_5
# %bb.2:
	notl	%r15d
	xorl	%edx, %edx
	movl	%r15d, %eax
	divl	%r12d
	cmpl	%ecx, %edx
	jbe	.LBB6_5
# %bb.3:
	movl	%edx, %ebp
	.p2align	4, 0x90
.LBB6_4:                                # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	movq	%rax, %rcx
	imulq	%r12, %rcx
	cmpl	%ecx, %ebp
	ja	.LBB6_4
.LBB6_5:
	shrq	$32, %rcx
	jmp	.LBB6_11
.LBB6_6:
	movl	$4294967295, %eax               # imm = 0xFFFFFFFF
	cmpq	%rax, %r15
	jne	.LBB6_7
# %bb.10:
	movq	%rbx, %rdi
	callq	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	movq	%rax, %rcx
	jmp	.LBB6_11
.LBB6_7:
	movq	%rdi, %r12
	movabsq	$-4294967296, %r14              # imm = 0xFFFFFFFF00000000
	leaq	16(%rsp), %r13
	.p2align	4, 0x90
.LBB6_8:                                # =>This Inner Loop Header: Depth=1
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	movq	%r14, 16(%rsp)
	callq	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
	movl	%eax, %ebp
	movq	%rbx, %rdi
	shlq	$32, %rbp
	callq	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEclEv
	movq	%rax, %rcx
	addq	%rbp, %rcx
	setb	%al
	cmpq	%r15, %rcx
	ja	.LBB6_8
# %bb.9:                                #   in Loop: Header=BB6_8 Depth=1
	testb	%al, %al
	jne	.LBB6_8
.LBB6_11:
	movq	8(%rsp), %rax                   # 8-byte Reload
	addl	(%rax), %ecx
	movl	%ecx, %eax
	addq	$24, %rsp
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
.Lfunc_end6:
	.size	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE, .Lfunc_end6-_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_gemm_test.cpp
	.type	_GLOBAL__sub_I_gemm_test.cpp,@function
_GLOBAL__sub_I_gemm_test.cpp:           # @_GLOBAL__sub_I_gemm_test.cpp
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
.Lfunc_end7:
	.size	_GLOBAL__sub_I_gemm_test.cpp, .Lfunc_end7-_GLOBAL__sub_I_gemm_test.cpp
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Mismatch at ("
	.size	.L.str, 14

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	", "
	.size	.L.str.1, 3

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"): "
	.size	.L.str.2, 4

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	" vs "
	.size	.L.str.3, 5

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Matrix multiplication took "
	.size	.L.str.4, 28

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	" ms"
	.size	.L.str.5, 4

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"Result verification passed!"
	.size	.L.str.6, 28

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"Result verification failed!"
	.size	.L.str.7, 28

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"default"
	.size	.L.str.8, 8

	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_gemm_test.cpp
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"aGw",@progbits,DW.ref.__gxx_personality_v0,comdat
	.p2align	3
	.type	DW.ref.__gxx_personality_v0,@object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __gxx_personality_v0
	.addrsig_sym _GLOBAL__sub_I_gemm_test.cpp
	.addrsig_sym _Unwind_Resume
	.addrsig_sym _ZStL8__ioinit
	.addrsig_sym __dso_handle
	.addrsig_sym _ZSt4cout
