#include <stdio.h>
int exchange_count = 0;
void bubbleSort(int *p, int N){
	int flag = 1;
	while(flag){
		flag = 0;
		for(int factor = N - 1; factor >= 1; factor--){
			if(p[factor-1] > p[factor]){
				int tmp = p[factor - 1];
				p[factor - 1] = p[factor];
				p[factor] = tmp;
				exchange_count++;
				flag = 1;
			}
		}
	}
}

int main(void){
	int N = 0;
	scanf("%d",&N);
	int list[N];
	for(int count = 0; count < N; count++){
		scanf("%d",&list[count]);
	}
	bubbleSort(list, N);
	printf("%d\n",exchange_count);
	for(int count = 0; count < N; count++){
		(count != N-1) ? printf("%d ",list[count]) : printf("%d\n",list[count]);
	}
	return 0;
}
