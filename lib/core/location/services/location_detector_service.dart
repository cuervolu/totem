import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:totem/core/location/models/location_data.dart';
import 'package:totem/core/location/models/location_detection_result.dart';
import 'package:totem/core/location/services/nominatim_service.dart';

class LocationDetectorService {
  final Logger _logger;
  final NominatimService _nominatim;

  static const _timeout = Duration(seconds: 15);

  LocationDetectorService({
    required Logger logger,
    required NominatimService nominatim,
  }) : _logger = logger,
       _nominatim = nominatim;

  Future<LocationDetectionResult> detectLocation() async {
    try {
      final permissionResult = await _checkPermission();
      if (permissionResult != null) return permissionResult;

      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _logger.w('Location service disabled');
        return LocationError(
          LocationErrorType.serviceDisabled,
          'Servicio de ubicación deshabilitado',
        );
      }

      _logger.d('Getting position...');
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      ).timeout(_timeout);

      _logger.d('Position: ${position.latitude}, ${position.longitude}');

      final address = await _nominatim.reverseGeocode(
        position.latitude,
        position.longitude,
      );

      final locationData = LocationData(
        latitude: position.latitude,
        longitude: position.longitude,
        displayAddress:
            address ??
            '${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}',
        timestamp: DateTime.now(),
      );

      return LocationSuccess(locationData);
    } on TimeoutException {
      _logger.e('Location timeout');
      return LocationError(
        LocationErrorType.timeout,
        'La detección tardó demasiado',
      );
    } on LocationServiceDisabledException {
      return LocationError(
        LocationErrorType.serviceDisabled,
        'Servicio de ubicación deshabilitado',
      );
    } on PermissionDeniedException {
      return LocationError(
        LocationErrorType.permissionDenied,
        'Permiso denegado',
      );
    } catch (e, stack) {
      _logger.e('Location error', error: e, stackTrace: stack);
      return LocationError(LocationErrorType.unknown, e.toString());
    }
  }

  Future<LocationError?> _checkPermission() async {
    final status = await Permission.location.status;

    if (status.isGranted) return null;

    if (status.isPermanentlyDenied) {
      return LocationError(
        LocationErrorType.permissionPermanentlyDenied,
        'Permiso denegado permanentemente',
      );
    }

    final result = await Permission.location.request();

    if (result.isGranted) return null;

    if (result.isPermanentlyDenied) {
      return LocationError(
        LocationErrorType.permissionPermanentlyDenied,
        'Permiso denegado permanentemente',
      );
    }

    return LocationError(
      LocationErrorType.permissionDenied,
      'Permiso denegado',
    );
  }
}
