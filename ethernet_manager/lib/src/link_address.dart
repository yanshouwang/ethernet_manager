import 'inet_address.dart';

abstract interface class LinkAddress {
  Future<bool> isIpv6();
  Future<bool> isIpv4();
  Future<bool> isSameAddressAs(LinkAddress? other);
  Future<InetAddress> getAddress();
  Future<int> getPrefixLength();
  Future<int> getFlags();
  Future<int> getScope();
  Future<int> getDeprecationTime();
  Future<int> getExpirationTime();
  Future<bool> isGlobalPreferred();
  Future<bool> isPreferred();
}
