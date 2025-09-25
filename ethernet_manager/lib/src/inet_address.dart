import 'dart:typed_data';

import 'network_interface.dart';

abstract interface class InetAddress {
  Future<bool> isMulticastAddress();
  Future<bool> isAnyLocalAddress();
  Future<bool> isLoopbackAddress();
  Future<bool> isLinkLocalAddress();
  Future<bool> isSiteLocalAddress();
  Future<bool> isMCGlobal();
  Future<bool> isMCNodeLocal();
  Future<bool> isMCLinkLocal();
  Future<bool> isMCSiteLocal();
  Future<bool> isMCOrgLocal();
  Future<bool> isReachable({
    NetworkInterface? netif,
    int? ttl,
    required int timeout,
  });
  Future<String> getHostName();
  Future<String> getCanonicalHostName();
  Future<Uint8List> getAddress();
  Future<String?> getHostAddress();
  // @static
  // InetAddressProxyApi getByAddress({String? host, required Uint8List addr});
  // @static
  // InetAddressProxyApi getByName(String host);
  // @static
  // List<InetAddressProxyApi> getAllByName(String host);
  // @static
  // InetAddressProxyApi getLoopbackAddress();
  // @static
  // InetAddressProxyApi getLocalHost();
  // @static
  // void clearDnsCache();
  // @static
  // InetAddressProxyApi getByNameOnNet(String host, int netId);
  // @static
  // List<InetAddressProxyApi> getAllByNameOnNet(String host, int netId);
}
