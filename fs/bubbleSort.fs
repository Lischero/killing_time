open System

let mutable count = 0

let rec innerBSort = function
    | x :: y :: zs when x > y ->
        count <- count + 1
        let (res, _) = innerBSort (x :: zs)
        (y :: res, true)
    | x :: y :: zs ->
        let (res, flag) = innerBSort (y :: zs)
        (x :: res, flag)
    | xs -> (xs, false)

let rec bubbleSort xs =
    match innerBSort xs with
    | (res, true) -> bubbleSort res
    | (res, _) -> res

Console.ReadLine().Split(' ')
    |> Array.map int
    |> Array.toList
    |> bubbleSort
    |> List.iter (printf "%d ")
printfn ""
printfn "%d" count
