package dev.zeekr.ethernet_manager

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger

class EthernetManagerRegistrarImpl(binaryMessenger: BinaryMessenger, val context: Context) :
    EthernetManagerApiPigeonProxyApiRegistrar(binaryMessenger) {
    override fun getPigeonApiEthernetManagerProxyApi(): PigeonApiEthernetManagerProxyApi {
        return EthernetManagerImpl(this, context)
    }

    override fun getPigeonApiIpConfigurationProxyApi(): PigeonApiIpConfigurationProxyApi {
        return IpConfigurationImpl(this)
    }

    override fun getPigeonApiStaticIpConfigurationProxyApi(): PigeonApiStaticIpConfigurationProxyApi {
        return StaticIpConfigurationImpl(this)
    }

    override fun getPigeonApiLinkAddressProxyApi(): PigeonApiLinkAddressProxyApi {
        return LinkAddressImpl(this)
    }

    override fun getPigeonApiInetAddressProxyApi(): PigeonApiInetAddressProxyApi {
        return InetAddressImpl(this)
    }

    override fun getPigeonApiEthernetManagerListenerProxyApi(): PigeonApiEthernetManagerListenerProxyApi {
        return EthernetManagerImpl.ListenerImpl(this, context)
    }
}