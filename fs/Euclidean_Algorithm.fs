open System

let rec euclidean (a: int) (b: int) =
    match a % b with
        | 0 -> b
        | m -> euclidean b m

let s = Console.ReadLine().Split(' ')
let (a, b) = (int s.[0], int s.[1])

printfn "%d" <| euclidean (max a b) (min a b)
