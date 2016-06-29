use std::io;

macro_rules!getLine{
    () => {{
        let mut s = String::new();
        match io::stdin().read_line(&mut s) {
            Ok(_) => s,
            _ => String::new(),
        }
    }};
}

fn main() {
    let s = getLine!();
    let mut xs: Vec<i64> = s.trim().split(' ').map(|x| x.parse().unwrap()).collect();

    for i in 0..(xs.len() - 1) {
        let mut min = i;
        for j in (i + 1)..xs.len() {
            if xs[min] > xs[j] {
                min = j;
            }
        }

        xs.swap(i, min);
    }

    for x in xs {
        print!("{} ", x);
    }
    println!("");
}
