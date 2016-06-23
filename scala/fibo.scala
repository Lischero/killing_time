import scala.io.StdIn._

object Main {
    def main(args: Array[String]) {
        val n = readLine().toInt
        println(fibo(n))
    }

    def fibo(n: Int): Int = {
        def innerFibo(x: Int, y: Int, z: Int): Int = {
            z match {
                case 0 => x + y
                case z => innerFibo(y, x + y, z - 1)
            }
        }

        if (n < 2) {
            n
        }
        else {
            innerFibo(0, 1, n - 2)
        }
    }
}
