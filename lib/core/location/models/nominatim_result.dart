class NominatimResult {
  final String displayName;
  final double lat;
  final double lon;
  final String? address;

  NominatimResult({
    required this.displayName,
    required this.lat,
    required this.lon,
    this.address,
  });

  factory NominatimResult.fromJson(Map<String, dynamic> json) {
    return NominatimResult(
      displayName: json['display_name'] as String,
      lat: double.parse(json['lat'] as String),
      lon: double.parse(json['lon'] as String),
      address: json['address']?.toString(),
    );
  }
}
