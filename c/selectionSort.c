#include <stdio.h>
int main(void){
	int min, N = 0;
	scanf("%d",&N);
	int list[N];
	for(int count = 0; count < N; count++){
		scanf("%d",&list[count]);
	}
	for(int i = 0; i < N-1; i++){
		min = i;
		for(int j = i; j < N; j++){
			if(list[min] > list[j]){
				min = j;
			}
		}
		int tmp = list[i];
		list[i] = list[min];
		list[min] = tmp;
	}
	for(int count = 0; count < N; count++){
		(count != N - 1) ? printf("%d ",list[count]) : printf("%d\n",list[count]);
	}
	return 0;
}
