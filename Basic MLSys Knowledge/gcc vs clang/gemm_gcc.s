	.file	"gemm_test.cpp"
# GNU C++17 (Ubuntu 12.3.0-1ubuntu1~22.04.2) version 12.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 12.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=alderlake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512er -mno-avx512pf -mno-avx512vbmi -mno-avx512ifma -mno-avx5124vnniw -mno-avx5124fmaps -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mno-pconfig -mpku -mno-prefetchwt1 -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=36864 -mtune=generic -O3 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1581:
	.cfi_startproc
	endbr64	
# /usr/include/c++/12/bits/locale_facets.h:1092:       do_widen(char __c) const
	movl	%esi, %eax	# tmp87, __c
# /usr/include/c++/12/bits/locale_facets.h:1093:       { return __c; }
	ret	
	.cfi_endproc
.LFE1581:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB4969:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx	#
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 32
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	movq	(%rdi), %rax	# __os_1(D)->_vptr.basic_ostream, __os_1(D)->_vptr.basic_ostream
	movq	-24(%rax), %rax	# MEM[(long int *)_2 + -24B], MEM[(long int *)_2 + -24B]
	movq	240(%rdi,%rax), %rbp	# MEM[(const struct __ctype_type * *)_5 + 240B], _14
# /usr/include/c++/12/bits/basic_ios.h:49:       if (!__f)
	testq	%rbp, %rbp	# _14
	je	.L9	#,
# /usr/include/c++/12/bits/locale_facets.h:882: 	if (_M_widen_ok)
	cmpb	$0, 56(%rbp)	#, MEM[(const struct ctype *)_14]._M_widen_ok
	movq	%rdi, %rbx	# tmp100, __os
	je	.L5	#,
# /usr/include/c++/12/bits/locale_facets.h:883: 	  return _M_widen[static_cast<unsigned char>(__c)];
	movsbl	67(%rbp), %esi	# MEM[(const struct ctype *)_14]._M_widen[10],
.L6:
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	movq	%rbx, %rdi	# __os,
	call	_ZNSo3putEc@PLT	#
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx	#
	.cfi_def_cfa_offset 16
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	movq	%rax, %rdi	# tmp102, _8
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	popq	%rbp	#
	.cfi_def_cfa_offset 8
# /usr/include/c++/12/ostream:711:     { return __os.flush(); }
	jmp	_ZNSo5flushEv@PLT	#
.L5:
	.cfi_restore_state
# /usr/include/c++/12/bits/locale_facets.h:884: 	this->_M_widen_init();
	movq	%rbp, %rdi	# _14,
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT	#
# /usr/include/c++/12/bits/locale_facets.h:885: 	return this->do_widen(__c);
	movq	0(%rbp), %rax	# MEM[(const struct ctype *)_14].D.39988._vptr.facet, MEM[(const struct ctype *)_14].D.39988._vptr.facet
	movl	$10, %esi	#,
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx	#, tmp98
	movq	48(%rax), %rax	# MEM[(int (*) () *)_24 + 48B], _25
	cmpq	%rdx, %rax	# tmp98, _25
	je	.L6	#,
	movl	$10, %esi	#,
	movq	%rbp, %rdi	# _14,
	call	*%rax	# _25
	movsbl	%al, %esi	# tmp101,
	jmp	.L6	#
.L9:
# /usr/include/c++/12/bits/basic_ios.h:50: 	__throw_bad_cast();
	call	_ZSt16__throw_bad_castv@PLT	#
	.cfi_endproc
.LFE4969:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.p2align 4
	.globl	_Z10gemm_basicPfS_S_iii
	.type	_Z10gemm_basicPfS_S_iii, @function
_Z10gemm_basicPfS_S_iii:
.LFB4148:
	.cfi_startproc
	endbr64	
# gemm_test.cpp:8:     for (int i = 0; i < M; i++) {
	testl	%ecx, %ecx	# M
	jle	.L27	#,
# gemm_test.cpp:7: void gemm_basic(float* A, float* B, float* C, int M, int N, int K) {
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
	jle	.L25	#,
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
	movl	%ebp, %edx	# K, bnd.149
	movl	%ecx, %r15d	# tmp208, M
	andl	$-4, %ebx	#, _143
	shrl	$2, %edx	#,
	movl	%esi, -40(%rsp)	# _69, %sfp
	movq	%rdi, %r11	# tmp205, A
	movl	%ebx, -28(%rsp)	# _143, %sfp
	movl	%ebp, %ebx	# K, tmp200
	salq	$4, %rdx	#, bnd.149
# gemm_test.cpp:8:     for (int i = 0; i < M; i++) {
	xorl	%r12d, %r12d	# ivtmp.184
	andl	$3, %ebx	#, tmp200
	movq	%rdx, -24(%rsp)	# _158, %sfp
	salq	$4, %r9	#, _52
# gemm_test.cpp:8:     for (int i = 0; i < M; i++) {
	xorl	%ecx, %ecx	# i
	movl	%ebx, -36(%rsp)	# tmp200, %sfp
	salq	$2, %r8	#, tmp173
	movl	%r15d, -12(%rsp)	# M, %sfp
	.p2align 4,,10
	.p2align 3
.L12:
	movq	-24(%rsp), %rsi	# %sfp, _158
	movslq	%r12d, %rdx	# ivtmp.184, _1
	movl	%ecx, -16(%rsp)	# i, %sfp
	movq	%r13, %rbx	# B, ivtmp.177
	leaq	(%r11,%rdx,4), %rdi	#, ivtmp.166
	movq	%rdi, -48(%rsp)	# ivtmp.166, %sfp
	addq	%rsi, %rdi	# _158, _156
# gemm_test.cpp:10:             float sum = 0.0f;
	xorl	%esi, %esi	# ivtmp.173
	.p2align 4,,10
	.p2align 3
.L19:
	vxorps	%xmm1, %xmm1, %xmm1	# sum
# gemm_test.cpp:11:             for (int k = 0; k < K; k++) {
	testl	%ebp, %ebp	# K
	jle	.L18	#,
	cmpl	$2, -40(%rsp)	#, %sfp
	jbe	.L20	#,
	movq	-48(%rsp), %rcx	# %sfp, ivtmp.166
	movq	%rbx, %rdx	# ivtmp.177, ivtmp.163
# gemm_test.cpp:10:             float sum = 0.0f;
	vxorps	%xmm1, %xmm1, %xmm1	# sum
	.p2align 4,,10
	.p2align 3
.L14:
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	vmovss	(%rdx,%rax,2), %xmm0	# MEM[(float *)_164 + _139 * 2], MEM[(float *)_164 + _139 * 2]
	vinsertps	$0x10, (%rdx,%r8), %xmm0, %xmm2	# MEM[(float *)_164 + _160 * 1], MEM[(float *)_164 + _139 * 2], tmp175
	addq	$16, %rcx	#, ivtmp.166
	vmovss	(%rdx), %xmm0	# MEM[(float *)_164], MEM[(float *)_164]
	vinsertps	$0x10, (%rdx,%rax), %xmm0, %xmm0	# MEM[(float *)_164 + _139 * 1], MEM[(float *)_164], tmp178
	addq	%r9, %rdx	# _52, ivtmp.163
	vmovlhps	%xmm2, %xmm0, %xmm0	# tmp175, tmp178, tmp174
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	vmulps	-16(%rcx), %xmm0, %xmm0	# MEM <vector(4) float> [(float *)_165], tmp174, vect__13.155
	vaddss	%xmm0, %xmm1, %xmm1	# stmp_sum_36.156, sum, stmp_sum_36.156
	vshufps	$85, %xmm0, %xmm0, %xmm2	#, vect__13.155, vect__13.155, stmp_sum_36.156
	vaddss	%xmm2, %xmm1, %xmm1	# stmp_sum_36.156, stmp_sum_36.156, stmp_sum_36.156
	vunpckhps	%xmm0, %xmm0, %xmm2	# vect__13.155, vect__13.155, stmp_sum_36.156
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	vshufps	$255, %xmm0, %xmm0, %xmm0	#, vect__13.155, vect__13.155, stmp_sum_36.156
	vaddss	%xmm2, %xmm1, %xmm1	# stmp_sum_36.156, stmp_sum_36.156, stmp_sum_36.156
	vaddss	%xmm0, %xmm1, %xmm1	# stmp_sum_36.156, stmp_sum_36.156, sum
	cmpq	%rcx, %rdi	# ivtmp.166, _156
	jne	.L14	#,
	movl	-36(%rsp), %edx	# %sfp,
	testl	%edx, %edx	#
	je	.L18	#,
# gemm_test.cpp:11:             for (int k = 0; k < K; k++) {
	movl	-28(%rsp), %edx	# %sfp, k
.L13:
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	movl	%r14d, %ecx	# N, _8
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	leal	(%r12,%rdx), %r15d	#, tmp185
	movl	%esi, -32(%rsp)	# ivtmp.173, %sfp
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	imull	%edx, %ecx	# k, _8
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%r15d, %r15	# tmp185, tmp186
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	vmovss	(%r11,%r15,4), %xmm3	# *_6, tmp260
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	leal	(%rcx,%rsi), %r10d	#, tmp187
	movslq	%r10d, %r10	# tmp187, tmp188
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	vfmadd231ss	0(%r13,%r10,4), %xmm3, %xmm1	# *_103, tmp260, sum
# gemm_test.cpp:11:             for (int k = 0; k < K; k++) {
	leal	1(%rdx), %r10d	#, k
# gemm_test.cpp:11:             for (int k = 0; k < K; k++) {
	cmpl	%r10d, %ebp	# k, K
	jle	.L18	#,
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	addl	%r14d, %ecx	# N, _91
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	addl	%r12d, %r10d	# ivtmp.184, tmp189
# gemm_test.cpp:11:             for (int k = 0; k < K; k++) {
	addl	$2, %edx	#, k
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	leal	(%rcx,%rsi), %r15d	#, tmp191
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%r10d, %r10	# tmp189, tmp190
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%r15d, %r15	# tmp191, tmp192
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	vmovss	(%r11,%r10,4), %xmm4	# *_89, tmp261
	vfmadd231ss	0(%r13,%r15,4), %xmm4, %xmm1	# *_48, tmp261, sum
# gemm_test.cpp:11:             for (int k = 0; k < K; k++) {
	cmpl	%edx, %ebp	# k, K
	jle	.L18	#,
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	addl	%r14d, %ecx	# N, tmp193
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	addl	%r12d, %edx	# ivtmp.184, tmp196
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	addl	%esi, %ecx	# j, tmp194
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%edx, %rdx	# tmp196, tmp197
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	movslq	%ecx, %rcx	# tmp194, tmp195
# gemm_test.cpp:12:                 sum += A[i * K + k] * B[k * N + j];
	vmovss	0(%r13,%rcx,4), %xmm5	# *_76, tmp263
	vfmadd231ss	(%r11,%rdx,4), %xmm5, %xmm1	# *_82, tmp263, sum
.L18:
# gemm_test.cpp:14:             C[i * N + j] = sum;
	movq	-64(%rsp), %rcx	# %sfp, ivtmp.183
# gemm_test.cpp:9:         for (int j = 0; j < N; j++) {
	addq	$4, %rbx	#, ivtmp.177
# gemm_test.cpp:14:             C[i * N + j] = sum;
	vmovss	%xmm1, (%rcx,%rsi,4)	# sum, MEM[(float *)_148 + ivtmp.173_155 * 4]
# gemm_test.cpp:9:         for (int j = 0; j < N; j++) {
	addq	$1, %rsi	#, ivtmp.173
	cmpq	%rsi, -56(%rsp)	# ivtmp.173, %sfp
	jne	.L19	#,
