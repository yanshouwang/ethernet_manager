package dev.zeekr.ethernet_manager

import android.annotation.SuppressLint
import android.net.LinkAddress
import android.net.LinkProperties
import android.net.RouteInfo
import java.net.InetAddress

@SuppressLint("PrivateApi")
class StaticIpConfiguration(val instance: Any) {
    companion object {
        val clazz: Class<*> get() = Class.forName("android.net.StaticIpConfiguration")
    }

    fun clear() {
        val method = clazz.getMethod("clear")
        method.invoke(this.instance)
    }

    val ipAddress: LinkAddress
        get() {
            val method = clazz.getMethod("getIpAddress")
            return method.invoke(this.instance) as LinkAddress
        }

    val gateway: InetAddress
        get() {
            val method = clazz.getMethod("getGateway")
            return method.invoke(this.instance) as InetAddress
        }

    val dnsServers: List<InetAddress>
        get() {
            val method = clazz.getMethod("getDnsServers")
            val servers = method.invoke(this.instance) as List<*>
            return servers.filterIsInstance<InetAddress>()
        }

    val domains: String?
        get() {
            val method = clazz.getMethod("getDomains")
            return method.invoke(this.instance) as String?
        }

    fun addDnsServer(server: InetAddress) {
        val method = clazz.getMethod("addDnsServer", InetAddress::class.java)
        method.invoke(this.instance, server)
    }

    fun getRoutes(iface: String?): List<RouteInfo> {
        val method = clazz.getMethod("getRoutes", String::class.java)
        val routes = method.invoke(this.instance, iface) as List<*>
        return routes.filterIsInstance<RouteInfo>()
    }

    fun toLinkProperties(iface: String?): LinkProperties {
        val method = clazz.getMethod("toLinkProperties", String::class.java)
        return method.invoke(this.instance, iface) as LinkProperties
    }
}