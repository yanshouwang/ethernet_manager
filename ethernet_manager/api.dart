// Run with `dart run pigeon --input api.dart`.

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/ethernet_manager_api.g.dart',
    kotlinOut:
        'android/src/main/kotlin/dev/zeekr/ethernet_manager/EthernetManagerApi.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'dev.zeekr.ethernet_manager',
      errorClassName: 'EthernetManagerError',
    ),
  ),
)
enum IpAssignmentApi { static, dhcp, unassigned }

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.ethernet_manager.EthernetManager',
  ),
)
abstract class EthernetManagerProxyApi {
  @static
  late final EthernetManagerProxyApi instance;

  IpConfigurationProxyApi getConfiguration(String iface);
  void setConfiguration(String iface, IpConfigurationProxyApi config);
  bool isAvailable([String? iface]);
  List<String> getAvailableInterfaces();
  void addListener(EthernetManagerListenerProxyApi listener);
  void removeListener(EthernetManagerListenerProxyApi listener);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.ethernet_manager.IpConfiguration',
  ),
)
abstract class IpConfigurationProxyApi {
  IpAssignmentApi getIpAssignment();
  void setIpAssignment(IpAssignmentApi ipAssignment);
  StaticIpConfigurationProxyApi? getStaticIpConfiguration();
  void setStaticIpConfiguration(
    StaticIpConfigurationProxyApi? staticIpConfiguration,
  );
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.ethernet_manager.StaticIpConfiguration',
  ),
)
abstract class StaticIpConfigurationProxyApi {
  void clear();
  LinkAddressProxyApi getIpAddress();
  InetAddressProxyApi? getGateway();
  List<InetAddressProxyApi> getDnsServers();
  String? getDomains();

  void addDnsServer(InetAddressProxyApi server);
  List<RouteInfoProxyApi> getRoutes([String? iface]);
  LinkPropertiesProxyApi toLinkProperties([String? iface]);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.net.LinkAddress',
  ),
)
abstract class LinkAddressProxyApi {
  bool isIpv6();
  bool isIpv4();
  bool isSameAddressAs(LinkAddressProxyApi? other);
  InetAddressProxyApi getAddress();
  int getPrefixLength();
  int getFlags();
  int getScope();
  int getDeprecationTime();
  int getExpirationTime();
  bool isGlobalPreferred();
  bool isPreferred();
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'java.net.InetAddress'),
)
abstract class InetAddressProxyApi {
  bool isMulticastAddress();
  bool isAnyLocalAddress();
  bool isLoopbackAddress();
  bool isLinkLocalAddress();
  bool isSiteLocalAddress();
  bool isMCGlobal();
  bool isMCNodeLocal();
  bool isMCLinkLocal();
  bool isMCSiteLocal();
  bool isMCOrgLocal();
  bool isReachable({
    NetworkInterfaceProxyApi? netif,
    int? ttl,
    required int timeout,
  });
  String getHostName();
  String getCanonicalHostName();
  Uint8List getAddress();
  String? getHostAddress();
  @static
  InetAddressProxyApi getByAddress({String? host, required Uint8List addr});
  @static
  InetAddressProxyApi getByName(String host);
  @static
  List<InetAddressProxyApi> getAllByName(String host);
  @static
  InetAddressProxyApi getLoopbackAddress();
  @static
  InetAddressProxyApi getLocalHost();
  @static
  void clearDnsCache();
  @static
  InetAddressProxyApi getByNameOnNet(String host, int netId);
  @static
  List<InetAddressProxyApi> getAllByNameOnNet(String host, int netId);
}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'java.net.NetworkInterface',
  ),
)
abstract class NetworkInterfaceProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(fullClassName: 'android.net.RouteInfo'),
)
abstract class RouteInfoProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'android.net.LinkProperties',
  ),
)
abstract class LinkPropertiesProxyApi {}

@ProxyApi(
  kotlinOptions: KotlinProxyApiOptions(
    fullClassName: 'dev.zeekr.ethernet_manager.EthernetManager.Listener',
  ),
)
abstract class EthernetManagerListenerProxyApi {
  EthernetManagerListenerProxyApi();

  late final void Function(String iface, bool isAvailable)
  onAvailabilityChanged;
}