# gemm_test.cpp:8:     for (int i = 0; i < M; i++) {
	movl	-16(%rsp), %ecx	# %sfp, i
# gemm_test.cpp:8:     for (int i = 0; i < M; i++) {
	addq	%rax, -64(%rsp)	# _139, %sfp
	addl	%ebp, %r12d	# K, ivtmp.184
# gemm_test.cpp:8:     for (int i = 0; i < M; i++) {
	addl	$1, %ecx	#, i
# gemm_test.cpp:8:     for (int i = 0; i < M; i++) {
	cmpl	%ecx, -12(%rsp)	# i, %sfp
	jne	.L12	#,
.L25:
# gemm_test.cpp:17: }
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
.L20:
	.cfi_restore_state
# gemm_test.cpp:11:             for (int k = 0; k < K; k++) {
	xorl	%edx, %edx	# k
# gemm_test.cpp:10:             float sum = 0.0f;
	vxorps	%xmm1, %xmm1, %xmm1	# sum
	jmp	.L13	#
.L27:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret	
	.cfi_endproc
.LFE4148:
	.size	_Z10gemm_basicPfS_S_iii, .-_Z10gemm_basicPfS_S_iii
	.section	.text._ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv,"axG",@progbits,_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	.type	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv, @function
_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv:
.LFB4921:
	.cfi_startproc
	endbr64	
# /usr/include/c++/12/bits/random.tcc:397:     mersenne_twister_engine<_UIntType, __w, __n, __m, __r, __a, __u, __d,
	movq	%rdi, %rax	# tmp229, this
	movq	%rdi, %rdx	# this, ivtmp.269
	vpxor	%xmm6, %xmm6, %xmm6	# tmp158
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	movl	$2567483615, %esi	#, tmp162
	leaq	1792(%rdi), %rcx	#, _36
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	movq	$-2147483648, %rdi	#, tmp146
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vmovq	%rsi, %xmm5	# tmp162, tmp162
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vmovq	%rdi, %xmm0	# tmp146, tmp146
# /usr/include/c++/12/bits/random.tcc:407: 			   | (_M_x[__k + 1] & __lower_mask));
	movl	$2147483647, %edi	#, tmp151
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vpbroadcastq	%xmm5, %ymm5	# tmp162, tmp161
# /usr/include/c++/12/bits/random.tcc:407: 			   | (_M_x[__k + 1] & __lower_mask));
	vmovq	%rdi, %xmm1	# tmp151, tmp151
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	movl	$1, %edi	#, tmp157
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vpbroadcastq	%xmm0, %ymm9	# tmp146, tmp145
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vmovq	%rdi, %xmm3	# tmp157, tmp157
# /usr/include/c++/12/bits/random.tcc:407: 			   | (_M_x[__k + 1] & __lower_mask));
	vpbroadcastq	%xmm1, %ymm8	# tmp151, tmp150
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vpbroadcastq	%xmm3, %ymm7	# tmp157, tmp156
	.p2align 4,,10
	.p2align 3
.L31:
# /usr/include/c++/12/bits/random.tcc:407: 			   | (_M_x[__k + 1] & __lower_mask));
	vpand	8(%rdx), %ymm8, %ymm4	# MEM <vector(4) long unsigned int> [(long unsigned int *)_209 + 8B], tmp150, vect__5.220
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vpand	(%rdx), %ymm9, %ymm2	# MEM <vector(4) long unsigned int> [(long unsigned int *)_209], tmp145, vect__2.216
	addq	$32, %rdx	#, ivtmp.269
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vpor	%ymm4, %ymm2, %ymm2	# vect__5.220, vect__2.216, vect___y_46.221
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	vpsrlq	$1, %ymm2, %ymm4	#, vect___y_46.221, vect__8.225
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vpand	%ymm7, %ymm2, %ymm2	# tmp156, vect___y_46.221, vect__10.227
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	vpxor	3144(%rdx), %ymm4, %ymm4	# MEM <vector(4) long unsigned int> [(long unsigned int *)_209 + 3176B], vect__8.225, vect__9.226
	vpcmpeqq	%ymm6, %ymm2, %ymm2	# tmp158, vect__10.227, tmp163
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vpxor	%ymm5, %ymm4, %ymm10	# tmp161, vect__9.226, vect__81.228
	vpblendvb	%ymm2, %ymm4, %ymm10, %ymm2	# tmp163, vect__9.226, vect__81.228, tmp164
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	vmovdqu	%ymm2, -32(%rdx)	# tmp164, MEM <vector(4) long unsigned int> [(long unsigned int *)_209]
	cmpq	%rdx, %rcx	# ivtmp.269, _36
	jne	.L31	#,
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	movq	1808(%rax), %rcx	# this_40(D)->_M_x[226], tmp188
	vpunpcklqdq	%xmm0, %xmm0, %xmm0	# tmp146, tmp168
# /usr/include/c++/12/bits/random.tcc:407: 			   | (_M_x[__k + 1] & __lower_mask));
	vpunpcklqdq	%xmm1, %xmm1, %xmm1	# tmp151, tmp173
	vpxor	%xmm6, %xmm6, %xmm6	# tmp211
	vpand	1800(%rax), %xmm1, %xmm1	# MEM <vector(2) long unsigned int> [(long unsigned int *)this_40(D) + 1800B], tmp173, vect__134.241
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vpand	1792(%rax), %xmm0, %xmm0	# MEM <vector(2) long unsigned int> [(long unsigned int *)this_40(D) + 1792B], tmp168, vect__131.237
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vmovq	%rsi, %xmm7	# tmp162, tmp162
# /usr/include/c++/12/bits/random.tcc:407: 			   | (_M_x[__k + 1] & __lower_mask));
	movq	1816(%rax), %rdx	# this_40(D)->_M_x[227], tmp190
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	andq	$-2147483648, %rcx	#, tmp188
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vpor	%xmm1, %xmm0, %xmm0	# vect__134.241, vect__131.237, vect___y_135.242
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vpunpcklqdq	%xmm3, %xmm3, %xmm1	# tmp157, tmp179
	vpxor	%xmm3, %xmm3, %xmm3	# tmp181
# /usr/include/c++/12/bits/random.tcc:407: 			   | (_M_x[__k + 1] & __lower_mask));
	andl	$2147483647, %edx	#, tmp190
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	vpsrlq	$1, %xmm0, %xmm2	#, vect___y_135.242, vect__138.246
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vpand	%xmm1, %xmm0, %xmm0	# tmp179, vect___y_135.242, vect__140.248
# /usr/include/c++/12/bits/random.tcc:406: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	orq	%rdx, %rcx	# tmp190, __y
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	vpxor	4968(%rax), %xmm2, %xmm2	# MEM <vector(2) long unsigned int> [(long unsigned int *)this_40(D) + 4968B], vect__138.246, vect__139.247
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vpunpcklqdq	%xmm7, %xmm7, %xmm1	# tmp162, tmp184
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	movq	%rcx, %rdx	# __y, tmp192
	vpcmpeqq	%xmm3, %xmm0, %xmm0	# tmp181, vect__140.248, tmp186
	shrq	%rdx	# tmp192
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	xorq	4984(%rax), %rdx	# this_40(D)->_M_x[623], _188
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	vpxor	%xmm1, %xmm2, %xmm1	# tmp184, vect__139.247, vect__141.249
	xorq	%rdx, %rsi	# _188, tmp225
	andl	$1, %ecx	#, __y
# /usr/include/c++/12/bits/random.tcc:417: 		       ^ ((__y & 0x01) ? __a : 0));
	movl	$2567483615, %ecx	#, tmp215
	vpblendvb	%xmm0, %xmm2, %xmm1, %xmm0	# tmp186, vect__139.247, vect__141.249, tmp187
# /usr/include/c++/12/bits/random.tcc:409: 		       ^ ((__y & 0x01) ? __a : 0));
	cmovne	%rsi, %rdx	# tmp225,, _188
# /usr/include/c++/12/bits/random.tcc:417: 		       ^ ((__y & 0x01) ? __a : 0));
	vmovq	%rcx, %xmm5	# tmp215, tmp215
# /usr/include/c++/12/bits/random.tcc:414: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vpbroadcastq	.LC9(%rip), %ymm2	#, tmp198
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	vmovdqu	%xmm0, 1792(%rax)	# tmp187, MEM <vector(2) long unsigned int> [(long unsigned int *)this_40(D) + 1792B]
	leaq	4984(%rax), %rsi	#, _177
# /usr/include/c++/12/bits/random.tcc:417: 		       ^ ((__y & 0x01) ? __a : 0));
	vpbroadcastq	%xmm5, %ymm5	# tmp215, tmp214
# /usr/include/c++/12/bits/random.tcc:415: 			   | (_M_x[__k + 1] & __lower_mask));
	vpbroadcastq	.LC10(%rip), %ymm1	#, tmp203
# /usr/include/c++/12/bits/random.tcc:417: 		       ^ ((__y & 0x01) ? __a : 0));
	vpbroadcastq	.LC11(%rip), %ymm0	#, tmp209
# /usr/include/c++/12/bits/random.tcc:408: 	  _M_x[__k] = (_M_x[__k + __m] ^ (__y >> 1)
	movq	%rdx, 1808(%rax)	# _188, this_40(D)->_M_x[226]
	leaq	1816(%rax), %rdx	#, ivtmp.259
.L33:
# /usr/include/c++/12/bits/random.tcc:415: 			   | (_M_x[__k + 1] & __lower_mask));
	vpand	8(%rdx), %ymm1, %ymm4	# MEM <vector(4) long unsigned int> [(long unsigned int *)_185 + 8B], tmp203, vect__16.199
# /usr/include/c++/12/bits/random.tcc:414: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vpand	(%rdx), %ymm2, %ymm3	# MEM <vector(4) long unsigned int> [(long unsigned int *)_185], tmp198, vect__13.195
	addq	$32, %rdx	#, ivtmp.259
# /usr/include/c++/12/bits/random.tcc:414: 	  _UIntType __y = ((_M_x[__k] & __upper_mask)
	vpor	%ymm4, %ymm3, %ymm3	# vect__16.199, vect__13.195, vect___y_44.200
# /usr/include/c++/12/bits/random.tcc:416: 	  _M_x[__k] = (_M_x[__k + (__m - __n)] ^ (__y >> 1)
	vpsrlq	$1, %ymm3, %ymm4	#, vect___y_44.200, vect__19.204
# /usr/include/c++/12/bits/random.tcc:417: 		       ^ ((__y & 0x01) ? __a : 0));
	vpand	%ymm0, %ymm3, %ymm3	# tmp209, vect___y_44.200, vect__21.206
# /usr/include/c++/12/bits/random.tcc:416: 	  _M_x[__k] = (_M_x[__k + (__m - __n)] ^ (__y >> 1)
	vpxor	-1848(%rdx), %ymm4, %ymm4	# MEM <vector(4) long unsigned int> [(long unsigned int *)_185 + -1816B], vect__19.204, vect__20.205
	vpcmpeqq	%ymm6, %ymm3, %ymm3	# tmp211, vect__21.206, tmp216
# /usr/include/c++/12/bits/random.tcc:417: 		       ^ ((__y & 0x01) ? __a : 0));
	vpxor	%ymm5, %ymm4, %ymm7	# tmp214, vect__20.205, vect__84.207
	vpblendvb	%ymm3, %ymm4, %ymm7, %ymm3	# tmp216, vect__20.205, vect__84.207, tmp217
