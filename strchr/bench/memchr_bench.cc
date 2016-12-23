// memchr / strchr benchmark
//  clang -O2 -o chr_bench chr_bench.cc
//
// Includes a glibc memchr implementation for comparison, which makes this
// benchmark GPL-licensed I believe.

// Output on my system (OS X 10.7.3):
//     stupid_memchr: 380.0us
//     glibc_memchr: 105.0us
//     memchr: 566.0us
//
//     stupid_strchr: 381.0us
//     glibc_strchr: 143.0us
//     strchr: 381.0us
//
//  glibc's memchr is over 5x the speed of libSystem's! strchr is 2x as fast.
//  libSystem's memchr() is significantly slower than a simple loop.

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

#include <immintrin.h>

char *sse_strzhchr(const char *s, int c);
char *strzhchr(register const char *str, int chr) {
    static int i;
    if (str == NULL) {
        return NULL;
    }
    register unsigned int tag = 0U;
	
    while (*str) {
        tag = ((*str & 0x80U) & (tag ^ 0x80U)) + ((tag & 0x80U) >> 1U);
        if (!tag && *str == chr) {
            return (char*)str;
        }
        str++;
    }
    return NULL;
}
#if 0
char *strzhchr_8(register const char *str, int chr) {
    static int i;
    if (str == NULL) {
        return NULL;
    }
    long long *strLL;
    long long singzh;
    long long singzh_shift;
    const long long sign80=0x80808080808080808080808080808080LL;
    register unsigned int tag = 0U;

    strLL = (long long *)str;
    
    singzh = strLL & sign80;
    singzh_shift = singzh<<8;
    singzh = singzh | singzh_shift;
    
	
    while (*str) {
        tag = ((*str & 0x80U) & (tag ^ 0x80U)) + ((tag & 0x80U) >> 1U);
        if (!tag && *str == chr) {
            return (char*)str;
        }
        str++;
    }
    return NULL;
}
#endif

