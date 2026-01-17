import 'package:totem/core/location/models/location_data.dart';

sealed class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {
  final String? message;
  LocationLoading({this.message});
}

class LocationReady extends LocationState {
  final LocationData location;
  LocationReady(this.location);
}

class LocationFailure extends LocationState {
  final String message;
  final bool canRetry;
  final bool needsManualSearch;

  LocationFailure({
    required this.message,
    this.canRetry = false,
    this.needsManualSearch = false,
  });
}

class LocationNeedsManualSearch extends LocationState {
  final String reason;
  LocationNeedsManualSearch(this.reason);
}