# /usr/include/c++/12/bits/random.tcc:416: 	  _M_x[__k] = (_M_x[__k + (__m - __n)] ^ (__y >> 1)
	vmovdqu	%ymm3, -32(%rdx)	# tmp217, MEM <vector(4) long unsigned int> [(long unsigned int *)_185]
	cmpq	%rdx, %rsi	# ivtmp.259, _177
	jne	.L33	#,
# /usr/include/c++/12/bits/random.tcc:420:       _UIntType __y = ((_M_x[__n - 1] & __upper_mask)
	movq	4984(%rax), %rsi	# this_40(D)->_M_x[623], tmp218
# /usr/include/c++/12/bits/random.tcc:421: 		       | (_M_x[0] & __lower_mask));
	movq	(%rax), %rdx	# this_40(D)->_M_x[0], tmp220
# /usr/include/c++/12/bits/random.tcc:424:       _M_p = 0;
	movq	$0, 4992(%rax)	#, this_40(D)->_M_p
# /usr/include/c++/12/bits/random.tcc:421: 		       | (_M_x[0] & __lower_mask));
	andl	$2147483647, %edx	#, tmp220
# /usr/include/c++/12/bits/random.tcc:420:       _UIntType __y = ((_M_x[__n - 1] & __upper_mask)
	andq	$-2147483648, %rsi	#, tmp218
# /usr/include/c++/12/bits/random.tcc:420:       _UIntType __y = ((_M_x[__n - 1] & __upper_mask)
	orq	%rdx, %rsi	# tmp220, __y
# /usr/include/c++/12/bits/random.tcc:422:       _M_x[__n - 1] = (_M_x[__m - 1] ^ (__y >> 1)
	movq	%rsi, %rdx	# __y, tmp222
	shrq	%rdx	# tmp222
# /usr/include/c++/12/bits/random.tcc:422:       _M_x[__n - 1] = (_M_x[__m - 1] ^ (__y >> 1)
	xorq	3168(%rax), %rdx	# this_40(D)->_M_x[396], _29
# /usr/include/c++/12/bits/random.tcc:423: 		       ^ ((__y & 0x01) ? __a : 0));
	xorq	%rdx, %rcx	# _29, tmp227
	andl	$1, %esi	#, __y
	cmovne	%rcx, %rdx	# tmp227,, _29
# /usr/include/c++/12/bits/random.tcc:422:       _M_x[__n - 1] = (_M_x[__m - 1] ^ (__y >> 1)
	movq	%rdx, 4984(%rax)	# _29, this_40(D)->_M_x[623]
	vzeroupper
# /usr/include/c++/12/bits/random.tcc:425:     }
	ret	
	.cfi_endproc
.LFE4921:
	.size	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv, .-_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv
	.section	.text.unlikely,"ax",@progbits
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4
	.globl	_Z11init_matrixPfii
	.type	_Z11init_matrixPfii, @function
_Z11init_matrixPfii:
.LFB4149:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4149
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
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
	subq	$4096, %rsp	#,
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)	#,
	subq	$4096, %rsp	#,
	.cfi_def_cfa_offset 8248
	orq	$0, (%rsp)	#,
	subq	$1832, %rsp	#,
	.cfi_def_cfa_offset 10080
# /usr/include/c++/12/bits/random.h:1621:     random_device() { _M_init("default"); }
	movq	%rsp, %r13	#, tmp164
# gemm_test.cpp:20: void init_matrix(float* matrix, int rows, int cols) {
	movq	%rdi, %rbp	# tmp165, matrix
	movl	%esi, %r12d	# tmp166, rows
	movl	%edx, %r14d	# tmp167, cols
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp174
	movq	%rax, 10008(%rsp)	# tmp174, D.87912
	xorl	%eax, %eax	# tmp174
# /usr/include/c++/12/bits/basic_string.h:200: 	: allocator_type(__a), _M_p(__dat) { }
	leaq	5008(%rsp), %rbx	#, tmp162
# /usr/include/c++/12/bits/random.h:1621:     random_device() { _M_init("default"); }
	movq	%r13, %rdi	# tmp164,
# /usr/include/c++/12/bits/basic_string.h:200: 	: allocator_type(__a), _M_p(__dat) { }
	leaq	5024(%rsp), %r15	#, tmp163
# /usr/include/c++/12/bits/random.h:1621:     random_device() { _M_init("default"); }
	movq	%rbx, %rsi	# tmp162,
# /usr/include/c++/12/bits/char_traits.h:435: 	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
	movl	$1634100580, 5024(%rsp)	#, MEM <char[1:7]> [(void *)_129]
# /usr/include/c++/12/bits/basic_string.h:200: 	: allocator_type(__a), _M_p(__dat) { }
	movq	%r15, 5008(%rsp)	# tmp163, MEM[(struct _Alloc_hider *)_129]._M_p
# /usr/include/c++/12/bits/char_traits.h:435: 	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
	movl	$1953264993, 5027(%rsp)	#, MEM <char[1:7]> [(void *)_129]
# /usr/include/c++/12/bits/basic_string.h:229:       { _M_string_length = __length; }
	movq	$7, 5016(%rsp)	#, MEM[(struct basic_string *)_129]._M_string_length
# /usr/include/c++/12/bits/char_traits.h:358: 	__c1 = __c2;
	movb	$0, 5031(%rsp)	#, MEM[(char_type &)_129]
.LEHB0:
# /usr/include/c++/12/bits/random.h:1621:     random_device() { _M_init("default"); }
	call	_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT	#
.LEHE0:
# /usr/include/c++/12/bits/basic_string.h:234:       { return _M_dataplus._M_p; }
	movq	5008(%rsp), %rdi	# MEM[(struct basic_string *)_129]._M_dataplus._M_p, _52
# /usr/include/c++/12/bits/basic_string.h:275: 	if (_M_data() == _M_local_data())
	cmpq	%r15, %rdi	# tmp163, _52
	je	.L41	#,
# /usr/include/c++/12/bits/basic_string.h:300:       { _Alloc_traits::deallocate(_M_get_allocator(), _M_data(), __size + 1); }
	movq	5024(%rsp), %rax	# MEM[(struct basic_string *)_129].D.27860._M_allocated_capacity, tmp177
	leaq	1(%rax), %rsi	#, tmp130
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	call	_ZdlPvm@PLT	#
.L41:
# /usr/include/c++/12/bits/random.h:1651:     { return this->_M_getval(); }
	movq	%r13, %rdi	# tmp164,
.LEHB1:
	call	_ZNSt13random_device9_M_getvalEv@PLT	#
.LEHE1:
# gemm_test.cpp:22:     std::mt19937 gen(rd());
	movl	%eax, %ecx	# tmp168, gen___M_x_I_lsm0.283
# /usr/include/c++/12/bits/random.tcc:333:       for (size_t __i = 1; __i < state_size; ++__i)
	movl	$1, %edx	#, __i
# /usr/include/c++/12/bits/random.tcc:330:       _M_x[0] = __detail::__mod<_UIntType,
	movq	%rcx, 5008(%rsp)	# gen___M_x_I_lsm0.283, MEM[(struct mersenne_twister_engine *)_129]._M_x[0]
	.p2align 4,,10
	.p2align 3
.L44:
# /usr/include/c++/12/bits/random.tcc:336: 	  __x ^= __x >> (__w - 2);
	movq	%rcx, %rax	# gen___M_x_I_lsm0.283, tmp135
	shrq	$30, %rax	#, tmp135
# /usr/include/c++/12/bits/random.tcc:336: 	  __x ^= __x >> (__w - 2);
	xorq	%rcx, %rax	# gen___M_x_I_lsm0.283, __x
# /usr/include/c++/12/bits/random.tcc:337: 	  __x *= __f;
	imulq	$1812433253, %rax, %rax	#, __x, __x
# /usr/include/c++/12/bits/random.h:143: 	    __res %= __m;
	leal	(%rax,%rdx), %ecx	#, gen___M_x_I_lsm0.283
# /usr/include/c++/12/bits/random.tcc:339: 	  _M_x[__i] = __detail::__mod<_UIntType,
	movq	%rcx, (%rbx,%rdx,8)	# gen___M_x_I_lsm0.283, MEM[(long unsigned int *)_129]
# /usr/include/c++/12/bits/random.tcc:333:       for (size_t __i = 1; __i < state_size; ++__i)
	addq	$1, %rdx	#, __i
# /usr/include/c++/12/bits/random.tcc:333:       for (size_t __i = 1; __i < state_size; ++__i)
	cmpq	$624, %rdx	#, __i
	jne	.L44	#,
# /usr/include/c++/12/bits/random.tcc:342:       _M_p = state_size;
	movq	$624, 10000(%rsp)	#, MEM[(struct mersenne_twister_engine *)_129]._M_p
# gemm_test.cpp:25:     for (int i = 0; i < rows * cols; i++) {
	imull	%r14d, %r12d	# cols, _38
# gemm_test.cpp:25:     for (int i = 0; i < rows * cols; i++) {
	testl	%r12d, %r12d	# _38
	jle	.L51	#,
	movslq	%r12d, %r12	# _38, _38
	vmovss	.LC12(%rip), %xmm3	#, tmp160
	vxorps	%xmm4, %xmm4, %xmm4	# tmp171
# /usr/include/c++/12/bits/random.tcc:3372: 	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
	vxorps	%xmm1, %xmm1, %xmm1	# tmp151
	vmovss	.LC13(%rip), %xmm2	#, tmp161
	leaq	0(%rbp,%r12,4), %r12	#, _130
	jmp	.L52	#
	.p2align 4,,10
	.p2align 3
.L62:
# /usr/include/c++/12/bits/random.tcc:3372: 	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
	vcvtsi2ssq	%rax, %xmm4, %xmm0	# __z, tmp171, tmp172
# /usr/include/c++/12/bits/random.tcc:3372: 	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
	vaddss	%xmm1, %xmm0, %xmm0	# tmp151, tmp146, __sum
# /usr/include/c++/12/bits/random.tcc:3375:       __ret = __sum / __tmp;
	vmulss	%xmm3, %xmm0, %xmm0	# tmp160, __sum, __ret
# /usr/include/c++/12/bits/random.tcc:3376:       if (__builtin_expect(__ret >= _RealType(1), 0))
	vcomiss	%xmm2, %xmm0	# tmp161, __ret
	jnb	.L49	#,
.L63:
# /usr/include/c++/12/bits/random.h:1873: 	  return (__aurng() * (__p.b() - __p.a())) + __p.a();
	vaddss	%xmm1, %xmm0, %xmm0	# tmp151, __ret, tmp154
# gemm_test.cpp:25:     for (int i = 0; i < rows * cols; i++) {
	addq	$4, %rbp	#, ivtmp.287
# gemm_test.cpp:26:         matrix[i] = dis(gen);
	vmovss	%xmm0, -4(%rbp)	# tmp154, MEM[(float *)_106]
# gemm_test.cpp:25:     for (int i = 0; i < rows * cols; i++) {
	cmpq	%r12, %rbp	# _130, ivtmp.287
	je	.L51	#,
.L50:
# /usr/include/c++/12/bits/random.tcc:333:       for (size_t __i = 1; __i < state_size; ++__i)
	movq	%rcx, %rdx	# _75, __i
.L52:
# /usr/include/c++/12/bits/random.tcc:458:       if (_M_p >= state_size)
	cmpq	$623, %rdx	#, __i
	ja	.L61	#,
