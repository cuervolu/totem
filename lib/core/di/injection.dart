import 'package:calendar_view/calendar_view.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';
import 'package:totem/core/connectivity/connectivity_manager.dart';
import 'package:totem/core/router/app_router.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Connectivity
  getIt.registerLazySingleton<ConnectivityManager>(() => ConnectivityManager());

  getIt.registerLazySingleton<ConnectivityCubit>(() => ConnectivityCubit());

  // Calendar
  getIt.registerLazySingleton<EventController>(() => EventController());

  // Router
  getIt.registerLazySingleton<GoRouter>(() => createAppRouter());
}
