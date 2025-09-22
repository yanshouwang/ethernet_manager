import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ethernet_manager_platform_interface.dart';

/// An implementation of [EthernetManagerPlatform] that uses method channels.
class MethodChannelEthernetManager extends EthernetManagerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ethernet_manager');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
