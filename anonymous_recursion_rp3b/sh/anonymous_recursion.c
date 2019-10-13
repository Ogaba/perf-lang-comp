#include <stdio.h>
 
long fib(long x)
{
        long fib_i(long n) { return n < 2 ? n : fib_i(n - 2) + fib_i(n - 1); };
        if (x < 0) {
                printf("Bad argument: fib(%ld)\n", x);
                return -1;
        }
        return fib_i(x);
}
 
long fib_i(long n) /* just to show the fib_i() inside fib() has no bearing outside it */
{
        printf("This is not the fib you are looking for\n");
        return -1;
}
 
int main()
{
        long x;
        for (x = 0; x <=35; x ++)
                printf("%ld\n", fib(x));
 
        return 0;
}
