import 'inet_address.dart';
import 'link_address.dart';
import 'link_properties.dart';
import 'route_info.dart';

abstract interface class StaticIpConfiguration {
  Future<void> clear();
  Future<LinkAddress> getIpAddress();
  Future<InetAddress?> getGateway();
  Future<List<InetAddress>> getDnsServers();
  Future<String?> getDomains();
  Future<void> addDnsServer(InetAddress server);
  Future<List<RouteInfo>> getRoutes([String? iface]);
  Future<LinkProperties> toLinkProperties([String? iface]);
}
