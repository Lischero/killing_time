import scala.io.StdIn._

object Main {
    def main(args: Array[String]) {
        val ab = readLine().split(" ").map {_.toInt}
        println(euclidean(ab(0), ab(1)))
    }

    def euclidean(a: Int, b: Int): Int = {
        if (a < b) {
            euclidean(b, a)
        }
        else if (a % b == 0) {
            b
        }
        else {
            euclidean(b, a % b)
        }
    }
}
