#include <stdio.h>
#include <limits.h>
void merge(int *p, int left, int mid, int right){
	int i = 0, j = 0 , l = mid - left, r = right - mid;
	int L[l+1];
	int R[r+1];
	for(int count = 0; count < l; count++) L[count] = p[left+count];
	for(int count = 0; count < r; count++) R[count] = p[mid+count];
	L[l] = INT_MAX;
	R[r] = INT_MAX;
	for(int k = left; k < right; k++){
		if(L[i] > R[j]){
			p[k] = R[j];
			j++;
		} else {
			p[k] = L[i];
			i++;
		}
	}
}

void mergeSort(int *p, int left, int right){
	int mid;
	if(left+1 < right){
		mid = (left+right)/2;
		mergeSort(p,left,mid);
		mergeSort(p,mid,right);
		merge(p,left,mid,right);
	}
}

int main(void){
	int N = 0;
	scanf("%d",&N);
	int list[N];
	for(int count = 0; count < N; count++) scanf("%d",&list[count]);
	mergeSort(list, 0, N);
	for(int count = 0; count < N; count++){
		(count != N-1) ? printf("%d ",list[count]) : printf("%d\n",list[count]);
	}
	return 0;
}
