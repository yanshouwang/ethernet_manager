import 'package:flutter_test/flutter_test.dart';
import 'package:ethernet_manager/ethernet_manager.dart';
import 'package:ethernet_manager/ethernet_manager_platform_interface.dart';
import 'package:ethernet_manager/ethernet_manager_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEthernetManagerPlatform
    with MockPlatformInterfaceMixin
    implements EthernetManagerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EthernetManagerPlatform initialPlatform = EthernetManagerPlatform.instance;

  test('$MethodChannelEthernetManager is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEthernetManager>());
  });

  test('getPlatformVersion', () async {
    EthernetManager ethernetManagerPlugin = EthernetManager();
    MockEthernetManagerPlatform fakePlatform = MockEthernetManagerPlatform();
    EthernetManagerPlatform.instance = fakePlatform;

    expect(await ethernetManagerPlugin.getPlatformVersion(), '42');
  });
}
