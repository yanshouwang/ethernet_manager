package dev.zeekr.ethernet_manager

import android.annotation.SuppressLint

class IpConfiguration(val instance: Any) {
    companion object {
        val clazz: Class<*> @SuppressLint("PrivateApi") get() = Class.forName("android.net.IpConfiguration")
    }

    enum class IpAssignment {
        STATIC, DCHP, UNASSIGNED;

        companion object {
            val clazz: Class<*> @SuppressLint("PrivateApi") get() = Class.forName("android.net.IpConfiguration\$IpAssignment")

            fun of(instance: Any): IpAssignment {
                val index = IpAssignment.clazz.enumConstants!!.indexOf(instance)
                return IpAssignment.values()[index]
            }
        }

        val instance: Any get() = clazz.enumConstants!![ordinal]
    }

    var ipAssignment: IpAssignment
        get() {
            val method = clazz.getMethod("getIpAssignment")
            val instance = method.invoke(this.instance) ?: throw NullPointerException("ipAssignment is null")
            return IpAssignment.of(instance)
        }
        set(value) {
            val method = clazz.getMethod("setIpAssignment", IpAssignment.clazz)
            method.invoke(this.instance, value.instance)
        }

    var staticIpConfiguration: StaticIpConfiguration?
        get() {
            val method = clazz.getMethod("getStaticIpConfiguration")
            val instance = method.invoke(this.instance)
            return if (instance == null) null
            else StaticIpConfiguration(instance)
        }
        set(value) {
            val method = clazz.getMethod("setStaticIpConfiguration", StaticIpConfiguration.clazz)
            method.invoke(this.instance, value?.instance)
        }
}