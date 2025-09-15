	.file	"compare_matmul.cpp"
# GNU C++17 (Ubuntu 12.3.0-1ubuntu1~22.04.2) version 12.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=alderlake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mno-pconfig -mpku -mno-prefetchwt1 -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=36864 -mtune=generic -O3 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.globl	_Z10gemm_basicPfS_S_iii
	.type	_Z10gemm_basicPfS_S_iii, @function
_Z10gemm_basicPfS_S_iii:
.LFB1828:
	.cfi_startproc
	endbr64	
# compare_matmul.cpp:3:     for (int i = 0; i < M; i++) {
	testl	%ecx, %ecx	# M
	jle	.L18	#,
# compare_matmul.cpp:2: void gemm_basic(float* A, float* B, float* C, int M, int N, int K) {
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d	# tmp209, N
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	testl	%r8d, %r8d	# N
	jle	.L16	#,
	movslq	%r8d, %rbx	# N, _140
	movl	%r9d, %ebp	# tmp210, K
	movq	%rsi, %r13	# tmp206, B
	movq	%rdx, -64(%rsp)	# C, %sfp
	leal	-1(%r9), %esi	#, _69
	leaq	(%rbx,%rbx,2), %r8	#, tmp172
	movq	%rbx, %r9	# _140, _52
	movq	%rbx, -56(%rsp)	# _140, %sfp
	leaq	0(,%rbx,4), %rax	#, _139
	movl	%ebp, %ebx	# K, _143
	movl	%ebp, %edx	# K, bnd.9
	movl	%ecx, %r15d	# tmp208, M
	andl	$-4, %ebx	#, _143
	shrl	$2, %edx	#,
	movl	%esi, -40(%rsp)	# _69, %sfp
	movq	%rdi, %r11	# tmp205, A
	movl	%ebx, -28(%rsp)	# _143, %sfp
	movl	%ebp, %ebx	# K, tmp200
	salq	$4, %rdx	#, bnd.9
# compare_matmul.cpp:3:     for (int i = 0; i < M; i++) {
	xorl	%r12d, %r12d	# ivtmp.44
	andl	$3, %ebx	#, tmp200
	movq	%rdx, -24(%rsp)	# _158, %sfp
	salq	$4, %r9	#, _52
# compare_matmul.cpp:3:     for (int i = 0; i < M; i++) {
	xorl	%ecx, %ecx	# i
	movl	%ebx, -36(%rsp)	# tmp200, %sfp
	salq	$2, %r8	#, tmp173
	movl	%r15d, -12(%rsp)	# M, %sfp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	-24(%rsp), %rsi	# %sfp, _158
	movslq	%r12d, %rdx	# ivtmp.44, _1
	movl	%ecx, -16(%rsp)	# i, %sfp
	movq	%r13, %rbx	# B, ivtmp.37
	leaq	(%r11,%rdx,4), %rdi	#, ivtmp.26
	movq	%rdi, -48(%rsp)	# ivtmp.26, %sfp
	addq	%rsi, %rdi	# _158, _156
# compare_matmul.cpp:5:             float sum = 0.0f;
	xorl	%esi, %esi	# ivtmp.33
	.p2align 4,,10
	.p2align 3
.L10:
	vxorps	%xmm1, %xmm1, %xmm1	# sum
# compare_matmul.cpp:6:             for (int k = 0; k < K; k++) {
	testl	%ebp, %ebp	# K
	jle	.L9	#,
	cmpl	$2, -40(%rsp)	#, %sfp
	jbe	.L11	#,
	movq	-48(%rsp), %rcx	# %sfp, ivtmp.26
	movq	%rbx, %rdx	# ivtmp.37, ivtmp.23
# compare_matmul.cpp:5:             float sum = 0.0f;
	vxorps	%xmm1, %xmm1, %xmm1	# sum
	.p2align 4,,10
	.p2align 3
.L5:
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	vmovss	(%rdx,%rax,2), %xmm0	# MEM[(float *)_164 + _139 * 2], MEM[(float *)_164 + _139 * 2]
	vinsertps	$0x10, (%rdx,%r8), %xmm0, %xmm2	# MEM[(float *)_164 + _160 * 1], MEM[(float *)_164 + _139 * 2], tmp175
	addq	$16, %rcx	#, ivtmp.26
	vmovss	(%rdx), %xmm0	# MEM[(float *)_164], MEM[(float *)_164]
	vinsertps	$0x10, (%rdx,%rax), %xmm0, %xmm0	# MEM[(float *)_164 + _139 * 1], MEM[(float *)_164], tmp178
	addq	%r9, %rdx	# _52, ivtmp.23
	vmovlhps	%xmm2, %xmm0, %xmm0	# tmp175, tmp178, tmp174
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	vmulps	-16(%rcx), %xmm0, %xmm0	# MEM <vector(4) float> [(float *)_165], tmp174, vect__13.15
	vaddss	%xmm0, %xmm1, %xmm1	# stmp_sum_36.16, sum, stmp_sum_36.16
	vshufps	$85, %xmm0, %xmm0, %xmm2	#, vect__13.15, vect__13.15, stmp_sum_36.16
	vaddss	%xmm2, %xmm1, %xmm1	# stmp_sum_36.16, stmp_sum_36.16, stmp_sum_36.16
	vunpckhps	%xmm0, %xmm0, %xmm2	# vect__13.15, vect__13.15, stmp_sum_36.16
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	vshufps	$255, %xmm0, %xmm0, %xmm0	#, vect__13.15, vect__13.15, stmp_sum_36.16
	vaddss	%xmm2, %xmm1, %xmm1	# stmp_sum_36.16, stmp_sum_36.16, stmp_sum_36.16
	vaddss	%xmm0, %xmm1, %xmm1	# stmp_sum_36.16, stmp_sum_36.16, sum
	cmpq	%rcx, %rdi	# ivtmp.26, _156
	jne	.L5	#,
	movl	-36(%rsp), %edx	# %sfp,
	testl	%edx, %edx	#
	je	.L9	#,
