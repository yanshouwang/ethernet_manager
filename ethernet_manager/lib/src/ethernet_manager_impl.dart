import 'package:ethernet_manager/src/ip_assignment.dart';
import 'package:ethernet_manager/src/ip_configuration.dart';

import 'ethernet_manager_api.dart';
import 'ethernet_manager_api.g.dart';

final class EthernetManagerImpl extends EthernetManagerApi {
  final EthernetManagerProxyApi _api;

  EthernetManagerImpl() : _api = EthernetManagerProxyApi.instance, super.impl();

  @override
  Future<IpConfiguration> getConfiguration(String iface) =>
      _api.getConfiguration(iface).then((e) => e.impl);

  @override
  Future<void> setConfiguration(String iface, IpConfiguration config) =>
      _api.setConfiguration(iface, config.api);

  @override
  Future<bool> isAvailable([String? iface]) => _api.isAvailable(iface);

  @override
  Future<List<String>> getAvailableInterfaces() =>
      _api.getAvailableInterfaces();
}

final class IpConfigurationImpl extends IpConfigurationApi {
  final IpConfigurationProxyApi api;

  IpConfigurationImpl.api(this.api) : super.impl();

  @override
  Future<IpAssignment> getIpAssignment() =>
      api.getIpAssignment().then((e) => e.impl);

  @override
  Future<void> setIpAssignment(IpAssignment ipAssignment) =>
      api.setIpAssignment(ipAssignment.api);
}

extension on IpAssignment {
  IpAssignmentApi get api => IpAssignmentApi.values[index];
}

extension on IpAssignmentApi {
  IpAssignment get impl => IpAssignment.values[index];
}

extension on IpConfiguration {
  IpConfigurationProxyApi get api {
    final impl = this;
    if (impl is! IpConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension on IpConfigurationProxyApi {
  IpConfiguration get impl => IpConfigurationImpl.api(this);
}
