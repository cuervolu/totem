class LocationData {
  final double latitude;
  final double longitude;
  final String displayAddress;
  final DateTime timestamp;

  const LocationData({
    required this.latitude,
    required this.longitude,
    required this.displayAddress,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'displayAddress': displayAddress,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      displayAddress: json['displayAddress'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  @override
  String toString() {
    return 'LocationData(lat: $latitude, lon: $longitude, address: $displayAddress)';
  }
}