.L46:
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	5008(%rsp,%rdx,8), %rax	# MEM[(struct mersenne_twister_engine *)_129]._M_x[prephitmp_139], __z
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	leaq	1(%rdx), %rcx	#, _75
	movq	%rcx, 10000(%rsp)	# _75, MEM[(struct mersenne_twister_engine *)_129]._M_p
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movq	%rax, %rdx	# __z, tmp142
	shrq	$11, %rdx	#, tmp142
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movl	%edx, %edx	# tmp142, _78
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	xorq	%rdx, %rax	# _78, __z
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	movq	%rax, %rdx	# __z, tmp143
	salq	$7, %rdx	#, tmp143
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	andl	$2636928640, %edx	#, _81
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	xorq	%rdx, %rax	# _81, __z
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	movq	%rax, %rdx	# __z, tmp144
	salq	$15, %rdx	#, tmp144
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	andl	$4022730752, %edx	#, _84
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	xorq	%rdx, %rax	# _84, __z
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	movq	%rax, %rdx	# __z, _86
	shrq	$18, %rdx	#, _86
# /usr/include/c++/12/bits/random.tcc:3372: 	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
	xorq	%rdx, %rax	# _86, __z
	jns	.L62	#,
	movq	%rax, %rdx	# __z, tmp148
	andl	$1, %eax	#, tmp149
	shrq	%rdx	# tmp148
	orq	%rax, %rdx	# tmp149, tmp148
	vcvtsi2ssq	%rdx, %xmm4, %xmm0	# tmp148, tmp171, tmp173
	vaddss	%xmm0, %xmm0, %xmm0	# tmp147, tmp147, tmp146
# /usr/include/c++/12/bits/random.tcc:3372: 	  __sum += _RealType(__urng() - __urng.min()) * __tmp;
	vaddss	%xmm1, %xmm0, %xmm0	# tmp151, tmp146, __sum
# /usr/include/c++/12/bits/random.tcc:3375:       __ret = __sum / __tmp;
	vmulss	%xmm3, %xmm0, %xmm0	# tmp160, __sum, __ret
# /usr/include/c++/12/bits/random.tcc:3376:       if (__builtin_expect(__ret >= _RealType(1), 0))
	vcomiss	%xmm2, %xmm0	# tmp161, __ret
	jb	.L63	#,
.L49:
# gemm_test.cpp:26:         matrix[i] = dis(gen);
	movl	$0x3f7fffff, 0(%rbp)	#, MEM[(float *)_126]
# gemm_test.cpp:25:     for (int i = 0; i < rows * cols; i++) {
	addq	$4, %rbp	#, ivtmp.287
	cmpq	%r12, %rbp	# _130, ivtmp.287
	jne	.L50	#,
.L51:
# /usr/include/c++/12/bits/random.h:1628:     { _M_fini(); }
	movq	%r13, %rdi	# tmp164,
	call	_ZNSt13random_device7_M_finiEv@PLT	#
# gemm_test.cpp:28: }
	movq	10008(%rsp), %rax	# D.87912, tmp175
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp175
	jne	.L64	#,
	addq	$10024, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
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
	.p2align 4,,10
	.p2align 3
.L61:
	.cfi_restore_state
# /usr/include/c++/12/bits/random.tcc:459: 	_M_gen_rand();
	movq	%rbx, %rdi	# tmp162,
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv	#
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	vxorps	%xmm4, %xmm4, %xmm4	# tmp171
	vxorps	%xmm1, %xmm1, %xmm1	# tmp151
	movq	10000(%rsp), %rdx	# MEM[(struct mersenne_twister_engine *)_129]._M_p, __i
	vmovss	.LC13(%rip), %xmm2	#, tmp161
	vmovss	.LC12(%rip), %xmm3	#, tmp160
	jmp	.L46	#
.L64:
# gemm_test.cpp:28: }
	call	__stack_chk_fail@PLT	#
.L55:
	endbr64	
# /usr/include/c++/12/bits/random.h:1628:     { _M_fini(); }
	movq	%rax, %rbx	# tmp170, tmp158
	jmp	.L53	#
.L56:
	endbr64	
# /usr/include/c++/12/bits/basic_string.h:803:       { _M_dispose(); }
	movq	%rax, %rbp	# tmp169, tmp134
	jmp	.L43	#
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA4149:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4149-.LLSDACSB4149
.LLSDACSB4149:
	.uleb128 .LEHB0-.LFB4149
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L56-.LFB4149
	.uleb128 0
	.uleb128 .LEHB1-.LFB4149
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L55-.LFB4149
	.uleb128 0
.LLSDACSE4149:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC4149
	.type	_Z11init_matrixPfii.cold, @function
_Z11init_matrixPfii.cold:
.LFSB4149:
.L53:
	.cfi_def_cfa_offset 10080
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
# /usr/include/c++/12/bits/random.h:1628:     { _M_fini(); }
	movq	%r13, %rdi	# tmp164,
	vzeroupper
	call	_ZNSt13random_device7_M_finiEv@PLT	#
	movq	%rbx, %rdi	# tmp158,
.LEHB2:
	call	_Unwind_Resume@PLT	#
.L43:
# /usr/include/c++/12/bits/basic_string.h:803:       { _M_dispose(); }
	movq	%rbx, %rdi	# tmp162,
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT	#
	movq	%rbp, %rdi	# tmp134,
	call	_Unwind_Resume@PLT	#
.LEHE2:
	.cfi_endproc
.LFE4149:
	.section	.gcc_except_table
.LLSDAC4149:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC4149-.LLSDACSBC4149
.LLSDACSBC4149:
	.uleb128 .LEHB2-.LCOLDB15
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSEC4149:
	.section	.text.unlikely
	.text
	.size	_Z11init_matrixPfii, .-_Z11init_matrixPfii
	.section	.text.unlikely
	.size	_Z11init_matrixPfii.cold, .-_Z11init_matrixPfii.cold
.LCOLDE15:
	.text
.LHOTE15:
	.align 2
	.p2align 4
	.type	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE.isra.0, @function
_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE.isra.0:
.LFB4974:
	.cfi_startproc
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%esi, %rax	# tmp195,
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
# /usr/include/c++/12/bits/uniform_int_dist.h:291: 	  = __uctype(__param.b()) - __uctype(__param.a());
	movslq	%edx, %r13	# tmp196, ISRA.301
# /usr/include/c++/12/bits/uniform_int_dist.h:276:       uniform_int_distribution<_IntType>::
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
# /usr/include/c++/12/bits/uniform_int_dist.h:290: 	const __uctype __urange
	subq	%rax, %r13	# ISRA.300, __urange
# /usr/include/c++/12/bits/uniform_int_dist.h:276:       uniform_int_distribution<_IntType>::
	movq	%rdi, %r12	# tmp194, __urng
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rax, %rbp	#,
# /usr/include/c++/12/bits/uniform_int_dist.h:294: 	if (__urngrange > __urange)
	movl	$4294967294, %eax	#, tmp165
# /usr/include/c++/12/bits/uniform_int_dist.h:276:       uniform_int_distribution<_IntType>::
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 64
# /usr/include/c++/12/bits/uniform_int_dist.h:294: 	if (__urngrange > __urange)
	cmpq	%r13, %rax	# __urange, tmp165
	jnb	.L82	#,
# /usr/include/c++/12/bits/uniform_int_dist.h:331: 	else if (__urngrange < __urange)
	movl	$4294967295, %eax	#, tmp177
	cmpq	%rax, %r13	# tmp177, __urange
	je	.L72	#,
.L80:
# /usr/include/c++/12/bits/uniform_int_dist.h:353: 			 (__urng, param_type(0, __urange / __uerngrange)));
	movl	$-1, %edx	#,
	xorl	%esi, %esi	#
	movq	%r12, %rdi	# __urng,
	call	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE.isra.0	#
# /usr/include/c++/12/bits/uniform_int_dist.h:352: 		__tmp = (__uerngrange * operator()
	movq	%rax, %rbx	# tmp197, __tmp
# /usr/include/c++/12/bits/random.tcc:458:       if (_M_p >= state_size)
	movq	4992(%r12), %rax	# __urng_8(D)->_M_p, _85
# /usr/include/c++/12/bits/uniform_int_dist.h:352: 		__tmp = (__uerngrange * operator()
	salq	$32, %rbx	#, __tmp
# /usr/include/c++/12/bits/random.tcc:458:       if (_M_p >= state_size)
	cmpq	$623, %rax	#, _85
	jbe	.L73	#,
# /usr/include/c++/12/bits/random.tcc:459: 	_M_gen_rand();
	movq	%r12, %rdi	# __urng,
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv	#
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	4992(%r12), %rax	# __urng_8(D)->_M_p, _85
.L73:
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	leaq	1(%rax), %rdx	#, tmp179
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	(%r12,%rax,8), %rax	# __urng_8(D)->_M_x[prephitmp_221], __z
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	%rdx, 4992(%r12)	# tmp179, __urng_8(D)->_M_p
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movq	%rax, %rdx	# __z, tmp180
	shrq	$11, %rdx	#, tmp180
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movl	%edx, %edx	# tmp180, _90
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	xorq	%rdx, %rax	# _90, __z
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	movq	%rax, %rdx	# __z, tmp181
	salq	$7, %rdx	#, tmp181
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	andl	$2636928640, %edx	#, _93
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	xorq	%rdx, %rax	# _93, __z
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	movq	%rax, %rdx	# __z, tmp182
	salq	$15, %rdx	#, tmp182
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	andl	$4022730752, %edx	#, _96
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	xorq	%rdx, %rax	# _96, __z
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	movq	%rax, %rdx	# __z, _98
	shrq	$18, %rdx	#, _98
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	xorq	%rdx, %rax	# _98, __z
	addq	%rax, %rbx	# __z, tmp184
	setc	%al	#, _243
	movzbl	%al, %eax	# _243, _243
# /usr/include/c++/12/bits/uniform_int_dist.h:356: 	    while (__ret > __urange || __ret < __tmp);
	cmpq	%rbx, %r13	# __ret, __urange
	jb	.L80	#,
	testq	%rax, %rax	# _243
	jne	.L80	#,
.L71:
# /usr/include/c++/12/bits/uniform_int_dist.h:362:       }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
# /usr/include/c++/12/bits/uniform_int_dist.h:361: 	return __ret + __param.a();
	leal	0(%rbp,%rbx), %eax	#, tmp193
# /usr/include/c++/12/bits/uniform_int_dist.h:362:       }
	popq	%rbx	#
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
	.p2align 4,,10
	.p2align 3
.L82:
	.cfi_restore_state
# /usr/include/c++/12/bits/random.tcc:458:       if (_M_p >= state_size)
	movq	4992(%rdi), %rax	# __urng_8(D)->_M_p, _55
# /usr/include/c++/12/bits/uniform_int_dist.h:298: 	    const __uctype __uerange = __urange + 1; // __urange can be zero
	addq	$1, %r13	#, __uerange
# /usr/include/c++/12/bits/uniform_int_dist.h:316: 		__UINT32_TYPE__ __u32erange = __uerange;
	movl	%r13d, %r15d	# __uerange, __u32erange
# /usr/include/c++/12/bits/random.tcc:458:       if (_M_p >= state_size)
	cmpq	$623, %rax	#, _55
	ja	.L83	#,
.L67:
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	(%r12,%rax,8), %rbx	# __urng_8(D)->_M_x[prephitmp_223], __z
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	leaq	1(%rax), %rcx	#, _72
	movq	%rcx, 4992(%r12)	# _72, __urng_8(D)->_M_p
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movq	%rbx, %rax	# __z, tmp166
	shrq	$11, %rax	#, tmp166
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movl	%eax, %eax	# tmp166, _60
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	xorq	%rax, %rbx	# _60, __z
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	movq	%rbx, %rax	# __z, tmp167
	salq	$7, %rax	#, tmp167
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	andl	$2636928640, %eax	#, _63
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	xorq	%rax, %rbx	# _63, __z
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	movq	%rbx, %rax	# __z, tmp168
	salq	$15, %rax	#, tmp168
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	andl	$4022730752, %eax	#, _66
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	xorq	%rax, %rbx	# _66, __z
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	movq	%rbx, %rax	# __z, _68
	shrq	$18, %rax	#, _68
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	xorq	%rax, %rbx	# _68, __z
# /usr/include/c++/12/bits/uniform_int_dist.h:258: 	  _Wp __product = _Wp(__g()) * _Wp(__range);
	imulq	%r13, %rbx	# __uerange, __product
