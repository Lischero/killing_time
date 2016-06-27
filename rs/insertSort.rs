use std::io;

fn main() {
    let mut s = String::new();
    io::stdin().read_line(&mut s);
    let mut xs: Vec<i64> = s.trim().split(' ').map(|x| x.parse().unwrap()).collect();

    insert_sort(&mut xs);
    for x in xs {
        print!("{} ", x);
    }
    println!("");
}

fn insert_sort<T: Ord>(xs: &mut Vec<T>) {
    let mut count = 0;

    for i in 1..xs.len() {
        for j in 0..i {
            if xs[i - j] < xs[i - j - 1] {
                xs.swap(i - j, i - j - 1);
                count += 1;
            }
            else {
                break;
            }
        }
    }

    println!("{}", count);
}
