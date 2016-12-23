
#include <stdio.h>
#include <string.h>

    char *msg = "Test Static Linking glibc strchr\n";
void main(){
    void *out;
    printf(msg);
    printf("MSG pointer size is %d\n",sizeof(msg));
    printf("MSG address is %p\n",msg);
    printf("Finding 'S'\n");
    out = strchr(msg,'S');
    if(out)
        printf(out);
    else
        printf("Error\n");
}
    

