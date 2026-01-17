import 'package:calendar_view/calendar_view.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';
import 'package:totem/core/connectivity/connectivity_manager.dart';
import 'package:totem/core/location/presentation/location_cubit.dart';
import 'package:totem/core/location/services/location_detector_service.dart';
import 'package:totem/core/location/services/nominatim_service.dart';
import 'package:totem/core/router/app_router.dart';
import 'package:logger/logger.dart';
import 'package:totem/core/services/preferences_service.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Logger
  getIt.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.none,
      ),
    ),
  );

  // PreferencesService
  getIt.registerLazySingleton<PreferencesService>(
    () => PreferencesService(getIt<SharedPreferences>()),
  );

  // Connectivity
  getIt.registerLazySingleton<ConnectivityManager>(() => ConnectivityManager());
  getIt.registerLazySingleton<ConnectivityCubit>(() => ConnectivityCubit());

  // Calendar
  getIt.registerLazySingleton<EventController>(() => EventController());

  // Nominatim
  getIt.registerLazySingleton<NominatimService>(
    () => NominatimService(logger: getIt<Logger>()),
  );

  // Router
  getIt.registerLazySingleton<GoRouter>(() => createAppRouter());

  // LocationDetector
  getIt.registerLazySingleton<LocationDetectorService>(
    () => LocationDetectorService(
      logger: getIt<Logger>(),
      nominatim: getIt<NominatimService>(),
    ),
  );

// LocationCubit
  getIt.registerFactory<LocationCubit>(
    () => LocationCubit(
      detector: getIt<LocationDetectorService>(),
      prefs: getIt<PreferencesService>(),
      logger: getIt<Logger>(),
    ),
  );

}
