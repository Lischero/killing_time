#include <stdio.h>
int exchange_count = 0;
void insertSort(int *p, int N){
	for(int unsorted = 1; unsorted < N; unsorted++){
		int pivot = p[unsorted];
		int sorted = unsorted - 1;
		while(sorted >= 0 && p[sorted] > pivot){
			p[sorted+1] = p[sorted];
			sorted--;
			exchange_count++;
		}
		p[sorted+1] = pivot;
	}
}

int main(void){
	int N = 0;
	scanf("%d",&N);
	int list[N];
	for(int count = 0; count < N; count++){
		scanf("%d",&list[count]);
	}
	insertSort(list,N);
	printf("%d\n",exchange_count);
	for(int count = 0; count < N; count++){
		if(count != N - 1){
			printf("%d ",list[count]);
		} else {
			printf("%d\n",list[count]);
		}
	}
	return 0;
}
