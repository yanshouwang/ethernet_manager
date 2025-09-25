import 'ip_assignment.dart';
import 'static_ip_configuration.dart';

abstract interface class IpConfiguration {
  Future<IpAssignment> getIpAssignment();
  Future<void> setIpAssignment(IpAssignment ipAssignment);
  Future<StaticIpConfiguration?> getStaticIpConfiguration();
  Future<void> setStaticIpConfiguration(
    StaticIpConfiguration? staticIpConfiguration,
  );
}
