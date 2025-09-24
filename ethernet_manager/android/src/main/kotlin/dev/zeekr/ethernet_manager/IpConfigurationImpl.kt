package dev.zeekr.ethernet_manager

class IpConfigurationImpl(registrar: EthernetManagerApiPigeonProxyApiRegistrar) :
    PigeonApiIpConfigurationProxyApi(registrar) {
    override fun getIpAssignment(pigeon_instance: IpConfiguration): IpAssignmentApi {
        return pigeon_instance.ipAssignment.api
    }

    override fun setIpAssignment(pigeon_instance: IpConfiguration, ipAssignment: IpAssignmentApi) {
        pigeon_instance.ipAssignment = ipAssignment.impl
    }

    override fun getStaticIpConfiguration(pigeon_instance: IpConfiguration): StaticIpConfiguration? {
        return pigeon_instance.staticIpConfiguration
    }

    override fun setStaticIpConfiguration(
        pigeon_instance: IpConfiguration, staticIpConfiguration: StaticIpConfiguration?
    ) {
        pigeon_instance.staticIpConfiguration = staticIpConfiguration
    }
}

val IpConfiguration.IpAssignment.api get() = IpAssignmentApi.values()[ordinal]

val IpAssignmentApi.impl get() = IpConfiguration.IpAssignment.values()[ordinal]