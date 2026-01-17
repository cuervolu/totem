import 'package:totem/core/location/models/location_data.dart';

sealed class LocationDetectionResult {}

class LocationSuccess extends LocationDetectionResult {
  final LocationData location;
  LocationSuccess(this.location);
}

class LocationError extends LocationDetectionResult {
  final LocationErrorType type;
  final String message;

  LocationError(this.type, this.message);
}

enum LocationErrorType {
  permissionDenied,
  permissionPermanentlyDenied,
  serviceDisabled,
  timeout,
  unknown,
}
