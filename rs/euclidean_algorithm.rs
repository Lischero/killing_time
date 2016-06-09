use std::io;
use std::cmp;

fn main() {
    let mut s = String::new();
    match io::stdin().read_line(&mut s) {
        Err(_) => panic!("failed to read line"),
        _ => {},
    }

    let mut ab = [0; 2];
    for (i, x) in s.trim().split(' ').enumerate() {
        ab[i] = match x.parse() {
            Ok(n) => n,
            Err(_) => panic!("not a number"),
        };
    }

    println!("{}", euclidean(cmp::max(ab[0], ab[1]), cmp::min(ab[0], ab[1])));
}

fn euclidean(a: u64, b: u64) -> u64 {
    let m = a % b;
    if m == 0 {
        b
    }
    else {
        euclidean(b, m)
    }
}
