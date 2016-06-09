#include <stdio.h>
unsigned long long int fibo(unsigned int num){
	unsigned long long int answer = 0;
	switch(num){
		case 1:
		case 2:
			return 1;
		default:
			answer = fibo(num-2) + fibo(num-1);
			return answer;
	}
}

int main (void){
	unsigned int num;
	scanf("%u",&num);
	if(!num){
		puts("Error!");
	} else {
		printf("%llu\n",fibo(num));
	}
	return 0;
}

