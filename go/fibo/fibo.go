package main

import (
	"fmt"
)

func fibo(i, j, num uint64) uint64 {
	if num != 0 {
		return fibo(j, i+j, num-1)
	} else {
		return i
	}
}

func main() {
	var num uint64
	fmt.Scan(&num)
	fmt.Println(fibo(0, 1, num))
}