#if 0
char * avx2_strzhchr_small(const char *str, int chr){
    int found;
    int offset;
    char *_str = (char*)str;
    int len = 32;
//    static char ymm_buf[32] __attribute__((aligned(32)));

   // memset(ymm_buf,0,32);
//    memcpy(ymm_buf,str,len);
    //_str = ymm_buf;

    asm volatile (
            "mov eax,0x80808080 \n\t " \
            "vmovd xmm0,eax \n\t" \
            "vpbroadcastd ymm0,xmm0 \n\t" \
            "vmovdqu ymm1, [%2] \n\t" \
            "vpcmpeqb ymm0,ymm0,ymm1 \n\t" \
            "vperm2i128 ymm2,ymm0,ymm0,0x08 \n\t" \
            "vpalignr ymm2,ymm0,ymm2,15 \n\t" \
            "vpor ymm0,ymm2,ymm0 \n\t" \
            "vpandn ymm0,ymm0,ymm1 \n\t"\
            "vpbroadcastb ymm1, [%3] \n\t" \
            "vpcmpeqb ymm0,ymm1,ymm0 \n\t" \
            "vpmovmskb eax, ymm0\n\t"  \
            "xor ebx,ebx\n\t"\
            "mov %1,1 \n\t" \
            "bsf %0,eax \n\t" \
            "cmovz %1,ebx \n\t" \
            : "=r"(offset),"=r"(found) \
            : "r"(_str), "r"(&chr)  \
            :"%xmm0","%xmm1","%xmm2","%eax","%ebx");
    if(found)
        if(offset<len)
            return (char*)(str+offset);
        
    return NULL;
}
char * avx2_strzhchr_2(const char *str, int chr){
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

    static char ymm_buf[AVX2_BYTES] __attribute__((aligned(AVX2_BYTES)));

    int found = 0;
    int offset=0;

    for(i=0;i<avx2_loops;i++){

#if 1
            asm volatile (
                "vmovdqu ymm0, [%2] \n\t" \
                "vpbroadcastb ymm1, [%3] \n\t" \
                "vpcmpeqb ymm0,ymm1,ymm0 \n\t" \
                "mov eax,0x80808081 \n\t " \
                "vmovd xmm0,eax \n\t" \
                "vpbroadcastd ymm0,xmm0 \n\t" \
                "vpcmpeqb ymm0,ymm0,ymm1 \n\t" \
                "vperm2i128 ymm2,ymm0,ymm0,0x08 \n\t" \
                "vpalignr ymm2,ymm0,ymm2,15 \n\t" \
                "vpor ymm0,ymm2,ymm0 \n\t" \
                "vpandn ymm0,ymm0,ymm1 \n\t"\
                "vpmovmskb eax, ymm0\n\t"  \
                "xor ebx,ebx\n\t"\
                "mov %1,1 \n\t" \
                "bsf %0,eax \n\t" \
                "cmovz %1,ebx \n\t" \
                : "=r"(offset),"=r"(found) \
                : "r"(str), "r"(&chr)  \
                :"%xmm0","%xmm1","%xmm2","%eax","%ebx");
#else
            asm volatile (
                "mov eax,0x80808080 \n\t " \
                "vmovd xmm0,eax \n\t" \
                "vpbroadcastd ymm0,xmm0 \n\t" \
                "vmovdqu ymm1, [%2] \n\t" \
                "vpcmpeqb ymm0,ymm0,ymm1 \n\t" \
                "vperm2i128 ymm2,ymm0,ymm0,0x08 \n\t" \
                "vpalignr ymm2,ymm0,ymm2,15 \n\t" \
                "vpor ymm0,ymm2,ymm0 \n\t" \
                "vpandn ymm0,ymm0,ymm1 \n\t"\
                "vpbroadcastb ymm1, [%3] \n\t" \
                "vpcmpeqb ymm0,ymm1,ymm0 \n\t" \
                "vpmovmskb eax, ymm0\n\t"  \
                "xor ebx,ebx\n\t"\
                "mov %1,1 \n\t" \
                "bsf %0,eax \n\t" \
                "cmovz %1,ebx \n\t" \
                : "=r"(offset),"=r"(found) \
                : "r"(str), "r"(&chr)  \
                :"%xmm0","%xmm1","%xmm2","%eax","%ebx");
#endif

        if(found)
        {
            return (char*)(str+offset);
        }
        str+=AVX2_BYTES;
    }
#if 0
    char *_str = (char*)str;

    if (len < AVX2_BYTES)
    {
        memset(ymm_buf,0,32);
        memcpy(ymm_buf,str,len);
        _str = ymm_buf;
    }

    asm volatile (
            "mov eax,0x80808080 \n\t " \
            "vmovd xmm0,eax \n\t" \
            "vpbroadcastd ymm0,xmm0 \n\t" \
            "vmovdqu ymm1, [%2] \n\t" \
            "vpcmpeqb ymm0,ymm0,ymm1 \n\t" \
            "vperm2i128 ymm2,ymm0,ymm0,0x08 \n\t" \
            "vpalignr ymm2,ymm0,ymm2,15 \n\t" \
            "vpor ymm0,ymm2,ymm0 \n\t" \
            "vpandn ymm0,ymm0,ymm1 \n\t"\
            "vpbroadcastb ymm1, [%3] \n\t" \
            "vpcmpeqb ymm0,ymm1,ymm0 \n\t" \
            "vpmovmskb eax, ymm0\n\t"  \
            "xor ebx,ebx\n\t"\
            "mov %1,1 \n\t" \
            "bsf %0,eax \n\t" \
            "cmovz %1,ebx \n\t" \
            : "=r"(offset),"=r"(found) \
            : "r"(_str), "r"(&chr)  \
            :"%xmm0","%xmm1","%xmm2","%eax","%ebx");
    if(found)
        return (char*)(str+offset);
        
#else
    for (i=0;i<avx2_remain;i++){
        tag = ((*str & 0x80U) & (tag ^ 0x80U)) + ((tag & 0x80U) >> 1U);
        if (!tag && *str == chr) {
            return (char*)str;
        }
        str++;
    }
#endif
    return NULL;
}

