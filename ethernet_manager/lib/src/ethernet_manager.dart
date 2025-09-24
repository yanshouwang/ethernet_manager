import 'ethernet_manager_api.dart';
import 'ip_configuration.dart';

abstract interface class EthernetManager {
  factory EthernetManager() => EthernetManagerApi.instance;

  Future<IpConfiguration> getConfiguration(String iface);
  Future<void> setConfiguration(String iface, IpConfiguration config);
  Future<bool> isAvailable([String? iface]);
  Future<List<String>> getAvailableInterfaces();
  // Future<void> addListener(EthernetManagerListener listener);
  // Future<void> removeListener(EthernetManagerListener listener);
}