# /usr/include/c++/12/bits/uniform_int_dist.h:260: 	  if (__low < __range)
	cmpl	%r13d, %ebx	# __uerange, __product
	jnb	.L68	#,
# /usr/include/c++/12/bits/uniform_int_dist.h:262: 	      _Up __threshold = -__range % __range;
	movl	%r13d, %eax	# __uerange, tmp170
# /usr/include/c++/12/bits/uniform_int_dist.h:262: 	      _Up __threshold = -__range % __range;
	xorl	%edx, %edx	# tmp171
# /usr/include/c++/12/bits/uniform_int_dist.h:262: 	      _Up __threshold = -__range % __range;
	negl	%eax	# tmp170
# /usr/include/c++/12/bits/uniform_int_dist.h:262: 	      _Up __threshold = -__range % __range;
	divl	%r15d	# __u32erange
	movl	%edx, %r14d	# tmp171, tmp171
# /usr/include/c++/12/bits/uniform_int_dist.h:263: 	      while (__low < __threshold)
	cmpl	%edx, %ebx	# tmp171, __product
	jb	.L70	#,
	jmp	.L68	#
	.p2align 4,,10
	.p2align 3
.L69:
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	(%r12,%rax,8), %rbx	# __urng_8(D)->_M_x[prephitmp_245], __z
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	leaq	1(%rax), %rcx	#, _72
	movq	%rcx, 4992(%r12)	# _72, __urng_8(D)->_M_p
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movq	%rbx, %rax	# __z, tmp173
	shrq	$11, %rax	#, tmp173
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movl	%eax, %eax	# tmp173, _75
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	xorq	%rax, %rbx	# _75, __z
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	movq	%rbx, %rax	# __z, tmp174
	salq	$7, %rax	#, tmp174
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	andl	$2636928640, %eax	#, _78
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	xorq	%rax, %rbx	# _78, __z
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	movq	%rbx, %rax	# __z, tmp175
	salq	$15, %rax	#, tmp175
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	andl	$4022730752, %eax	#, _81
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	xorq	%rax, %rbx	# _81, __z
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	movq	%rbx, %rax	# __z, _83
	shrq	$18, %rax	#, _83
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	xorq	%rax, %rbx	# _83, __z
# /usr/include/c++/12/bits/uniform_int_dist.h:265: 		  __product = _Wp(__g()) * _Wp(__range);
	imulq	%r13, %rbx	# __uerange, __product
# /usr/include/c++/12/bits/uniform_int_dist.h:263: 	      while (__low < __threshold)
	cmpl	%r14d, %ebx	# tmp171, __product
	jnb	.L68	#,
.L70:
	movq	%rcx, %rax	# _72, pretmp_244
# /usr/include/c++/12/bits/random.tcc:458:       if (_M_p >= state_size)
	cmpq	$623, %rcx	#, pretmp_244
	jbe	.L69	#,
# /usr/include/c++/12/bits/random.tcc:459: 	_M_gen_rand();
	movq	%r12, %rdi	# __urng,
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv	#
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	4992(%r12), %rax	# __urng_8(D)->_M_p, pretmp_244
	jmp	.L69	#
	.p2align 4,,10
	.p2align 3
.L68:
# /usr/include/c++/12/bits/uniform_int_dist.h:269: 	  return __product >> _Up_traits::__digits;
	shrq	$32, %rbx	#, __ret
	jmp	.L71	#
	.p2align 4,,10
	.p2align 3
.L72:
# /usr/include/c++/12/bits/random.tcc:458:       if (_M_p >= state_size)
	movq	4992(%rdi), %rax	# __urng_8(D)->_M_p, _100
# /usr/include/c++/12/bits/random.tcc:458:       if (_M_p >= state_size)
	cmpq	$623, %rax	#, _100
	ja	.L84	#,
.L77:
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	(%r12,%rax,8), %rbx	# __urng_8(D)->_M_x[prephitmp_219], __z
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	leaq	1(%rax), %rdx	#, tmp189
	movq	%rdx, 4992(%r12)	# tmp189, __urng_8(D)->_M_p
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movq	%rbx, %rax	# __z, tmp190
	shrq	$11, %rax	#, tmp190
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	movl	%eax, %eax	# tmp190, _105
# /usr/include/c++/12/bits/random.tcc:463:       __z ^= (__z >> __u) & __d;
	xorq	%rax, %rbx	# _105, __z
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	movq	%rbx, %rax	# __z, tmp191
	salq	$7, %rax	#, tmp191
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	andl	$2636928640, %eax	#, _108
# /usr/include/c++/12/bits/random.tcc:464:       __z ^= (__z << __s) & __b;
	xorq	%rax, %rbx	# _108, __z
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	movq	%rbx, %rax	# __z, tmp192
	salq	$15, %rax	#, tmp192
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	andl	$4022730752, %eax	#, _111
# /usr/include/c++/12/bits/random.tcc:465:       __z ^= (__z << __t) & __c;
	xorq	%rax, %rbx	# _111, __z
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	movq	%rbx, %rax	# __z, _113
	shrq	$18, %rax	#, _113
# /usr/include/c++/12/bits/random.tcc:466:       __z ^= (__z >> __l);
	xorq	%rax, %rbx	# _113, __ret
	jmp	.L71	#
	.p2align 4,,10
	.p2align 3
.L83:
# /usr/include/c++/12/bits/random.tcc:459: 	_M_gen_rand();
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv	#
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	4992(%r12), %rax	# __urng_8(D)->_M_p, _55
	jmp	.L67	#
	.p2align 4,,10
	.p2align 3
.L84:
# /usr/include/c++/12/bits/random.tcc:459: 	_M_gen_rand();
	call	_ZNSt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EE11_M_gen_randEv	#
# /usr/include/c++/12/bits/random.tcc:462:       result_type __z = _M_x[_M_p++];
	movq	4992(%r12), %rax	# __urng_8(D)->_M_p, _100
	jmp	.L77	#
	.cfi_endproc
.LFE4974:
	.size	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE.isra.0, .-_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE.isra.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC18:
	.string	"Mismatch at ("
.LC19:
	.string	", "
.LC20:
	.string	"): "
.LC21:
	.string	" vs "
	.section	.text.unlikely
.LCOLDB22:
	.text
.LHOTB22:
	.p2align 4
	.globl	_Z13verify_resultPfS_S_iii
	.type	_Z13verify_resultPfS_S_iii, @function
_Z13verify_resultPfS_S_iii:
.LFB4150:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4150
	endbr64	
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	movq	%rsp, %rbp	#,
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx	#
	subq	$4096, %rsp	#,
	orq	$0, (%rsp)	#,
	subq	$4096, %rsp	#,
	orq	$0, (%rsp)	#,
	subq	$1888, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
# gemm_test.cpp:31: bool verify_result(float* A, float* B, float* C, int M, int N, int K) {
	movq	%rdi, -10072(%rbp)	# tmp428, %sfp
	movq	%rsi, %r14	# tmp429, B
	movl	%ecx, %r12d	# tmp431, M
	movl	%r9d, %r13d	# tmp433, K
	movq	%rdx, -10096(%rbp)	# tmp430, %sfp
# /usr/include/c++/12/bits/basic_string.h:200: 	: allocator_type(__a), _M_p(__dat) { }
	leaq	-5056(%rbp), %rbx	#, tmp421
	leaq	-5040(%rbp), %r15	#, tmp422
# gemm_test.cpp:31: bool verify_result(float* A, float* B, float* C, int M, int N, int K) {
	movl	%r8d, -10076(%rbp)	# tmp432, %sfp
# /usr/include/c++/12/bits/random.h:1621:     random_device() { _M_init("default"); }
	movq	%rbx, %rsi	# tmp421,
# gemm_test.cpp:31: bool verify_result(float* A, float* B, float* C, int M, int N, int K) {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp447
	movq	%rax, -56(%rbp)	# tmp447, D.88084
	xorl	%eax, %eax	# tmp447
# /usr/include/c++/12/bits/random.h:1621:     random_device() { _M_init("default"); }
	leaq	-10064(%rbp), %rax	#, tmp423
# /usr/include/c++/12/bits/basic_string.h:200: 	: allocator_type(__a), _M_p(__dat) { }
	movq	%r15, -5056(%rbp)	# tmp422, MEM[(struct _Alloc_hider *)_284]._M_p
# /usr/include/c++/12/bits/random.h:1621:     random_device() { _M_init("default"); }
	movq	%rax, %rdi	# tmp423,
# /usr/include/c++/12/bits/char_traits.h:358: 	__c1 = __c2;
	movb	$0, -5033(%rbp)	#, MEM[(char_type &)_284]
# /usr/include/c++/12/bits/char_traits.h:435: 	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
	movl	$1634100580, -5040(%rbp)	#, MEM <char[1:7]> [(void *)_284]
# /usr/include/c++/12/bits/basic_string.h:229:       { _M_string_length = __length; }
	movq	$7, -5048(%rbp)	#, MEM[(struct basic_string *)_284]._M_string_length
# /usr/include/c++/12/bits/char_traits.h:435: 	return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n));
	movl	$1953264993, -5037(%rbp)	#, MEM <char[1:7]> [(void *)_284]
# /usr/include/c++/12/bits/random.h:1621:     random_device() { _M_init("default"); }
	movq	%rax, -10120(%rbp)	# tmp423, %sfp
.LEHB3:
	call	_ZNSt13random_device7_M_initERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE@PLT	#
.LEHE3:
# /usr/include/c++/12/bits/basic_string.h:234:       { return _M_dataplus._M_p; }
	movq	-5056(%rbp), %rdi	# MEM[(struct basic_string *)_284]._M_dataplus._M_p, _115
# /usr/include/c++/12/bits/basic_string.h:275: 	if (_M_data() == _M_local_data())
	cmpq	%r15, %rdi	# tmp422, _115
	je	.L86	#,
# /usr/include/c++/12/bits/basic_string.h:300:       { _Alloc_traits::deallocate(_M_get_allocator(), _M_data(), __size + 1); }
	movq	-5040(%rbp), %rax	# MEM[(struct basic_string *)_284].D.27860._M_allocated_capacity, tmp488
	leaq	1(%rax), %rsi	#, tmp308
# /usr/include/c++/12/bits/new_allocator.h:158: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	call	_ZdlPvm@PLT	#
.L86:
# /usr/include/c++/12/bits/random.h:1651:     { return this->_M_getval(); }
	movq	-10120(%rbp), %rdi	# %sfp,
.LEHB4:
	call	_ZNSt13random_device9_M_getvalEv@PLT	#
.LEHE4:
# gemm_test.cpp:35:     std::mt19937 gen(rd());
	movl	%eax, %eax	# tmp434, __res
# /usr/include/c++/12/bits/random.tcc:333:       for (size_t __i = 1; __i < state_size; ++__i)
	movl	$1, %ecx	#, __i
# /usr/include/c++/12/bits/random.tcc:330:       _M_x[0] = __detail::__mod<_UIntType,
	movq	%rax, -5056(%rbp)	# __res, MEM[(struct mersenne_twister_engine *)_284]._M_x[0]
	movq	%rax, %rdx	# __res, __res
	.p2align 4,,10
	.p2align 3
