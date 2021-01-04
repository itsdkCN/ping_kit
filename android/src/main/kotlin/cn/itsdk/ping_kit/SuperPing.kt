package cn.itsdk.ping_kit

import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.async
import java.io.BufferedReader
import java.io.InputStreamReader
import java.io.Reader

object SuperPing {
     suspend fun ping(ip: String?, timer: Int): Ping {
        val result = GlobalScope.async {
            var delay = ""
            val p = Runtime.getRuntime().exec("ping -c $timer $ip")
            val buf = BufferedReader(InputStreamReader(p.inputStream) as Reader?)
            var str: String
            buf.readLines().forEach {
                str = it
                if (str.contains("avg")) {
                    val i = str.indexOf("=", 20)
                    val j = str.indexOf(".", i)
                    print(str)
                    println("延迟:" + str.substring(i + 2, j))
                    delay = str.substring(i + 2, j)
                }
            }
            return@async Ping(delay)
//            sendEvent(Ping(delay))
        }
        return result.await()
    }
}