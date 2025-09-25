package dev.zeekr.ethernet_manager

import android.os.Handler
import android.os.Looper

object EthernetManagerUtil {
    fun runOnMainThread(r: Runnable) {
        val looper = Looper.getMainLooper()
        val handler = Handler(looper)
        handler.post(r)
    }
}