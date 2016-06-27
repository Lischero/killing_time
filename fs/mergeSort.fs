open System

let rec splitAt n = function
    | x :: xs when n  > 0 ->
        let (ys, zs) = splitAt (n - 1) xs
        (x :: ys, zs)
    | xs -> ([], xs)

let rec merge xs ys =
    match xs, ys with
    | x :: xs, y :: ys when y < x -> y :: merge (x :: xs) ys
    | x :: xs, y :: ys -> x :: merge xs (y :: ys)
    | xs, [] -> xs
    | _, ys -> ys

let rec mergeSort = function
    | (x :: y :: zs) ->
        let n = 1 + List.length zs / 2
        let (xs, ys) = splitAt n <| x :: y :: zs
        merge (mergeSort xs) (mergeSort ys)
    | xs -> xs

Console.ReadLine().Split(' ')
    |> Array.map (int)
    |> Array.toList
    |> mergeSort
    |> List.iter (printf "%d ")
printfn ""
