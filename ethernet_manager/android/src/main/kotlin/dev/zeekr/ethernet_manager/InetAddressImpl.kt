package dev.zeekr.ethernet_manager

import java.net.InetAddress
import java.net.NetworkInterface

class InetAddressImpl(registrar: EthernetManagerApiPigeonProxyApiRegistrar) : PigeonApiInetAddressProxyApi(registrar) {
    override fun isMulticastAddress(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isMulticastAddress
    }

    override fun isAnyLocalAddress(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isAnyLocalAddress
    }

    override fun isLoopbackAddress(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isLoopbackAddress
    }

    override fun isLinkLocalAddress(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isLinkLocalAddress
    }

    override fun isSiteLocalAddress(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isSiteLocalAddress
    }

    override fun isMCGlobal(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isMCGlobal
    }

    override fun isMCNodeLocal(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isMCNodeLocal
    }

    override fun isMCLinkLocal(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isMCLinkLocal
    }

    override fun isMCSiteLocal(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isMCSiteLocal
    }

    override fun isMCOrgLocal(pigeon_instance: InetAddress): Boolean {
        return pigeon_instance.isMCOrgLocal
    }

    override fun isReachable(
        pigeon_instance: InetAddress, netif: NetworkInterface?, ttl: Long?, timeout: Long
    ): Boolean {
        return if (netif == null || ttl === null) pigeon_instance.isReachable(timeout.toInt())
        else pigeon_instance.isReachable(netif, ttl.toInt(), timeout.toInt())
    }

    override fun getHostName(pigeon_instance: InetAddress): String {
        return pigeon_instance.hostName
    }

    override fun getCanonicalHostName(pigeon_instance: InetAddress): String {
        return pigeon_instance.canonicalHostName
    }

    override fun getAddress(pigeon_instance: InetAddress): ByteArray {
        return pigeon_instance.address
    }

    override fun getHostAddress(pigeon_instance: InetAddress): String? {
        return pigeon_instance.hostAddress
    }

    override fun getByAddress(host: String?, addr: ByteArray): InetAddress {
        return if (host == null) InetAddress.getByAddress(addr)
        else InetAddress.getByAddress(host, addr)
    }

    override fun getByName(host: String): InetAddress {
        return InetAddress.getByName(host)
    }

    override fun getAllByName(host: String): List<InetAddress> {
        return InetAddress.getAllByName(host).toList()
    }

    override fun getLoopbackAddress(): InetAddress {
        return InetAddress.getLoopbackAddress()
    }

    override fun getLocalHost(): InetAddress {
        return InetAddress.getLocalHost()
    }

    override fun clearDnsCache() {
        throw NotImplementedError()
    }

    override fun getByNameOnNet(host: String, netId: Long): InetAddress {
        throw NotImplementedError()
    }

    override fun getAllByNameOnNet(host: String, netId: Long): List<InetAddress> {
        throw NotImplementedError()
    }
}