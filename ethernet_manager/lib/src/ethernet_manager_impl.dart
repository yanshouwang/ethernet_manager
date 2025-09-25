import 'dart:async';
import 'dart:typed_data';

import 'ethernet_manager_api.dart';
import 'ethernet_manager_api.g.dart';
import 'ethernet_manager_availability_changed_event.dart';
import 'inet_address.dart';
import 'ip_assignment.dart';
import 'ip_configuration.dart';
import 'link_address.dart';
import 'link_properties.dart';
import 'network_interface.dart';
import 'route_info.dart';
import 'static_ip_configuration.dart';

final class EthernetManagerImpl extends EthernetManagerApi {
  final EthernetManagerProxyApi api;
  late final StreamController<EthernetManagerAvailabilityChangedEvent>
  _onAvailabilityChangedController;
  EthernetManagerListenerProxyApi? _listenerApi;

  EthernetManagerImpl() : api = EthernetManagerProxyApi.instance, super.impl() {
    _onAvailabilityChangedController = StreamController.broadcast(
      onListen: () async {
        if (_listenerApi != null) {
          throw ArgumentError("listenerApi is not null");
        }
        final listenerApi = EthernetManagerListenerProxyApi(
          onAvailabilityChanged: (_, iface, isAvailable) {
            final event = EthernetManagerAvailabilityChangedEvent(
              iface,
              isAvailable,
            );
            _onAvailabilityChangedController.add(event);
          },
        );
        _listenerApi = listenerApi;
        await api.addListener(listenerApi);
      },
      onCancel: () async {
        final listener = ArgumentError.checkNotNull(_listenerApi);
        _listenerApi = null;
        await api.removeListener(listener);
      },
    );
  }

  @override
  Stream<EthernetManagerAvailabilityChangedEvent> get onAvailabilityChanged =>
      _onAvailabilityChangedController.stream;

  @override
  Future<IpConfiguration> getConfiguration(String iface) =>
      api.getConfiguration(iface).then((e) => e.impl);

  @override
  Future<void> setConfiguration(String iface, IpConfiguration config) =>
      api.setConfiguration(iface, config.api);

  @override
  Future<bool> isAvailable([String? iface]) => api.isAvailable(iface);

  @override
  Future<List<String>> getAvailableInterfaces() => api.getAvailableInterfaces();
}

final class IpConfigurationImpl extends IpConfigurationApi {
  final IpConfigurationProxyApi api;

  IpConfigurationImpl.api(this.api) : super.impl();

  @override
  Future<IpAssignment> getIpAssignment() =>
      api.getIpAssignment().then((e) => e.impl);

  @override
  Future<void> setIpAssignment(IpAssignment ipAssignment) =>
      api.setIpAssignment(ipAssignment.api);

  @override
  Future<StaticIpConfiguration?> getStaticIpConfiguration() =>
      api.getStaticIpConfiguration().then((e) => e?.impl);

  @override
  Future<void> setStaticIpConfiguration(
    StaticIpConfiguration? staticIpConfiguration,
  ) => api.setStaticIpConfiguration(staticIpConfiguration?.api);
}

final class StaticIpConfigurationImpl extends StaticIpConfigurationApi {
  final StaticIpConfigurationProxyApi api;

  StaticIpConfigurationImpl.api(this.api) : super.impl();

  @override
  Future<void> clear() => api.clear();

  @override
  Future<LinkAddress> getIpAddress() => api.getIpAddress().then((e) => e.impl);

  @override
  Future<InetAddress?> getGateway() => api.getGateway().then((e) => e?.impl);

  @override
  Future<List<InetAddress>> getDnsServers() =>
      api.getDnsServers().then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<String?> getDomains() => api.getDomains();

  @override
  Future<void> addDnsServer(InetAddress server) => api.addDnsServer(server.api);

  @override
  Future<List<RouteInfo>> getRoutes([String? iface]) =>
      api.getRoutes(iface).then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<LinkProperties> toLinkProperties([String? iface]) =>
      api.toLinkProperties(iface).then((e) => e.impl);
}

final class LinkAddressImpl extends LinkAddressApi {
  final LinkAddressProxyApi api;

  LinkAddressImpl.api(this.api) : super.impl();

  @override
  Future<bool> isIpv6() => api.isIpv6();

  @override
  Future<bool> isIpv4() => api.isIpv4();

  @override
  Future<bool> isSameAddressAs(LinkAddress? other) =>
      api.isSameAddressAs(other?.api);

