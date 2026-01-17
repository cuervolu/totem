import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:totem/core/location/models/location_data.dart';
import 'package:totem/core/location/models/location_detection_result.dart';
import 'package:totem/core/location/presentation/location_state.dart';
import 'package:totem/core/location/services/location_detector_service.dart';
import 'package:totem/core/services/preferences_service.dart';
import 'package:totem/core/utils/platform_utils.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationDetectorService _detector;
  final PreferencesService _prefs;
  final Logger _logger;

  LocationCubit({
    required LocationDetectorService detector,
    required PreferencesService prefs,
    required Logger logger,
  }) : _detector = detector,
       _prefs = prefs,
       _logger = logger,
       super(LocationInitial());

  Future<void> initialize() async {
    final saved = _prefs.getLocation();

    if (saved != null) {
      _logger.d('Loaded saved location: ${saved.displayAddress}');
      emit(LocationReady(saved));
      return;
    }

    if (isMobile) {
      await _detectLocationMobile();
    } else {
      _logger.d('Desktop: needs manual search');
      emit(LocationNeedsManualSearch('Busca tu ubicación manualmente'));
    }
  }

  Future<void> _detectLocationMobile() async {
    emit(LocationLoading(message: 'Detectando ubicación...'));

    final result = await _detector.detectLocation();

    switch (result) {
      case LocationSuccess(:final location):
        await _saveLocation(location);
        emit(LocationReady(location));

      case LocationError(:final type, :final message):
        _logger.w('Detection failed: $type - $message');

        switch (type) {
          case LocationErrorType.permissionPermanentlyDenied:
            emit(
              LocationFailure(  
                message:
                    'Permiso denegado. Habilítalo en configuración o busca manualmente.',
                needsManualSearch: true,
              ),
            );

          case LocationErrorType.permissionDenied:
          case LocationErrorType.serviceDisabled:
            emit(LocationNeedsManualSearch(message));

          case LocationErrorType.timeout:
            emit(
              LocationFailure(
                message: message,
                canRetry: true,
                needsManualSearch: true,
              ),
            );

          case LocationErrorType.unknown:
            emit(
              LocationFailure(
                message: 'Error al detectar ubicación',
                canRetry: true,
                needsManualSearch: true,
              ),
            );
        }
    }
  }

  Future<void> selectLocation(LocationData location) async {
    emit(LocationLoading(message: 'Guardando ubicación...'));
    await _saveLocation(location);
    emit(LocationReady(location));
  }

  Future<void> updateLocation(LocationData location) async {
    await _saveLocation(location);
    emit(LocationReady(location));
  }

  Future<void> _saveLocation(LocationData location) async {
    try {
      await _prefs.saveLocation(location);
      _logger.i('Location saved: ${location.displayAddress}');
    } catch (e) {
      _logger.e('Failed to save location', error: e);
    }
  }

  Future<void> clearLocation() async {
    await _prefs.clearLocation();
    emit(LocationInitial());
  }
}
