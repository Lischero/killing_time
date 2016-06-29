import scala.io.StdIn._

object Main {
    def main(args: Array[String]) {
        val xs = readLine().split(" ").map {_.toInt}

        for (x <- mergeSort(xs.toList)) {
            print(x + " ")
        }
        println("")
    }

    def mergeSort(xs: List[Int]): List[Int] = {
        def merge(xs: List[Int], ys: List[Int]): List[Int] = {
            (xs, ys) match {
                case (x :: xs, y :: ys) if y > x => x :: merge(xs, y :: ys)
                case (x :: xs, y :: ys) => y :: merge(x :: xs, ys)
                case (_ :: _, Nil) => xs
                case _ => ys
            }
        }

        xs match {
            case _ :: _ :: _ =>
                val n = xs.length / 2
                val (ys, zs) = xs.splitAt(n)
                merge(mergeSort(ys), mergeSort(zs))
            case _ => xs
        }
    }

}
