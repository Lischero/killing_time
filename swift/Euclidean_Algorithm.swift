import Swift

let ab = readLine()!.characters.split(" ").map {
    Int(String($0))!
}

func euclidean(a: Int, b: Int) -> Int {
    switch a % b {
    case 0:
        return b
    case let m:
        return euclidean(b, b: m)
    }
}

print(euclidean(max(ab[0], ab[1]), b: min(ab[0], ab[1])))