.L89:
# /usr/include/c++/12/bits/random.tcc:336: 	  __x ^= __x >> (__w - 2);
	movq	%rdx, %rax	# __res, tmp313
	shrq	$30, %rax	#, tmp313
# /usr/include/c++/12/bits/random.tcc:336: 	  __x ^= __x >> (__w - 2);
	xorq	%rdx, %rax	# __res, __x
# /usr/include/c++/12/bits/random.tcc:337: 	  __x *= __f;
	imulq	$1812433253, %rax, %rax	#, __x, __x
# /usr/include/c++/12/bits/random.h:143: 	    __res %= __m;
	leal	(%rax,%rcx), %edx	#, __res
# /usr/include/c++/12/bits/random.tcc:339: 	  _M_x[__i] = __detail::__mod<_UIntType,
	movq	%rdx, (%rbx,%rcx,8)	# __res, MEM[(long unsigned int *)_284]
# /usr/include/c++/12/bits/random.tcc:333:       for (size_t __i = 1; __i < state_size; ++__i)
	addq	$1, %rcx	#, __i
# /usr/include/c++/12/bits/random.tcc:333:       for (size_t __i = 1; __i < state_size; ++__i)
	cmpq	$624, %rcx	#, __i
	jne	.L89	#,
# gemm_test.cpp:36:     std::uniform_int_distribution<int> row_dis(0, M-1);
	leal	-1(%r12), %eax	#, _2
	movl	%r13d, %ecx	# K, bnd.312
	movq	%r14, %r8	# B, B
# /usr/include/c++/12/bits/random.tcc:342:       _M_p = state_size;
	movq	$624, -64(%rbp)	#, MEM[(struct mersenne_twister_engine *)_284]._M_p
# gemm_test.cpp:36:     std::uniform_int_distribution<int> row_dis(0, M-1);
	movl	%eax, -10080(%rbp)	# _2, %sfp
# gemm_test.cpp:37:     std::uniform_int_distribution<int> col_dis(0, N-1);
	movl	-10076(%rbp), %eax	# %sfp, N
	shrl	$3, %ecx	#,
	movl	$5, -10088(%rbp)	#, %sfp
	salq	$5, %rcx	#, _431
	subl	$1, %eax	#, _3
	movq	%rbx, -10104(%rbp)	# tmp421, %sfp
	movq	%rcx, %r14	# _431, _431
	movq	-10072(%rbp), %rbx	# %sfp, A
	movl	%eax, -10084(%rbp)	# _3, %sfp
	leal	-1(%r13), %eax	#, _26
	movl	%eax, -10108(%rbp)	# _26, %sfp
	movl	%r13d, %eax	# K, _304
	andl	$-8, %eax	#, _304
	movl	%eax, -10112(%rbp)	# _304, %sfp
.L109:
# /usr/include/c++/12/bits/uniform_int_dist.h:193:         { return this->operator()(__urng, _M_param); }
	movq	-10104(%rbp), %r12	# %sfp, tmp421
	movl	-10080(%rbp), %edx	# %sfp,
	xorl	%esi, %esi	#
	movq	%r8, -10072(%rbp)	# B, %sfp
	movq	%r12, %rdi	# tmp421,
	call	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE.isra.0	#
	movl	-10084(%rbp), %edx	# %sfp,
	xorl	%esi, %esi	#
	movq	%r12, %rdi	# tmp421,
	movl	%eax, %r15d	# tmp436, _68
	call	_ZNSt24uniform_int_distributionIiEclISt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEEEiRT_RKNS0_10param_typeE.isra.0	#
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	testl	%r13d, %r13d	# K
	movq	-10072(%rbp), %r8	# %sfp, B
# /usr/include/c++/12/bits/uniform_int_dist.h:193:         { return this->operator()(__urng, _M_param); }
	movl	%eax, %r12d	# tmp437, _67
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	jle	.L112	#,
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movl	%r13d, %eax	# K, _4
	imull	%r15d, %eax	# _68, _4
	cmpl	$1, -10076(%rbp)	#, %sfp
	jne	.L132	#,
	cmpl	$6, -10108(%rbp)	#, %sfp
	jbe	.L114	#,
# gemm_test.cpp:43:         float expected = 0.0f;
	movl	$0x00000000, -10072(%rbp)	#, %sfp
	movslq	%eax, %rdx	# _4, _4
	leaq	(%rbx,%rdx,4), %rdi	#, vectp.316
	movslq	%r12d, %rdx	# _67, _67
	leaq	(%r8,%rdx,4), %rsi	#, vectp.319
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	xorl	%edx, %edx	# ivtmp.352
	.p2align 4,,10
	.p2align 3
.L97:
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovups	(%rdi,%rdx), %ymm4	# MEM <vector(8) float> [(float *)vectp.316_188 + ivtmp.352_434 * 1], tmp515
	vmulps	(%rsi,%rdx), %ymm4, %ymm1	# MEM <vector(8) float> [(float *)vectp.319_194 + ivtmp.352_434 * 1], tmp515, vect__143.321
	addq	$32, %rdx	#, ivtmp.352
	vmovss	-10072(%rbp), %xmm0	# %sfp, stmp_expected_142.322
	vaddss	%xmm1, %xmm0, %xmm0	# tmp360, stmp_expected_142.322, stmp_expected_142.322
	vshufps	$85, %xmm1, %xmm1, %xmm3	#, tmp360, tmp360, stmp_expected_142.322
	vshufps	$255, %xmm1, %xmm1, %xmm2	#, tmp360, tmp360, stmp_expected_142.322
	vaddss	%xmm3, %xmm0, %xmm0	# stmp_expected_142.322, stmp_expected_142.322, stmp_expected_142.322
	vunpckhps	%xmm1, %xmm1, %xmm3	# tmp360, tmp360, stmp_expected_142.322
	vextractf128	$0x1, %ymm1, %xmm1	# vect__143.321, tmp364
	vaddss	%xmm3, %xmm0, %xmm0	# stmp_expected_142.322, stmp_expected_142.322, stmp_expected_142.322
	vaddss	%xmm2, %xmm0, %xmm0	# stmp_expected_142.322, stmp_expected_142.322, stmp_expected_142.322
	vshufps	$85, %xmm1, %xmm1, %xmm2	#, tmp364, tmp364, stmp_expected_142.322
	vaddss	%xmm1, %xmm0, %xmm0	# stmp_expected_142.322, stmp_expected_142.322, stmp_expected_142.322
	vaddss	%xmm2, %xmm0, %xmm0	# stmp_expected_142.322, stmp_expected_142.322, stmp_expected_142.322
	vunpckhps	%xmm1, %xmm1, %xmm2	# tmp364, tmp364, stmp_expected_142.322
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vshufps	$255, %xmm1, %xmm1, %xmm1	#, tmp364, tmp364, stmp_expected_142.322
	vaddss	%xmm2, %xmm0, %xmm0	# stmp_expected_142.322, stmp_expected_142.322, stmp_expected_142.322
	vaddss	%xmm1, %xmm0, %xmm6	# stmp_expected_142.322, stmp_expected_142.322, expected
	vmovss	%xmm6, -10072(%rbp)	# expected, %sfp
	cmpq	%rdx, %r14	# ivtmp.352, _431
	jne	.L97	#,
	movl	-10112(%rbp), %edi	# %sfp, _304
	cmpl	%edi, %r13d	# _304, K
	je	.L130	#,
	movl	%edi, %esi	# _304,
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	movl	%edi, %edx	# _304, tmp.326
	vzeroupper
.L96:
	movl	%r13d, %r10d	# K, niters.323
	subl	%esi, %r10d	# _186, niters.323
	leal	-1(%r10), %edi	#, tmp370
	cmpl	$2, %edi	#, tmp370
	jbe	.L101	#,
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%eax, %rdi	# _4, _4
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%r12d, %r9	# _67, _67
	vmovss	-10072(%rbp), %xmm1	# %sfp, stmp_expected_33.334
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addq	%rsi, %rdi	# _250, tmp372
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addq	%rsi, %r9	# _250, tmp375
	movl	%r10d, %esi	# niters.323, niters_vector_mult_vf.325
	vmovups	(%r8,%r9,4), %xmm0	# MEM <vector(4) float> [(float *)vectp.331_256], vect__58.332
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmulps	(%rbx,%rdi,4), %xmm0, %xmm0	# MEM <vector(4) float> [(float *)vectp.328_248], vect__58.332, vect__35.333
	andl	$-4, %esi	#, niters_vector_mult_vf.325
	addl	%esi, %edx	# niters_vector_mult_vf.325, tmp.326
	andl	$3, %r10d	#, niters.323
	vaddss	%xmm0, %xmm1, %xmm1	# vect__35.333, stmp_expected_33.334, stmp_expected_33.334
	vshufps	$85, %xmm0, %xmm0, %xmm2	#, vect__35.333, vect__35.333, stmp_expected_33.334
	vaddss	%xmm2, %xmm1, %xmm1	# stmp_expected_33.334, stmp_expected_33.334, stmp_expected_33.334
	vunpckhps	%xmm0, %xmm0, %xmm2	# vect__35.333, vect__35.333, stmp_expected_33.334
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vshufps	$255, %xmm0, %xmm0, %xmm0	#, vect__35.333, vect__35.333, stmp_expected_33.334
	vaddss	%xmm2, %xmm1, %xmm1	# stmp_expected_33.334, stmp_expected_33.334, stmp_expected_33.334
	vaddss	%xmm0, %xmm1, %xmm4	# stmp_expected_33.334, stmp_expected_33.334, expected
	vmovss	%xmm4, -10072(%rbp)	# expected, %sfp
	je	.L90	#,
.L101:
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	leal	(%rax,%rdx), %edi	#, tmp381
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	leal	(%r12,%rdx), %esi	#, tmp383
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	-10072(%rbp), %xmm7	# %sfp, expected
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%esi, %rsi	# tmp383, tmp384
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%edi, %rdi	# tmp381, tmp382
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	(%rbx,%rdi,4), %xmm6	# *_10, tmp524
	vfmadd231ss	(%r8,%rsi,4), %xmm6, %xmm7	# *_336, tmp524, expected
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	leal	1(%rdx), %esi	#, k
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	%xmm7, -10072(%rbp)	# expected, %sfp
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	cmpl	%esi, %r13d	# k, K
	jle	.L90	#,
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	leal	(%r12,%rsi), %edi	#, tmp385
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addl	%eax, %esi	# _4, tmp387
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	addl	$2, %edx	#, k
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%edi, %rdi	# tmp385, tmp386
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%esi, %rsi	# tmp387, tmp388
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	(%r8,%rdi,4), %xmm5	# *_143, tmp526
	vfmadd231ss	(%rbx,%rsi,4), %xmm5, %xmm7	# *_150, tmp526, expected
	vmovss	%xmm7, -10072(%rbp)	# expected, %sfp
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	cmpl	%edx, %r13d	# k, K
	jle	.L90	#,
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addl	%edx, %eax	# k, tmp389
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addl	%r12d, %edx	# _67, tmp391
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	cltq
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%edx, %rdx	# tmp391, tmp392
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	(%rbx,%rax,4), %xmm5	# *_227, tmp528
	vfmadd231ss	(%r8,%rdx,4), %xmm5, %xmm7	# *_232, tmp528, expected
	vmovss	%xmm7, -10072(%rbp)	# expected, %sfp
.L90:
# gemm_test.cpp:48:         if (std::abs(C[row * N + col] - expected) > 1e-4) {
	movl	-10076(%rbp), %eax	# %sfp, tmp393
# gemm_test.cpp:48:         if (std::abs(C[row * N + col] - expected) > 1e-4) {
	movq	-10096(%rbp), %rdi	# %sfp, C
