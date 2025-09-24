import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ethernet_manager.dart';
import 'ethernet_manager_impl.dart';
import 'ip_configuration.dart';

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

abstract base class EthernetManagerListenerApi extends PlatformInterface {
  static final _token = Object();

  EthernetManagerListenerApi.impl() : super(token: _token);
}
