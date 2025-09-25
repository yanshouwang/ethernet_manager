import 'ethernet_manager_availability_changed_event.dart';
import 'ethernet_manager_api.dart';
import 'ip_configuration.dart';

abstract interface class EthernetManager {
  factory EthernetManager() => EthernetManagerApi.instance;

  Stream<EthernetManagerAvailabilityChangedEvent> get onAvailabilityChanged;

  Future<IpConfiguration> getConfiguration(String iface);
  Future<void> setConfiguration(String iface, IpConfiguration config);
  Future<bool> isAvailable([String? iface]);
  Future<List<String>> getAvailableInterfaces();
}
