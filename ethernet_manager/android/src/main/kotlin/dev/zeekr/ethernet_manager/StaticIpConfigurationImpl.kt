package dev.zeekr.ethernet_manager

import android.net.LinkAddress
import android.net.LinkProperties
import android.net.RouteInfo
import java.net.InetAddress

class StaticIpConfigurationImpl(registrar: EthernetManagerApiPigeonProxyApiRegistrar) :
    PigeonApiStaticIpConfigurationProxyApi(registrar) {
    override fun clear(pigeon_instance: StaticIpConfiguration) {
        pigeon_instance.clear()
    }

    override fun getIpAddress(pigeon_instance: StaticIpConfiguration): LinkAddress {
        return pigeon_instance.ipAddress
    }

    override fun getGateway(pigeon_instance: StaticIpConfiguration): InetAddress? {
        return pigeon_instance.gateway
    }

    override fun getDnsServers(pigeon_instance: StaticIpConfiguration): List<InetAddress> {
        return pigeon_instance.dnsServers
    }

    override fun getDomains(pigeon_instance: StaticIpConfiguration): String? {
        return pigeon_instance.domains
    }

    override fun addDnsServer(pigeon_instance: StaticIpConfiguration, server: InetAddress) {
        pigeon_instance.addDnsServer(server)
    }

    override fun getRoutes(pigeon_instance: StaticIpConfiguration, iface: String?): List<RouteInfo> {
        return pigeon_instance.getRoutes(iface)
    }

    override fun toLinkProperties(pigeon_instance: StaticIpConfiguration, iface: String?): LinkProperties {
        return pigeon_instance.toLinkProperties(iface)
    }
}
