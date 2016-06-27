use std::io;

fn main() {
    let mut s = String::new();
    io::stdin().read_line(&mut s);
    let mut xs: Vec<i64> = s.trim().split(' ').map(|x| x.parse().unwrap()).collect();

    let mut count = 0;
    let mut flag = true;
    while flag {
        flag = false;
        for i in 0..(xs.len() - 1) {
            if xs[i] > xs[i + 1] {
                xs.swap(i, i + 1);
                flag = true;
                count += 1;
            }
        }
    }

    for x in xs {
        print!("{} ", x);
    }
    println!("");

    println!("{}", count);
}
