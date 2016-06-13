import Swift

let n = Int(readLine()!)!

func fibo(x: Int) -> Int {
    if x == 0 {
        return x
    }
    
    var pre = (0, 1)
    for _ in 1..<x {
        pre = (pre.1, pre.0 + pre.1)
    }
    
    return pre.1
}

print(fibo(n))



