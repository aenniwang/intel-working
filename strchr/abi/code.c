#include <stdio.h>

long int simple_l(long int *xp, long int y);
void main()
{
    long int r;
    long int arg1 = 100;
    r = simple_l(&arg1,100);
    printf("r=%d\n",r);
}

long int simple_l(long int *xp, long int y)
{
    long int t = *xp + y;
    printf("in simple_l\n");
    *xp = t;
    return t;
}

