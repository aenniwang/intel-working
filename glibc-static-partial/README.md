For different version glibc, even the symbol link is same, for example 'memcpy@@GLIBC_2.14', they will running with diferernt code. 
but their share the same kind of fucntion declaration 
glibc2.17 memcpy x86_64 code:
<pre>
ENTRY(__new_memcpy)
    .type   __new_memcpy, @gnu_indirect_function
    cmpl    $0, KIND_OFFSET+__cpu_features(%rip)
    jne 1f
    call    __init_cpu_features
1:  leaq    __memcpy_sse2(%rip), %rax
    testl   $bit_SSSE3, __cpu_features+CPUID_OFFSET+index_SSSE3(%rip)
    jz  2f
    leaq    __memcpy_ssse3(%rip), %rax
    testl   $bit_Fast_Copy_Backward, __cpu_features+FEATURE_OFFSET+index_Fast_Copy_Backward(%rip)
    jz  2f
    leaq    __memcpy_ssse3_back(%rip), %rax
2:  ret
END(__new_memcpy)
</pre>

glibc2.22 memcpy x86_64 code:
<pre>
ENTRY(__new_memcpy)
    .type   __new_memcpy, @gnu_indirect_function
    cmpl    $0, KIND_OFFSET+__cpu_features(%rip)
    jne 1f
    call    __init_cpu_features
1:  leaq    __memcpy_avx_unaligned(%rip), %rax
    testl   $bit_AVX_Fast_Unaligned_Load, __cpu_features+FEATURE_OFFSET+index_AVX_Fast_Unaligned_Load(%rip)
    jz 1f
    ret
1:  leaq    __memcpy_sse2(%rip), %rax
    testl   $bit_Slow_BSF, __cpu_features+FEATURE_OFFSET+index_Slow_BSF(%rip)
    jnz 2f
    leaq    __memcpy_sse2_unaligned(%rip), %rax
    ret
2:  testl   $bit_SSSE3, __cpu_features+CPUID_OFFSET+index_SSSE3(%rip)
    jz 3f
    leaq    __memcpy_ssse3(%rip), %rax
3:  ret
END(__new_memcpy)
</pre>

