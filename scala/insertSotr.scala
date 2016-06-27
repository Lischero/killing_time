import scala.io.StdIn._

object Main {
    var count = 0

    def main(args: Array[String]) {
        val xs = readLine().split(" ").map {_.toInt}

        insertSort(xs.toList).foreach {x => print(x + " ")}
        println("")
        println(count)
    }

    def insertSort(xs: List[Int]): List[Int] = {
        xs match {
            case x :: xs =>
                val res = insertSort(xs)
                innerISort(x, res)
            case xs => xs
        }
    }

    def innerISort(p: Int, xs: List[Int]): List[Int] = {
        xs match {
            case x :: xs if p > x =>
                count += 1
                x :: innerISort(p, xs)
            case xs =>
                p :: xs
        }
    }
}
