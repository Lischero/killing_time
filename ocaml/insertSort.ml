(* #load "str.cma" *)

let rec insertSort lst = 
    match lst with
    | [] -> []
    | first :: rest -> 
            let rec insert a lst2 = 
                match lst2 with
                | [] -> [a]
                | first3 :: lst3 ->
                        if first3 < a
                        then first3 :: insert a lst3
                        else a :: first3 :: lst3
            in insert first (insertSort rest)

let startN n = 
    let readinput = List.map (fun a -> Scanf.sscanf a "%d" (fun b->b)) (Str.split (Str.regexp "[ \t]+") (read_line()))
    in List.iter (Printf.printf "%d ") (insertSort readinput)

let main = Scanf.sscanf (read_line()) "%d" (fun n -> startN n)
