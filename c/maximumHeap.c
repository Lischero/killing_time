#include <stdio.h>
int parent(int factor){
	return (factor-1) / 2;
}

int left(int factor){
	return (2 * factor + 1);
}

int right(int factor){
	return (2 * factor + 2);
}

void maxheapify(int *heap, int factor, int heapsize){
	int l = left(factor), r = right(factor), largest;
	if(l < heapsize && heap[factor] < heap[l]){
		largest = l;
	} else {
		largest = factor;
	}

	if(r < heapsize && heap[largest] < heap[r]){
		largest = r;
	} 
	
	if(largest != factor){
		int tmp = heap[factor];
		heap[factor] = heap[largest];
		heap[largest] = tmp;
		maxheapify(heap,largest,heapsize);
	}
}
void buildMaxHeap(int *heap, int heapsize){
	for(int parentnode = parent(heapsize); parentnode >= 0; parentnode--){
		maxheapify(heap,parentnode,heapsize);
	}
}

int main(void){
	int heapsize;
	scanf("%d",&heapsize);
	int heap[heapsize];
	for(int count = 0; count < heapsize; count++){
		scanf("%d",&heap[count]);
	}
	buildMaxHeap(heap,heapsize);
	for(int count = 0; count < heapsize; count++){
		(count != heapsize - 1) ? printf("%d ",heap[count]) : printf("%d\n",heap[count]);
	}
	return 0;
}