# gemm_test.cpp:48:         if (std::abs(C[row * N + col] - expected) > 1e-4) {
	imull	%r15d, %eax	# _68, tmp393
# gemm_test.cpp:48:         if (std::abs(C[row * N + col] - expected) > 1e-4) {
	addl	%r12d, %eax	# _67, tmp394
	cltq
# gemm_test.cpp:48:         if (std::abs(C[row * N + col] - expected) > 1e-4) {
	leaq	(%rdi,%rax,4), %rax	#, _21
# gemm_test.cpp:48:         if (std::abs(C[row * N + col] - expected) > 1e-4) {
	vmovss	(%rax), %xmm0	# *_21, *_21
	vsubss	-10072(%rbp), %xmm0, %xmm0	# %sfp, *_21, tmp397
# /usr/include/c++/12/bits/std_abs.h:76:   { return __builtin_fabsf(__x); }
	vandps	.LC16(%rip), %xmm0, %xmm0	#, tmp397, tmp399
# gemm_test.cpp:48:         if (std::abs(C[row * N + col] - expected) > 1e-4) {
	vcvtss2sd	%xmm0, %xmm0, %xmm0	# tmp399, tmp401
# gemm_test.cpp:48:         if (std::abs(C[row * N + col] - expected) > 1e-4) {
	vcomisd	.LC17(%rip), %xmm0	#, tmp401
	ja	.L133	#,
# gemm_test.cpp:39:     for (int i = 0; i < num_checks; i++) {
	subl	$1, -10088(%rbp)	#, %sfp
	jne	.L109	#,
# gemm_test.cpp:54:     return true;
	movl	$1, %ebx	#, <retval>
.L108:
# /usr/include/c++/12/bits/random.h:1628:     { _M_fini(); }
	movq	-10120(%rbp), %rdi	# %sfp,
	call	_ZNSt13random_device7_M_finiEv@PLT	#
# gemm_test.cpp:55: }
	movq	-56(%rbp), %rax	# D.88084, tmp448
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp448
	jne	.L134	#,
	addq	$10080, %rsp	#,
	movl	%ebx, %eax	# <retval>,
	popq	%rbx	#
	popq	%r10	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	leaq	-8(%r10), %rsp	#,
	.cfi_def_cfa 7, 8
	ret	
.L132:
	.cfi_restore_state
	cmpl	$2, -10108(%rbp)	#, %sfp
	jbe	.L113	#,
	movslq	-10076(%rbp), %r10	# %sfp, _323
	movl	%r13d, %r9d	# K, bnd.336
	movslq	%eax, %rdx	# _4, _4
# gemm_test.cpp:43:         float expected = 0.0f;
	movl	$0x00000000, -10072(%rbp)	#, %sfp
	shrl	$2, %r9d	#,
	leaq	(%rbx,%rdx,4), %rsi	#, ivtmp.359
	movslq	%r12d, %rdx	# _67, _67
	movq	%r10, %r11	# _323, _324
	leaq	0(,%r10,4), %rdi	#, _328
	salq	$4, %r9	#, tmp326
	leaq	(%r10,%r10,2), %r10	#, tmp329
	salq	$4, %r11	#, _324
	leaq	(%r8,%rdx,4), %rdx	#, ivtmp.362
	addq	%rsi, %r9	# ivtmp.359, _415
	salq	$2, %r10	#, tmp330
	.p2align 4,,10
	.p2align 3
.L93:
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	(%rdx,%rdi,2), %xmm0	# MEM[(float *)_423 + _328 * 2], MEM[(float *)_423 + _328 * 2]
	vinsertps	$0x10, (%rdx,%r10), %xmm0, %xmm1	# MEM[(float *)_423 + _419 * 1], MEM[(float *)_423 + _328 * 2], tmp332
	addq	$16, %rsi	#, ivtmp.359
	vmovss	(%rdx), %xmm0	# MEM[(float *)_423], MEM[(float *)_423]
	vinsertps	$0x10, (%rdx,%rdi), %xmm0, %xmm0	# MEM[(float *)_423 + _328 * 1], MEM[(float *)_423], tmp335
	addq	%r11, %rdx	# _324, ivtmp.362
	vmovlhps	%xmm1, %xmm0, %xmm0	# tmp332, tmp335, tmp331
	vmovss	-10072(%rbp), %xmm1	# %sfp, stmp_expected_52.343
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmulps	-16(%rsi), %xmm0, %xmm0	# MEM <vector(4) float> [(float *)_424], tmp331, vect__16.342
	vaddss	%xmm0, %xmm1, %xmm1	# vect__16.342, stmp_expected_52.343, stmp_expected_52.343
	vshufps	$85, %xmm0, %xmm0, %xmm2	#, vect__16.342, vect__16.342, stmp_expected_52.343
	vaddss	%xmm2, %xmm1, %xmm1	# stmp_expected_52.343, stmp_expected_52.343, stmp_expected_52.343
	vunpckhps	%xmm0, %xmm0, %xmm2	# vect__16.342, vect__16.342, stmp_expected_52.343
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vshufps	$255, %xmm0, %xmm0, %xmm0	#, vect__16.342, vect__16.342, stmp_expected_52.343
	vaddss	%xmm2, %xmm1, %xmm1	# stmp_expected_52.343, stmp_expected_52.343, stmp_expected_52.343
	vaddss	%xmm0, %xmm1, %xmm7	# stmp_expected_52.343, stmp_expected_52.343, expected
	vmovss	%xmm7, -10072(%rbp)	# expected, %sfp
	cmpq	%rsi, %r9	# ivtmp.359, _415
	jne	.L93	#,
	movl	%r13d, %edx	# K, _243
	andl	$-4, %edx	#, _243
	testb	$3, %r13b	#, K
	je	.L90	#,
.L92:
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movl	-10076(%rbp), %ecx	# %sfp, N
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	leal	(%rax,%rdx), %r9d	#, tmp341
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	-10072(%rbp), %xmm4	# %sfp, expected
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%r9d, %r9	# tmp341, tmp342
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movl	%ecx, %esi	# N, _58
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	(%rbx,%r9,4), %xmm6	# *_84, tmp507
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	imull	%edx, %esi	# _243, _58
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	leal	(%rsi,%r12), %edi	#, tmp343
	movslq	%edi, %rdi	# tmp343, tmp344
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vfmadd231ss	(%r8,%rdi,4), %xmm6, %xmm4	# *_219, tmp507, expected
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	leal	1(%rdx), %edi	#, k
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	%xmm4, -10072(%rbp)	# expected, %sfp
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	cmpl	%edi, %r13d	# k, K
	jle	.L90	#,
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addl	%ecx, %esi	# N, _282
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addl	%eax, %edi	# _4, tmp347
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	addl	$2, %edx	#, k
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	leal	(%r12,%rsi), %r9d	#, tmp345
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%edi, %rdi	# tmp347, tmp348
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%r9d, %r9	# tmp345, tmp346
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	(%r8,%r9,4), %xmm7	# *_286, tmp510
	vfmadd231ss	(%rbx,%rdi,4), %xmm7, %xmm4	# *_151, tmp510, expected
	vmovss	%xmm4, -10072(%rbp)	# expected, %sfp
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	cmpl	%edx, %r13d	# k, K
	jle	.L90	#,
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addl	%eax, %edx	# _4, tmp349
	movslq	%edx, %rax	# tmp349, tmp350
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	leal	(%rcx,%rsi), %edx	#, tmp351
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	addl	%r12d, %edx	# _67, tmp352
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vmovss	(%rbx,%rax,4), %xmm6	# *_294, tmp513
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	movslq	%edx, %rdx	# tmp352, tmp353
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	vfmadd231ss	(%r8,%rdx,4), %xmm6, %xmm4	# *_300, tmp513, expected
	vmovss	%xmm4, -10072(%rbp)	# expected, %sfp
	jmp	.L90	#
.L112:
# gemm_test.cpp:43:         float expected = 0.0f;
	movl	$0x00000000, -10072(%rbp)	#, %sfp
	jmp	.L90	#
.L130:
	vzeroupper
	jmp	.L90	#
.L114:
	movl	$0x00000000, -10072(%rbp)	#, %sfp
# gemm_test.cpp:45:             expected += A[row * K + k] * B[k * N + col];
	xorl	%esi, %esi	#
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	xorl	%edx, %edx	# tmp.326
	jmp	.L96	#
.L133:
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	leaq	_ZSt4cout(%rip), %rbx	#, tmp424
	movl	$13, %edx	#,
	leaq	.LC18(%rip), %rsi	#, tmp403
	movq	%rax, %r14	# _21, _21
	movq	%rbx, %rdi	# tmp424,
.LEHB5:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# gemm_test.cpp:49:             std::cout << "Mismatch at (" << row << ", " << col << "): " 
	movl	%r15d, %esi	# _68,
	movq	%rbx, %rdi	# tmp424,
	call	_ZNSolsEi@PLT	#
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movl	$2, %edx	#,
	leaq	.LC19(%rip), %rsi	#, tmp406
	movq	%rax, %rdi	# _47,
# gemm_test.cpp:49:             std::cout << "Mismatch at (" << row << ", " << col << "): " 
	movq	%rax, %rbx	# tmp438, _47
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# gemm_test.cpp:49:             std::cout << "Mismatch at (" << row << ", " << col << "): " 
	movl	%r12d, %esi	# _67,
	movq	%rbx, %rdi	# _47,
	call	_ZNSolsEi@PLT	#
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movl	$3, %edx	#,
	leaq	.LC20(%rip), %rsi	#, tmp407
	movq	%rax, %rdi	# _49,
# gemm_test.cpp:49:             std::cout << "Mismatch at (" << row << ", " << col << "): " 
	movq	%rax, %rbx	# tmp439, _49
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
	vxorps	%xmm0, %xmm0, %xmm0	# tmp445
# /usr/include/c++/12/ostream:228: 	return _M_insert(static_cast<double>(__f));
	movq	%rbx, %rdi	# _49,
	vcvtss2sd	(%r14), %xmm0, %xmm0	# *_21, tmp445, tmp446
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movl	$4, %edx	#,
	leaq	.LC21(%rip), %rsi	#, tmp409
	movq	%rax, %rdi	# _71,
# /usr/include/c++/12/ostream:228: 	return _M_insert(static_cast<double>(__f));
	movq	%rax, %rbx	# tmp440, _71
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/12/ostream:228: 	return _M_insert(static_cast<double>(__f));
	movq	%rbx, %rdi	# _71,
	vcvtss2sd	-10072(%rbp), %xmm0, %xmm0	# %sfp, tmp410
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
	movq	%rax, %rbx	# tmp441, _73
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	movq	(%rax), %rax	# MEM[(struct basic_ostream *)_73]._vptr.basic_ostream, MEM[(struct basic_ostream *)_73]._vptr.basic_ostream
	movq	-24(%rax), %rax	# MEM[(long int *)_121 + -24B], MEM[(long int *)_121 + -24B]
	movq	240(%rbx,%rax), %r12	# MEM[(const struct __ctype_type * *)_124 + 240B], _129
# /usr/include/c++/12/bits/basic_ios.h:49:       if (!__f)
	testq	%r12, %r12	# _129
	je	.L135	#,
# /usr/include/c++/12/bits/locale_facets.h:882: 	if (_M_widen_ok)
	cmpb	$0, 56(%r12)	#, MEM[(const struct ctype *)_129]._M_widen_ok
	je	.L106	#,
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	movsbl	67(%r12), %esi	# MEM[(const struct ctype *)_129]._M_widen[10], _93
# /usr/include/c++/12/bits/locale_facets.h:883: 	  return _M_widen[static_cast<unsigned char>(__c)];
	jmp	.L107	#
