final class EthernetManagerAvailabilityChangedEvent {
  final String iface;
  final bool isAvailable;

  const EthernetManagerAvailabilityChangedEvent(this.iface, this.isAvailable);
}