# compare_matmul.cpp:6:             for (int k = 0; k < K; k++) {
	movl	-28(%rsp), %edx	# %sfp, k
.L4:
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	movl	%r14d, %ecx	# N, _8
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	leal	(%r12,%rdx), %r15d	#, tmp185
	movl	%esi, -32(%rsp)	# ivtmp.33, %sfp
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	imull	%edx, %ecx	# k, _8
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%r15d, %r15	# tmp185, tmp186
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	vmovss	(%r11,%r15,4), %xmm3	# *_6, tmp260
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	leal	(%rcx,%rsi), %r10d	#, tmp187
	movslq	%r10d, %r10	# tmp187, tmp188
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	vfmadd231ss	0(%r13,%r10,4), %xmm3, %xmm1	# *_103, tmp260, sum
# compare_matmul.cpp:6:             for (int k = 0; k < K; k++) {
	leal	1(%rdx), %r10d	#, k
# compare_matmul.cpp:6:             for (int k = 0; k < K; k++) {
	cmpl	%r10d, %ebp	# k, K
	jle	.L9	#,
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	addl	%r14d, %ecx	# N, _91
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	addl	%r12d, %r10d	# ivtmp.44, tmp189
# compare_matmul.cpp:6:             for (int k = 0; k < K; k++) {
	addl	$2, %edx	#, k
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	leal	(%rcx,%rsi), %r15d	#, tmp191
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%r10d, %r10	# tmp189, tmp190
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%r15d, %r15	# tmp191, tmp192
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	vmovss	(%r11,%r10,4), %xmm4	# *_89, tmp261
	vfmadd231ss	0(%r13,%r15,4), %xmm4, %xmm1	# *_48, tmp261, sum
# compare_matmul.cpp:6:             for (int k = 0; k < K; k++) {
	cmpl	%edx, %ebp	# k, K
	jle	.L9	#,
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	addl	%r14d, %ecx	# N, tmp193
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	addl	%r12d, %edx	# ivtmp.44, tmp196
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	addl	%esi, %ecx	# j, tmp194
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%edx, %rdx	# tmp196, tmp197
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%ecx, %rcx	# tmp194, tmp195
# compare_matmul.cpp:7:                 sum += A[i * K + k] * B[k * N + j];
	vmovss	0(%r13,%rcx,4), %xmm5	# *_76, tmp263
	vfmadd231ss	(%r11,%rdx,4), %xmm5, %xmm1	# *_82, tmp263, sum
.L9:
# compare_matmul.cpp:9:             C[i * N + j] = sum;
	movq	-64(%rsp), %rcx	# %sfp, ivtmp.43
# compare_matmul.cpp:4:         for (int j = 0; j < N; j++) {
	addq	$4, %rbx	#, ivtmp.37
# compare_matmul.cpp:9:             C[i * N + j] = sum;
	vmovss	%xmm1, (%rcx,%rsi,4)	# sum, MEM[(float *)_148 + ivtmp.33_155 * 4]
# compare_matmul.cpp:4:         for (int j = 0; j < N; j++) {
	addq	$1, %rsi	#, ivtmp.33
	cmpq	%rsi, -56(%rsp)	# ivtmp.33, %sfp
	jne	.L10	#,
# compare_matmul.cpp:3:     for (int i = 0; i < M; i++) {
	movl	-16(%rsp), %ecx	# %sfp, i
# compare_matmul.cpp:3:     for (int i = 0; i < M; i++) {
	addq	%rax, -64(%rsp)	# _139, %sfp
	addl	%ebp, %r12d	# K, ivtmp.44
# compare_matmul.cpp:3:     for (int i = 0; i < M; i++) {
	addl	$1, %ecx	#, i
# compare_matmul.cpp:3:     for (int i = 0; i < M; i++) {
	cmpl	%ecx, -12(%rsp)	# i, %sfp
	jne	.L3	#,
.L16:
# compare_matmul.cpp:12: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
.L11:
	.cfi_restore_state
# compare_matmul.cpp:6:             for (int k = 0; k < K; k++) {
	xorl	%edx, %edx	# k
# compare_matmul.cpp:5:             float sum = 0.0f;
	vxorps	%xmm1, %xmm1, %xmm1	# sum
	jmp	.L4	#
.L18:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret	
	.cfi_endproc
.LFE1828:
	.size	_Z10gemm_basicPfS_S_iii, .-_Z10gemm_basicPfS_S_iii
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.type	_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii, @function
_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii:
.LFB2353:
	.cfi_startproc
	endbr64	
	pushq	%rbx	#
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
# /usr/include/c++/12/iostream:74:   static ios_base::Init __ioinit;
	leaq	_ZStL8__ioinit(%rip), %rbx	#, tmp82
	movq	%rbx, %rdi	# tmp82,
	call	_ZNSt8ios_base4InitC1Ev@PLT	#
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi	#,
	movq	%rbx, %rsi	# tmp82,
# compare_matmul.cpp:12: }
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/c++/12/iostream:74:   static ios_base::Init __ioinit;
	leaq	__dso_handle(%rip), %rdx	#, tmp83
	jmp	__cxa_atexit@PLT	#
	.cfi_endproc
.LFE2353:
	.size	_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii, .-_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 12.3.0-1ubuntu1~22.04.2) 12.3.0"
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
