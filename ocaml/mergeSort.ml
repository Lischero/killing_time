(* #load "str.cma" *)

let rec splitAt n xs =
    match xs with
    | x :: xs when n > 0 ->
        let (ys, zs) = splitAt (n - 1) xs
        (x :: ys, zs)
    | _ -> ([], xs)

let rec merge xs ys =
    match xs, ys with
    | x :: xs, y :: ys when y < x -> y :: merge (x :: xs) ys
    | x :: xs, ys -> x :: merge xs ys
    | xs, [] -> xs
    | _, _ -> ys

let rec mergeSort xs =
    match xs with
    | _ :: _ :: _ ->
        let n = List.length xs / 2
        let (ys, zs) = splitAt n xs
        merge (mergeSort ys) (mergeSort zs)
    | _ -> xs

let startN n =
    let readinput = List.map (fun a -> Scanf.sscanf a "%d" (fun b->b)) (Str.split (Str.regexp "[ \t]+") (read_line()))
    in List.iter (Printf.printf "%d ") (mergeSort readinput)

let main = Scanf.sscanf (read_line()) "%d" (fun n -> startN n)