.L106:
# /usr/include/c++/12/bits/locale_facets.h:884: 	this->_M_widen_init();
	movq	%r12, %rdi	# _129,
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT	#
# /usr/include/c++/12/bits/locale_facets.h:885: 	return this->do_widen(__c);
	movq	(%r12), %rax	# MEM[(const struct ctype *)_129].D.39988._vptr.facet, MEM[(const struct ctype *)_129].D.39988._vptr.facet
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx	#, tmp414
	movl	$10, %esi	#, _93
	movq	48(%rax), %rax	# MEM[(int (*) () *)_139 + 48B], _140
	cmpq	%rdx, %rax	# tmp414, _140
	jne	.L136	#,
.L107:
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	movq	%rbx, %rdi	# _73,
	call	_ZNSo3putEc@PLT	#
	movq	%rax, %rdi	# tmp443, _127
# /usr/include/c++/12/ostream:711:     { return __os.flush(); }
	call	_ZNSo5flushEv@PLT	#
# gemm_test.cpp:51:             return false;
	xorl	%ebx, %ebx	# <retval>
	jmp	.L108	#
.L113:
# gemm_test.cpp:43:         float expected = 0.0f;
	movl	$0x00000000, -10072(%rbp)	#, %sfp
# gemm_test.cpp:44:         for (int k = 0; k < K; k++) {
	xorl	%edx, %edx	# _243
	jmp	.L92	#
.L136:
# /usr/include/c++/12/bits/locale_facets.h:885: 	return this->do_widen(__c);
	movq	%r12, %rdi	# _129,
	call	*%rax	# _140
# /usr/include/c++/12/ostream:689:     { return flush(__os.put(__os.widen('\n'))); }
	movsbl	%al, %esi	# tmp442, _93
	jmp	.L107	#
.L134:
# gemm_test.cpp:55: }
	call	__stack_chk_fail@PLT	#
.L135:
# /usr/include/c++/12/bits/basic_ios.h:50: 	__throw_bad_cast();
	call	_ZSt16__throw_bad_castv@PLT	#
.LEHE5:
.L117:
	endbr64	
# /usr/include/c++/12/bits/random.h:1628:     { _M_fini(); }
	movq	%rax, %rbx	# tmp444, tmp418
	jmp	.L110	#
.L118:
	endbr64	
# /usr/include/c++/12/bits/basic_string.h:803:       { _M_dispose(); }
	movq	%rax, %r12	# tmp435, tmp312
	jmp	.L88	#
	.section	.gcc_except_table
.LLSDA4150:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4150-.LLSDACSB4150
.LLSDACSB4150:
	.uleb128 .LEHB3-.LFB4150
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L118-.LFB4150
	.uleb128 0
	.uleb128 .LEHB4-.LFB4150
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L117-.LFB4150
	.uleb128 0
	.uleb128 .LEHB5-.LFB4150
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L117-.LFB4150
	.uleb128 0
.LLSDACSE4150:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC4150
	.type	_Z13verify_resultPfS_S_iii.cold, @function
_Z13verify_resultPfS_S_iii.cold:
.LFSB4150:
.L110:
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
# /usr/include/c++/12/bits/random.h:1628:     { _M_fini(); }
	movq	-10120(%rbp), %rdi	# %sfp,
	vzeroupper
	call	_ZNSt13random_device7_M_finiEv@PLT	#
	movq	%rbx, %rdi	# tmp418,
.LEHB6:
	call	_Unwind_Resume@PLT	#
.L88:
# /usr/include/c++/12/bits/basic_string.h:803:       { _M_dispose(); }
	movq	%rbx, %rdi	# tmp421,
	vzeroupper
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT	#
	movq	%r12, %rdi	# tmp312,
	call	_Unwind_Resume@PLT	#
.LEHE6:
	.cfi_endproc
.LFE4150:
	.section	.gcc_except_table
.LLSDAC4150:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC4150-.LLSDACSBC4150
.LLSDACSBC4150:
	.uleb128 .LEHB6-.LCOLDB22
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
.LLSDACSEC4150:
	.section	.text.unlikely
	.text
	.size	_Z13verify_resultPfS_S_iii, .-_Z13verify_resultPfS_S_iii
	.section	.text.unlikely
	.size	_Z13verify_resultPfS_S_iii.cold, .-_Z13verify_resultPfS_S_iii.cold
.LCOLDE22:
	.text
.LHOTE22:
	.section	.rodata.str1.1
.LC23:
	.string	"Matrix multiplication took "
.LC24:
	.string	" ms"
.LC25:
	.string	"Result verification passed!"
.LC26:
	.string	"Result verification failed!"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB4151:
	.cfi_startproc
	endbr64	
	pushq	%r14	#
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
# gemm_test.cpp:64:     float* A = new float[M * K];
	movl	$262144, %edi	#,
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	leaq	_ZSt4cout(%rip), %r14	#, tmp103
# gemm_test.cpp:57: int main() {
	pushq	%r13	#
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	#
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	#
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	#
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
# gemm_test.cpp:64:     float* A = new float[M * K];
	call	_Znam@PLT	#
# gemm_test.cpp:65:     float* B = new float[K * N];
	movl	$262144, %edi	#,
# gemm_test.cpp:64:     float* A = new float[M * K];
	movq	%rax, %r12	# tmp113, _4
# gemm_test.cpp:65:     float* B = new float[K * N];
	call	_Znam@PLT	#
# gemm_test.cpp:66:     float* C = new float[M * N];
	movl	$262144, %edi	#,
# gemm_test.cpp:65:     float* B = new float[K * N];
	movq	%rax, %rbp	# tmp114, _6
# gemm_test.cpp:66:     float* C = new float[M * N];
	call	_Znam@PLT	#
# gemm_test.cpp:69:     init_matrix(A, M, K);
	movl	$256, %edx	#,
	movl	$256, %esi	#,
	movq	%r12, %rdi	# _4,
# gemm_test.cpp:66:     float* C = new float[M * N];
	movq	%rax, %r13	# tmp115, _8
# gemm_test.cpp:69:     init_matrix(A, M, K);
	call	_Z11init_matrixPfii	#
# gemm_test.cpp:70:     init_matrix(B, K, N);
	movl	$256, %edx	#,
	movl	$256, %esi	#,
	movq	%rbp, %rdi	# _6,
	call	_Z11init_matrixPfii	#
# gemm_test.cpp:73:     auto start = std::chrono::high_resolution_clock::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# gemm_test.cpp:74:     gemm_basic(A, B, C, M, N, K);
	movl	$256, %ecx	#,
	movq	%r13, %rdx	# _8,
	movq	%rbp, %rsi	# _6,
	movl	$256, %r9d	#,
	movl	$256, %r8d	#,
	movq	%r12, %rdi	# _4,
# gemm_test.cpp:73:     auto start = std::chrono::high_resolution_clock::now();
	movq	%rax, %rbx	# tmp116, start
# gemm_test.cpp:74:     gemm_basic(A, B, C, M, N, K);
	call	_Z10gemm_basicPfS_S_iii	#
# gemm_test.cpp:75:     auto end = std::chrono::high_resolution_clock::now();
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT	#
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	leaq	.LC23(%rip), %rsi	#, tmp102
	movq	%r14, %rdi	# tmp103,
# /usr/include/c++/12/bits/chrono.h:212: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	movabsq	$4835703278458516699, %rdx	#, tmp99
# /usr/include/c++/12/bits/chrono.h:707: 	return __cd(__cd(__lhs).count() - __cd(__rhs).count());
	subq	%rbx, %rax	# start, tmp117
	movq	%rax, %rcx	# tmp117, tmp97
# /usr/include/c++/12/bits/chrono.h:212: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	imulq	%rdx	# tmp99
	sarq	$63, %rcx	#, tmp101
	sarq	$18, %rdx	#, tmp100
	movq	%rdx, %rbx	# tmp100, tmp100
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movl	$27, %edx	#,
# /usr/include/c++/12/bits/chrono.h:212: 	      static_cast<_CR>(__d.count()) / static_cast<_CR>(_CF::den)));
	subq	%rcx, %rbx	# tmp101, tmp100
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/12/ostream:167:       { return _M_insert(__n); }
	movq	%rbx, %rsi	# _21,
	movq	%r14, %rdi	# tmp103,
	call	_ZNSo9_M_insertIlEERSoT_@PLT	#
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movl	$3, %edx	#,
	leaq	.LC24(%rip), %rsi	#, tmp105
# /usr/include/c++/12/ostream:167:       { return _M_insert(__n); }
	movq	%rax, %rbx	# tmp118, _25
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movq	%rax, %rdi	# _25,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/12/ostream:113: 	return __pf(*this);
	movq	%rbx, %rdi	# _25,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# gemm_test.cpp:82:     if (verify_result(A, B, C, M, N, K)) {
	movq	%r13, %rdx	# _8,
	movl	$256, %ecx	#,
	movq	%rbp, %rsi	# _6,
	movl	$256, %r9d	#,
	movl	$256, %r8d	#,
	movq	%r12, %rdi	# _4,
	call	_Z13verify_resultPfS_S_iii	#
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movl	$27, %edx	#,
# gemm_test.cpp:82:     if (verify_result(A, B, C, M, N, K)) {
	testb	%al, %al	# tmp119
	je	.L138	#,
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movq	%r14, %rdi	# tmp103,
	leaq	.LC25(%rip), %rsi	#, tmp106
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/12/ostream:113: 	return __pf(*this);
	movq	%r14, %rdi	# tmp103,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
.L139:
# gemm_test.cpp:89:     delete[] A;
	movq	%r12, %rdi	# _4,
	call	_ZdaPv@PLT	#
# gemm_test.cpp:90:     delete[] B;
	movq	%rbp, %rdi	# _6,
	call	_ZdaPv@PLT	#
# gemm_test.cpp:91:     delete[] C;
	movq	%r13, %rdi	# _8,
	call	_ZdaPv@PLT	#
# gemm_test.cpp:94: }
	popq	%rbx	#
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax	#
	popq	%rbp	#
	.cfi_def_cfa_offset 32
	popq	%r12	#
	.cfi_def_cfa_offset 24
	popq	%r13	#
	.cfi_def_cfa_offset 16
	popq	%r14	#
	.cfi_def_cfa_offset 8
	ret	
.L138:
	.cfi_restore_state
# /usr/include/c++/12/ostream:620: 	__ostream_insert(__out, __s,
	movq	%r14, %rdi	# tmp103,
	leaq	.LC26(%rip), %rsi	#, tmp109
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /usr/include/c++/12/ostream:113: 	return __pf(*this);
	movq	%r14, %rdi	# tmp103,
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0	#
# /usr/include/c++/12/ostream:113: 	return __pf(*this);
	jmp	.L139	#
	.cfi_endproc
.LFE4151:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii, @function
_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii:
.LFB4963:
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
# gemm_test.cpp:94: }
	popq	%rbx	#
	.cfi_def_cfa_offset 8
# /usr/include/c++/12/iostream:74:   static ios_base::Init __ioinit;
	leaq	__dso_handle(%rip), %rdx	#, tmp83
	jmp	__cxa_atexit@PLT	#
	.cfi_endproc
.LFE4963:
	.size	_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii, .-_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z10gemm_basicPfS_S_iii
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.quad	-2147483648
	.set	.LC10,.LC16
	.align 8
.LC11:
	.quad	1
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC12:
	.long	796917760
	.align 4
.LC13:
	.long	1065353216
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC16:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC17:
	.long	-350469331
	.long	1058682594
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
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
