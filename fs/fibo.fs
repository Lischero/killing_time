open System

let fibs n = seq {
    yield 0
    yield 1
    let mutable pre = (0, 1)

    for i = 1 to n do
        pre <- (snd pre, fst pre + snd pre)
        yield (snd pre)

}

let fibo = function
    | x when x < 2 -> x
    | x -> Seq.item x <| fibs x

let a = int <| Console.ReadLine()
printfn "%d" <| fibo a
