package dev.zeekr.ethernet_manager

import android.net.LinkAddress
import java.net.InetAddress

class LinkAddressImpl(registrar: EthernetManagerApiPigeonProxyApiRegistrar) : PigeonApiLinkAddressProxyApi(registrar) {
    override fun isIpv6(pigeon_instance: LinkAddress): Boolean {
        throw NotImplementedError()
    }

    override fun isIpv4(pigeon_instance: LinkAddress): Boolean {
        throw NotImplementedError()
    }

    override fun isSameAddressAs(pigeon_instance: LinkAddress, other: LinkAddress?): Boolean {
        throw NotImplementedError()
    }

    override fun getAddress(pigeon_instance: LinkAddress): InetAddress {
        return pigeon_instance.address
    }

    override fun getPrefixLength(pigeon_instance: LinkAddress): Long {
        return pigeon_instance.prefixLength.toLong()
    }

    override fun getFlags(pigeon_instance: LinkAddress): Long {
        return pigeon_instance.flags.toLong()
    }

    override fun getScope(pigeon_instance: LinkAddress): Long {
        return pigeon_instance.scope.toLong()
    }

    override fun getDeprecationTime(pigeon_instance: LinkAddress): Long {
        throw NotImplementedError()
    }

    override fun getExpirationTime(pigeon_instance: LinkAddress): Long {
        throw NotImplementedError()
    }

    override fun isGlobalPreferred(pigeon_instance: LinkAddress): Boolean {
        throw NotImplementedError()
    }

    override fun isPreferred(pigeon_instance: LinkAddress): Boolean {
        throw NotImplementedError()
    }
}