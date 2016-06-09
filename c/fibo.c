#include <stdio.h>
unsigned long long int fibo(unsigned long long int i, unsigned long long int j, unsigned int num){
	return num?fibo(j,i+j,num-1):i;
}

int main (void){
	unsigned int num;
	scanf("%u",&num);
	printf("%llu\n",fibo(0,1,num));
	return 0;
}

