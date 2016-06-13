package main

import (
	"fmt"
)

func euclidean(a, b int) int {
	if a < b {
		return euclidean(b, a)
	} else if b == 0 {
		return a
	} else {
		return euclidean(b, a%b)
	}
}

func main() {
	var a, b int
	fmt.Scan(&a, &b)
	fmt.Println(euclidean(a, b))
}
