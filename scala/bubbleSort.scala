import scala.io.StdIn._

object Main {
    var count = 0

    def main(args: Array[String]) {
        val xs = readLine().split(" ").map {_.toInt}

        bubbleSort(xs.toList).foreach {x => print(x + " ")}
        println("")
        println(count)
    }

    def bubbleSort(xs: List[Int]): List[Int] = {
        innerBSort(xs) match {
            case (res, true) => bubbleSort(res)
            case (res, _) => res
        }
    }

    def innerBSort(xs: List[Int]): (List[Int], Boolean) = {
        xs match {
            case a :: b :: cs if a > b =>
                val (res, _) = innerBSort (a :: cs)
                count += 1
                (b :: res, true)
            case a :: b :: cs =>
                val (res, f) = innerBSort (b :: cs)
                (a :: res, f)
            case _ => (xs, false)
        }
    }
}
