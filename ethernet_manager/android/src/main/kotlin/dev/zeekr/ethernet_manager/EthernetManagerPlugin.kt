package dev.zeekr.ethernet_manager

import io.flutter.embedding.engine.plugins.FlutterPlugin

/** EthernetManagerPlugin */
class EthernetManagerPlugin : FlutterPlugin {
    lateinit var registrar: EthernetManagerApiPigeonProxyApiRegistrar

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val binaryMessenger = binding.binaryMessenger
        val context = binding.applicationContext
        this.registrar = EthernetManagerRegistrarImpl(binaryMessenger, context)
        this.registrar.setUp()
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        this.registrar.tearDown()
        this.registrar.instanceManager.stopFinalizationListener()
    }
}
