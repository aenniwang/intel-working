#include <stdio.h>
#include <immintrin.h>
#include <string.h>

inline char *strzhchr(register const char *str, int chr) {
    static int i;
    if (str == NULL) {
        return NULL;
    }
    register unsigned int tag = 0U;
	
    while (*str) {
        printf("Str=%d ",*str);
        printf("*str&0x80U)=%d ",(*str & 0x80U));
        printf("(tag ^ 0x80U)=%d ",(tag ^ 0x80U));
        printf("((tag & 0x80U) >> 1U)=%d ",((tag & 0x80U) >> 1U));
        tag = ((*str & 0x80U) & (tag ^ 0x80U)) + ((tag & 0x80U) >> 1U);
        printf("==> [Tag%d]:%d\n",i++,tag);
        if (!tag && *str == chr) {
            return (char*)str;
        }
        str++;
    }
    return NULL;
}

char * avx2_strzhchr(const char *str, int chr){
#define AVX2_BYTES  0x20
#define AVX2_REMAIN_MASK (AVX2_BYTES -1)
    size_t len = strlen(str);
    int avx2_loops= len / AVX2_BYTES;
    int avx2_remain = len & AVX2_REMAIN_MASK;
    int i;

    register unsigned int tag = 0U;
    /*TODO: 
     * Try to optimize with AVX2 
     * Maybe the remaining bytes could be optimized with long type mathematics
     */
    for (i=0;i<avx2_remain;i++){
        tag = ((*str & 0x80U) & (tag ^ 0x80U)) + ((tag & 0x80U) >> 1U);
        if (!tag && *str == chr) {
            return (char*)str;
        }
        str++;
    }

    for(i=0;i<avx2_loops;i++){

        int offset;

        asm volatile (
                "mov eax,0x80808080 \n\t " \
                "vmovd xmm0,eax \n\t" \
                "vpbroadcastd ymm0,xmm0 \n\t" \
                "vmovdqu ymm1, [%1] \n\t" \
                "vpcmpeqb ymm0,ymm0,ymm1 \n\t" \
                "vperm2i128 ymm2,ymm0,ymm0,0x08 \n\t" \
                "vpalignr ymm2,ymm0,ymm2,15 \n\t" \
                "vpor ymm0,ymm2,ymm0 \n\t" \
                "vpandn ymm0,ymm0,ymm1 \n\t"\
                "vpbroadcastb ymm1, [%2] \n\t" \
                "vpcmpeqb ymm0,ymm1,ymm0 \n\t" \
                "vpmovmskb eax, ymm0\n\t"  \
                "xor ebx,ebx\n\t"\
                "bsf %0,eax \n\t" \
                "cmovz %0,ebx \n\t" \
                : "=r"(offset) \
                : "r"(str+i*AVX2_BYTES), "r"(&chr)  \
                :"%xmm0","%xmm1","%xmm2","%eax","%ebx");

        if(offset)
        {
            printf("offset=%d\n",offset);
            return (char*)(str+offset+i*AVX2_BYTES);
        }
    }
    return NULL;
}

void main()
{
    char str[]={
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,0x80, 22, 23, 0x80,24, 0x80,25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39,40,0x80, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126,0};

    int chr=40;

    char *r;
    r=strzhchr(str,chr);
    printf("r[value=0x%x]=%s\n",r,r);
    r=avx2_strzhchr(str,chr);
    printf("r[value=0x%x]=%s\n",r,r);

}
