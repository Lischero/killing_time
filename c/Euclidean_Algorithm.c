#include <stdio.h>
int euclidean(int a, int b){
	int mod;
	mod = a%b;
	if(!mod){
		return b;
	} else {
		return euclidean(b,mod);
	}
}

int main (void){
	int a, b;
	scanf("%d %d",&a,&b);
	if(a > b){
		printf("%d\n",euclidean(a,b));
	} else {
		printf("%d\n",euclidean(b,a));
	}
	return 0;
}
