import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ethernet_manager.dart';
import 'ethernet_manager_impl.dart';
import 'inet_address.dart';
import 'ip_configuration.dart';
import 'link_address.dart';
import 'link_properties.dart';
import 'network_interface.dart';
import 'route_info.dart';
import 'static_ip_configuration.dart';

abstract base class EthernetManagerApi extends PlatformInterface
    implements EthernetManager {
  /// Constructs a EthernetManagerApi.
  EthernetManagerApi.impl() : super(token: _token);

  static final Object _token = Object();

  static EthernetManagerApi _instance = EthernetManagerImpl();

  /// The default instance of [EthernetManagerApi] to use.
  ///
  /// Defaults to [EthernetManagerImpl].
  static EthernetManagerApi get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EthernetManagerApi] when
  /// they register themselves.
  static set instance(EthernetManagerApi instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}

abstract base class IpConfigurationApi extends PlatformInterface
    implements IpConfiguration {
  static final _token = Object();

  IpConfigurationApi.impl() : super(token: _token);
}

abstract base class StaticIpConfigurationApi extends PlatformInterface
    implements StaticIpConfiguration {
  static final _token = Object();

  StaticIpConfigurationApi.impl() : super(token: _token);
}

abstract base class LinkAddressApi extends PlatformInterface
    implements LinkAddress {
  static final _token = Object();

  LinkAddressApi.impl() : super(token: _token);
}

abstract base class InetAddressApi extends PlatformInterface
    implements InetAddress {
  static final _token = Object();

  InetAddressApi.impl() : super(token: _token);
}

abstract base class RouteInfoApi extends PlatformInterface
    implements RouteInfo {
  static final _token = Object();

  RouteInfoApi.impl() : super(token: _token);
}

abstract base class LinkPropertiesApi extends PlatformInterface
    implements LinkProperties {
  static final _token = Object();

  LinkPropertiesApi.impl() : super(token: _token);
}

abstract base class NetworkInterfaceApi extends PlatformInterface
    implements NetworkInterface {
  static final _token = Object();

  NetworkInterfaceApi.impl() : super(token: _token);
}
