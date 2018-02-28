fun fib(n: Int): Int {
   require(n >= 0)
   fun fib1(k: Int, a: Int, b: Int): Int =
       if (k == 0) a else fib1(k - 1, b, a + b)
   return fib1(n, 0, 1)
}
 
fun main(args: Array<String>) {
    for (i in 0..35) print("${fib(i)}\n")
}
