import 'package:flutter/material.dart';

import 'package:ethernet_manager/ethernet_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final EthernetManager _ethernetManager;

  @override
  void initState() {
    super.initState();
    _ethernetManager = EthernetManager();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: ElevatedButton(onPressed: () => _test(), child: Text('TEST')),
        ),
      ),
    );
  }

  void _test() async {
    final iface = 'eth0';
    var config = await _ethernetManager.getConfiguration(iface);
    var ipAssignment = await config.getIpAssignment();
    debugPrint('getIpAssignment: $ipAssignment');
    config.setIpAssignment(IpAssignment.dhcp);
    await _ethernetManager.setConfiguration(iface, config);
    config = await _ethernetManager.getConfiguration(iface);
    ipAssignment = await config.getIpAssignment();
    debugPrint('getIpAssignment: $ipAssignment');
    final ifaces = await _ethernetManager.getAvailableInterfaces();
    debugPrint('getAvailableInterfaces: $ifaces');
    final isAvailable = await _ethernetManager.isAvailable();
    debugPrint('isAvailable: $isAvailable');
  }
}
