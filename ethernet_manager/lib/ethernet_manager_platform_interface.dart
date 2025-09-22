import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ethernet_manager_method_channel.dart';

abstract class EthernetManagerPlatform extends PlatformInterface {
  /// Constructs a EthernetManagerPlatform.
  EthernetManagerPlatform() : super(token: _token);

  static final Object _token = Object();

  static EthernetManagerPlatform _instance = MethodChannelEthernetManager();

  /// The default instance of [EthernetManagerPlatform] to use.
  ///
  /// Defaults to [MethodChannelEthernetManager].
  static EthernetManagerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EthernetManagerPlatform] when
  /// they register themselves.
  static set instance(EthernetManagerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
