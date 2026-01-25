import 'package:calendar_view/calendar_view.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';
import 'package:totem/core/connectivity/connectivity_manager.dart';
import 'package:totem/core/database/database.dart';
import 'package:totem/core/location/presentation/location_cubit.dart';
import 'package:totem/core/location/services/location_detector_service.dart';
import 'package:totem/core/location/services/nominatim_service.dart';
import 'package:totem/core/router/app_router.dart';
import 'package:logger/logger.dart';
import 'package:totem/core/services/preferences_service.dart';
import 'package:totem/core/utils/log_file_output.dart';
import 'package:totem/core/weather/open_meteo_service.dart';
import 'package:totem/features/weather/presentation/cubit/weather_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<Logger>(
    () => Logger(
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 80,
        colors: true,
        printEmojis: false,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      output: MultiOutput([
        ConsoleOutput(),
        RotatingFileOutput(maxFiles: 5, maxFileSizeBytes: 5 * 1024 * 1024),
      ]),
    ),
  );

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    return dio;
  });

  // Database & DAOs
  getIt.registerLazySingleton<TotemDatabase>(() => TotemDatabase());
  getIt.registerLazySingleton<WeatherDao>(
    () => getIt<TotemDatabase>().weatherDao,
  );
  getIt.registerLazySingleton<RssDao>(() => getIt<TotemDatabase>().rssDao);
  getIt.registerLazySingleton<CalendarDao>(
    () => getIt<TotemDatabase>().calendarDao,
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

  // NominatimService (usa Dio)
  getIt.registerLazySingleton<NominatimService>(
    () => NominatimService(
      logger: getIt<Logger>(),
      dio: getIt<Dio>()
        ..options.baseUrl = 'https://nominatim.openstreetmap.org'
        ..options.headers = {'User-Agent': 'Totem/0.1.0 (dev.cuervolu.totem)'},
    ),
  );

  // Router
  getIt.registerLazySingleton<GoRouter>(() => createAppRouter());

  // LocationDetectorService
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

  // OpenMeteoService
  getIt.registerLazySingleton<OpenMeteoService>(
    () => OpenMeteoService(
      weatherDao: getIt<WeatherDao>(),
      prefs: getIt<PreferencesService>(),
      logger: getIt<Logger>(),
      dio: getIt<Dio>()..options.baseUrl = 'https://api.open-meteo.com/v1',
    ),
  );

  // WeatherCubit
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(
      service: getIt<OpenMeteoService>(),
      logger: getIt<Logger>(),
    ),
  );
}
