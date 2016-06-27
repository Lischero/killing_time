open System

let mutable count = 0

let rec innerISort p = function
    | x :: xs when p > x ->
        count <- count + 1
        x :: innerISort p xs
    | x :: xs -> p :: x :: xs
    | _ -> [p]

let rec insertSort = function
    | x :: xs -> innerISort x <| insertSort xs
    | _ -> []

Console.ReadLine().Split(' ')
    |> Array.map int
    |> Array.toList
    |> insertSort
    |> List.iter (printf "%d ")
printfn ""
printfn "%d" count