char * avx2_strzhchr(const char *str, int chr){
#define AVX2_BYTES  0x20
#define AVX2_REMAIN_MASK (AVX2_BYTES -1)
    size_t len = strlen(str);
    int avx2_loops= len / AVX2_BYTES;
    int avx2_remain = len & AVX2_REMAIN_MASK;
    int i;

    //printf("chr = %d, String len=%d, avx2_loops=%d,avx_remain=%d\n",chr,len,avx2_loops,avx2_remain);
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

        int found = 0;
        int offset=0;

        asm volatile (
                "mov eax,0x80808080 \n\t " \
                "vmovd xmm0,eax \n\t" \
                "vpbroadcastd ymm0,xmm0 \n\t" \
                "vmovdqu ymm1, [%2] \n\t" \
                "vpcmpeqb ymm0,ymm0,ymm1 \n\t" \
                "vperm2i128 ymm2,ymm0,ymm0,0x08 \n\t" \
                "vpalignr ymm2,ymm0,ymm2,15 \n\t" \
                "vpor ymm0,ymm2,ymm0 \n\t" \
                "vpandn ymm0,ymm0,ymm1 \n\t"\
                "vpbroadcastb ymm1, [%3] \n\t" \
                "vpcmpeqb ymm0,ymm1,ymm0 \n\t" \
                "vpmovmskb eax, ymm0\n\t"  \
                "xor ebx,ebx\n\t"\
                "mov %1,1 \n\t" \
                "bsf %0,eax \n\t" \
                "cmovz %1,ebx \n\t" \
                : "=r"(offset),"=r"(found) \
                : "r"(str+i*AVX2_BYTES), "r"(&chr)  \
                :"%xmm0","%xmm1","%xmm2","%eax","%ebx");

        if(found)
        {
            return (char*)(str+offset+i*AVX2_BYTES);
        }
    }


    return NULL;
}

#endif
//////////////////////////////////////////////////////////////////////////////
// glibc functions

// From http://ctan.mackichan.com/macros/texinfo/texinfo/gnulib/lib/memchr.c .
// Current version at http://repo.or.cz/w/glibc.git/blob/HEAD:/string/memchr.c ,
// x86 asm at http://repo.or.cz/w/glibc.git/blob/HEAD:/sysdeps/x86_64/memchr.S
void *
glibc_memchr (void const *s, int c_in, size_t n)
{
  typedef unsigned long int longword;
  const unsigned char *char_ptr;
  const longword *longword_ptr;
  longword repeated_one;
  longword repeated_c;
  unsigned register char c;
  c = (unsigned char) c_in;
  for (char_ptr = (const unsigned char *) s;
       n > 0 && (size_t) char_ptr % sizeof (longword) != 0;
       --n, ++char_ptr)
    if (*char_ptr == c)
      return (void *) char_ptr;
  longword_ptr = (const longword *) char_ptr;
  repeated_one = 0x01010101;
  repeated_c = c | (c << 8);
  repeated_c |= repeated_c << 16;
  if (0xffffffffU < (longword) -1)
    {
      repeated_one |= repeated_one << 31 << 1;
      repeated_c |= repeated_c << 31 << 1;
      if (8 < sizeof (longword))
	{
	  size_t i;
	  for (i = 64; i < sizeof (longword) * 8; i *= 2)
	    {
	      repeated_one |= repeated_one << i;
	      repeated_c |= repeated_c << i;
	    }
	}
    }
  while (n >= sizeof (longword))
    {
      longword longword1 = *longword_ptr ^ repeated_c;
      if ((((longword1 - repeated_one) & ~longword1)
	   & (repeated_one << 7)) != 0)
	break;
      longword_ptr++;
      n -= sizeof (longword);
    }
  char_ptr = (const unsigned char *) longword_ptr;
  for (; n > 0; --n, ++char_ptr)
    {
      if (*char_ptr == c)
	return (void *) char_ptr;
    }
  return NULL;
}