  @override
  Future<InetAddress> getAddress() => api.getAddress().then((e) => e.impl);

  @override
  Future<int> getPrefixLength() => api.getPrefixLength();

  @override
  Future<int> getFlags() => api.getFlags();

  @override
  Future<int> getScope() => api.getScope();

  @override
  Future<int> getDeprecationTime() => api.getDeprecationTime();

  @override
  Future<int> getExpirationTime() => api.getExpirationTime();

  @override
  Future<bool> isGlobalPreferred() => api.isGlobalPreferred();

  @override
  Future<bool> isPreferred() => api.isPreferred();
}

final class InetAddressImpl extends InetAddressApi {
  final InetAddressProxyApi api;

  InetAddressImpl.api(this.api) : super.impl();

  @override
  Future<bool> isMulticastAddress() => api.isMulticastAddress();

  @override
  Future<bool> isAnyLocalAddress() => api.isAnyLocalAddress();

  @override
  Future<bool> isLoopbackAddress() => api.isLoopbackAddress();

  @override
  Future<bool> isLinkLocalAddress() => api.isLinkLocalAddress();

  @override
  Future<bool> isSiteLocalAddress() => api.isSiteLocalAddress();

  @override
  Future<bool> isMCGlobal() => api.isMCGlobal();

  @override
  Future<bool> isMCNodeLocal() => api.isMCNodeLocal();

  @override
  Future<bool> isMCLinkLocal() => api.isMCLinkLocal();

  @override
  Future<bool> isMCSiteLocal() => api.isMCSiteLocal();

  @override
  Future<bool> isMCOrgLocal() => api.isMCOrgLocal();

  @override
  Future<bool> isReachable({
    NetworkInterface? netif,
    int? ttl,
    required int timeout,
  }) => api.isReachable(netif?.api, ttl, timeout);

  @override
  Future<String> getHostName() => api.getHostName();

  @override
  Future<String> getCanonicalHostName() => api.getCanonicalHostName();

  @override
  Future<Uint8List> getAddress() => api.getAddress();

  @override
  Future<String?> getHostAddress() => api.getHostAddress();
}

final class RouteInfoImpl extends RouteInfoApi {
  final RouteInfoProxyApi api;

  RouteInfoImpl.api(this.api) : super.impl();
}

final class LinkPropertiesImpl extends LinkPropertiesApi {
  final LinkPropertiesProxyApi api;

  LinkPropertiesImpl.api(this.api) : super.impl();
}

final class NetworkInterfaceImpl extends NetworkInterfaceApi {
  final NetworkInterfaceProxyApi api;

  NetworkInterfaceImpl.api(this.api) : super.impl();
}

extension on IpAssignment {
  IpAssignmentApi get api => IpAssignmentApi.values[index];
}

extension on IpAssignmentApi {
  IpAssignment get impl => IpAssignment.values[index];
}

extension on IpConfiguration {
  IpConfigurationProxyApi get api {
    final impl = this;
    if (impl is! IpConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension on IpConfigurationProxyApi {
  IpConfiguration get impl => IpConfigurationImpl.api(this);
}

extension on StaticIpConfiguration {
  StaticIpConfigurationProxyApi get api {
    final impl = this;
    if (impl is! StaticIpConfigurationImpl) throw TypeError();
    return impl.api;
  }
}

extension on StaticIpConfigurationProxyApi {
  StaticIpConfiguration get impl => StaticIpConfigurationImpl.api(this);
}

extension on LinkAddress {
  LinkAddressProxyApi get api {
    final impl = this;
    if (impl is! LinkAddressImpl) throw TypeError();
    return impl.api;
  }
}

extension on LinkAddressProxyApi {
  LinkAddress get impl => LinkAddressImpl.api(this);
}

extension on InetAddress {
  InetAddressProxyApi get api {
    final impl = this;
    if (impl is! InetAddressImpl) throw TypeError();
    return impl.api;
  }
}

extension on InetAddressProxyApi {
  InetAddress get impl => InetAddressImpl.api(this);
}

extension on RouteInfoProxyApi {
  RouteInfo get impl => RouteInfoImpl.api(this);
}

extension on LinkPropertiesProxyApi {
  LinkProperties get impl => LinkPropertiesImpl.api(this);
}

extension on NetworkInterface {
  NetworkInterfaceProxyApi get api {
    final impl = this;
    if (impl is! NetworkInterfaceImpl) throw TypeError();
    return impl.api;
  }
}
