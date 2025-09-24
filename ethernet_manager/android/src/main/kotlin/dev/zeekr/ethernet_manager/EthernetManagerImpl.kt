package dev.zeekr.ethernet_manager

import android.content.Context

class EthernetManagerImpl(registrar: EthernetManagerApiPigeonProxyApiRegistrar, val context: Context) :
    PigeonApiEthernetManagerProxyApi(registrar) {
    class ListenerImpl(registrar: EthernetManagerApiPigeonProxyApiRegistrar, val context: Context) :
        PigeonApiEthernetManagerListenerProxyApi(registrar) {
        override fun pigeon_defaultConstructor(): EthernetManager.Listener {
            return object : EthernetManager.Listener(context) {
                override fun onAvailabilityChanged(iface: String, isAvailable: Boolean) {
                    this@ListenerImpl.onAvailabilityChanged(this, iface, isAvailable) {}
                }
            }
        }
    }

    override fun instance(): EthernetManager {
        return EthernetManager(context)
    }

    override fun getConfiguration(pigeon_instance: EthernetManager, iface: String): IpConfiguration {
        return pigeon_instance.getConfiguration(iface)
    }

    override fun setConfiguration(pigeon_instance: EthernetManager, iface: String, config: IpConfiguration) {
        pigeon_instance.setConfiguration(iface, config)
    }

    override fun isAvailable(pigeon_instance: EthernetManager, iface: String?): Boolean {
        return if (iface == null) pigeon_instance.isAvailable()
        else pigeon_instance.isAvailable(iface)
    }

    override fun getAvailableInterfaces(pigeon_instance: EthernetManager): List<String> {
        return pigeon_instance.getAvailableInterfaces().toList()
    }

    override fun addListener(pigeon_instance: EthernetManager, listener: EthernetManager.Listener) {
        pigeon_instance.addListener(listener)
    }

    override fun removeListener(pigeon_instance: EthernetManager, listener: EthernetManager.Listener) {
        pigeon_instance.removeListener(listener)
    }
}