// http://repo.or.cz/w/glibc.git/blob/HEAD:/string/strchr.c
char *
glibc_strchr (const char* s, int c_in)
{
  const unsigned char *char_ptr;
  const unsigned long int *longword_ptr;
  unsigned long int longword, magic_bits, charmask;
  unsigned register char c;
  c = (unsigned char) c_in;
  for (char_ptr = (const unsigned char *) s;
       ((unsigned long int) char_ptr & (sizeof (longword) - 1)) != 0;
       ++char_ptr)
    if (*char_ptr == c)
      return (char *) char_ptr;
    else if (*char_ptr == '\0')
      return NULL;
  longword_ptr = (unsigned long int *) char_ptr;
  switch (sizeof (longword))
    {
    case 4: magic_bits = 0x7efefeffL; break;
    case 8: magic_bits = ((0x7efefefeL << 16) << 16) | 0xfefefeffL; break;
    default:
      abort ();
    }
  charmask = c | (c << 8);
  charmask |= charmask << 16;
  if (sizeof (longword) > 4)
    charmask |= (charmask << 16) << 16;
  if (sizeof (longword) > 8)
    abort ();
  for (;;)
    {
      longword = *longword_ptr++;
      if ((((longword + magic_bits)
	    ^ ~longword)
	   & ~magic_bits) != 0 ||
	  ((((longword ^ charmask) + magic_bits) ^ ~(longword ^ charmask))
	   & ~magic_bits) != 0)
	{
	  const unsigned char *cp = (const unsigned char *) (longword_ptr - 1);
	  if (*cp == c)
	    return (char *) cp;
	  else if (*cp == '\0')
	    return NULL;
	  if (*++cp == c)
	    return (char *) cp;
	  else if (*cp == '\0')
	    return NULL;
	  if (*++cp == c)
	    return (char *) cp;
	  else if (*cp == '\0')
	    return NULL;
	  if (*++cp == c)
	    return (char *) cp;
	  else if (*cp == '\0')
	    return NULL;
	  if (sizeof (longword) > 4)
	    {
	      if (*++cp == c)
		return (char *) cp;
	      else if (*cp == '\0')
		return NULL;
	      if (*++cp == c)
		return (char *) cp;
	      else if (*cp == '\0')
		return NULL;
	      if (*++cp == c)
		return (char *) cp;
	      else if (*cp == '\0')
		return NULL;
	      if (*++cp == c)
		return (char *) cp;
	      else if (*cp == '\0')
		return NULL;
	    }
	}
    }
  return NULL;
}

// Done with glibc
//////////////////////////////////////////////////////////////////////////////




void* stupid_memchr(const void* s_in, int c, size_t n) {
  const unsigned char* s = (const unsigned char*)s_in;
  for (int i = 0; i < n; ++i)
    if (s[i] == c)
      return (void*)(s + i);
  return NULL;
}

char* stupid_strchr(char* s_in, int c) {
  while (*s_in && *s_in != c)
    s_in++;
  return *s_in == c ? s_in : NULL;
}



void fill_string(char* buf, int n, int xpos) {
  memset(buf, '.', n);
  buf[xpos] = 'x';
  buf[n] = '\0';  // for strstr
}

int64_t now_millis() {
  timeval now;
  gettimeofday(&now, NULL);
  return ((int64_t)now.tv_sec * 1000) + (now.tv_usec / 1000);
}

int main() {
  const int STRLEN = 32;

  char strs[STRLEN][STRLEN + 1];
  for (int i = 0; i < STRLEN; ++i)
    fill_string(strs[i], STRLEN, i);

  const int ITERS = 20000;
  int64_t start, stop;
  int delta;
  float time;

  #define BENCH(fun, ...) \
  start = now_millis(); \
  for (int j = 0; j < ITERS; ++j) { \
    for (int i = 31; i < STRLEN; ++i) { \
      void* r = fun(strs[i], __VA_ARGS__); \
      if (r != strs[i] + i) { \
        printf("Bug! i=%d,r=0x%x, str[i]=0x%x\n",i,r,strs[i]); \
        exit(1); \
      } \
    } \
  } \
  stop = now_millis(); \
  delta = (int)(stop - start); \
  time = delta*1000 / (float)ITERS; \
  printf("%s: %.1fus\n", #fun, time) \

#if 0
  BENCH(stupid_memchr, 'x', STRLEN);
  BENCH(glibc_memchr, 'x', STRLEN);
  BENCH(memchr, 'x', STRLEN);

  printf("\n");
#endif

//  BENCH(stupid_strchr, 'x');
//  BENCH(glibc_strchr, 'x');
//  BENCH(strchr, 'x');
  BENCH(strzhchr,'x');
//  BENCH(avx2_strzhchr,'x');
 // BENCH(avx2_strzhchr_small,'x');
 // BENCH(avx2_strzhchr_2,'x');
  BENCH(sse_strzhchr,'x');
}
