// version 1.0.6
 
import java.math.BigInteger
 
fun main(args: Array<String>) {
    val cent = BigInteger("100")
    val huit_cent = 800
    val a = BigInteger("2988348162058574136915891421498819466320163312926952423791023078876139")
    val b = BigInteger("2351399303373464486466122544523690094744975233415544072992656881240319")
    val m = cent.pow(huit_cent)
    print(a.modPow(b, m))
    print("\n")
}
