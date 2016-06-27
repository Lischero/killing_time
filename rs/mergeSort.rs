use std::io;

fn main() {
    let mut s = String::new();
    io::stdin().read_line(&mut s);
    let mut xs: Vec<i64> = s.trim().split(' ').map(|x| x.parse().unwrap()).collect();

    merge_sort(&mut xs);
    for x in xs {
        print!("{} ", x);
    }
    println!("");
}

fn merge_sort(xs: &mut Vec<i64>) {

    fn inner_msort(xs: &mut Vec<i64>, l: usize, r: usize) {
        if r - l > 1 {
            let n = (l + r) / 2;
            inner_msort(xs, l, n);
            inner_msort(xs, n, r);
            merge(xs, l, n, r);
        }
    }
    let n = xs.len();
    inner_msort(xs, 0, n);
}

fn merge(xs: &mut Vec<i64>, l: usize, m: usize, r: usize) {
    let mut ls = vec![0; m - l];
    let mut rs = vec![0; r - m];
    for (i, j) in (l..m).enumerate() {
        ls[i] = xs[j];
    }
    for (i, j) in (m..r).enumerate() {
        rs[i] = xs[j];
    }

    for i in 1..(r - l + 1) {
        xs[r - i] = match (ls.pop(), rs.pop()) {
            (Some(x), Some(y)) if x < y => {
                ls.push(x);
                y
            },
            (Some(x), Some(y)) => {
                rs.push(y);
                x
            },
            (Some(x), None) => x,
            (_, Some(y)) => y,
            (_, _) => unreachable!(),
        };
    }
}
