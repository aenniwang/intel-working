#include <stdio.h>
#include <math.h>
#include <string.h>
#include <gnu/libc-version.h>
//__asm__(".symver memcpy,memcpy@GLIBC_2.17");
int main(int argc, char * argv[]){
    char buf[40960];
    char buf_b[40960];
    printf("USAGE: mul a b\n");
    double a=100;
    double b=2000;
    int c=0;
    int i;

    puts (gnu_get_libc_version ()); 
    memset((void*)buf,1,(size_t)4096);
    __asm__("nop \n nop ");
    memcpy(buf_b,buf,(size_t)4096);
    __asm__("nop \n nop \n nop ");
    for (i=0;i<4096;i++)
        c+=buf[0];

    printf("Sum of memset is %d\n",c);

    for (i=0;i<4096;i++)
        c+=buf_b[0];


    printf("Sum of memset is %d\n",c);
    c = (int)(exp(a)+exp(b));
    printf("Result = %d\n",c);
    return c;
}
