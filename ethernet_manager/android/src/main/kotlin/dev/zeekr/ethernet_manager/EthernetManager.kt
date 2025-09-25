package dev.zeekr.ethernet_manager

import android.annotation.SuppressLint
import android.content.Context
import net.bytebuddy.ByteBuddy
import net.bytebuddy.android.AndroidClassLoadingStrategy
import net.bytebuddy.description.method.MethodDescription
import net.bytebuddy.implementation.InvocationHandlerAdapter
import net.bytebuddy.matcher.ElementMatchers
import java.lang.reflect.InvocationHandler

@SuppressLint("PrivateApi")
class EthernetManager(context: Context) {
    companion object {
        val ETHERNET_SERVICE: String
            get() {
                val field = Context::class.java.getField("ETHERNET_SERVICE")
                return field.get(null) as String
            }

        val clazz: Class<*> get() = Class.forName("android.net.EthernetManager")
    }

    abstract class Listener(context: Context) {
        companion object {
            val clazz: Class<*> get() = Class.forName("android.net.EthernetManager.Listener")
        }

        val instance: Any

        init {
            val matcher = ElementMatchers.named<MethodDescription>("onAvailabilityChanged")
            val handler = InvocationHandler { _, _, args ->
                val iface = args[0] as String
                val isAvailable = args[1] as Boolean
                onAvailabilityChanged(iface, isAvailable)
            }
            val implementation = InvocationHandlerAdapter.of(handler)
            val privateDirectory = context.getDir("generated", Context.MODE_PRIVATE)
            val classLoadingStrategy = AndroidClassLoadingStrategy.Wrapping(privateDirectory)
            this.instance = ByteBuddy().subclass(clazz).method(matcher).intercept(implementation).make()
                .load(clazz.classLoader, classLoadingStrategy).loaded.getConstructor().newInstance()
        }

        abstract fun onAvailabilityChanged(iface: String, isAvailable: Boolean)
    }

    val instance: Any = context.getSystemService(ETHERNET_SERVICE)

    fun getConfiguration(iface: String): IpConfiguration {
        val method = clazz.getMethod("getConfiguration", String::class.java)
        val instance = method.invoke(this.instance, iface) ?: throw NullPointerException("configuration is null")
        return IpConfiguration(instance)
    }

    fun setConfiguration(iface: String, config: IpConfiguration) {
        val method = clazz.getMethod("setConfiguration", String::class.java, IpConfiguration.clazz)
        method.invoke(this.instance, iface, config.instance)
    }

    fun isAvailable(): Boolean {
        val method = clazz.getMethod("isAvailable")
        return method.invoke(this.instance) as Boolean
    }

    fun isAvailable(iface: String): Boolean {
        val method = clazz.getMethod("isAvailable", String::class.java)
        return method.invoke(this.instance, iface) as Boolean
    }

    fun getAvailableInterfaces(): Array<String> {
        val method = clazz.getMethod("getAvailableInterfaces")
        val ifaces = method.invoke(this.instance) as Array<*>
        return ifaces.filterIsInstance<String>().toTypedArray()
    }

    fun addListener(listener: Listener) {
        val method = clazz.getMethod("addListener", Listener.clazz)
        method.invoke(this.instance, listener.instance)
    }

    fun removeListener(listener: Listener) {
        val method = clazz.getMethod("removeListener", Listener.clazz)
        method.invoke(this.instance, listener.instance)
    }
}