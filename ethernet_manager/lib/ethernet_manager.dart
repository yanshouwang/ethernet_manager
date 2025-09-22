
import 'ethernet_manager_platform_interface.dart';

class EthernetManager {
  Future<String?> getPlatformVersion() {
    return EthernetManagerPlatform.instance.getPlatformVersion();
  }
}
