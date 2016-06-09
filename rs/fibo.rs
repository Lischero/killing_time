use std::io;

fn main() {
    let mut s = String::new();
    match io::stdin().read_line(&mut s) {
        Err(_) => panic!("failed to read a line"),
        _ => {},
    }

    let n = match s.trim().parse() {
        Ok(x) => x,
        Err(_) => panic!("not a number"),
    };

    println!("{}", fibo(n));
}

fn fibo(x: u64) -> u64 {
    if x == 0 {
        return x;
    }

    let mut pre = (0, 1);
    for _ in 1..x {
        pre = (pre.1, pre.0 + pre.1);
    }

    pre.1
}
