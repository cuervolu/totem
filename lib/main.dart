import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:totem/core/di/injection.dart';
import 'package:totem/core/services/preferences_service.dart';
import 'package:totem/core/theme/theme.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';
import 'package:totem/core/utils/platform_utils.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  const resetOnboarding = bool.fromEnvironment(
    'RESET_ONBOARDING',
    defaultValue: false,
  );
  if (resetOnboarding) {
    await getIt<PreferencesService>().setOnboardingCompleted(false);
  }

  if (isDesktop) {
    await setupWindowManager();
  }

  runApp(const TotemApp());
}

Future<void> setupWindowManager() async {
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = WindowOptions(
    minimumSize: Size(1024, 600),
    maximumSize: Size(1920, 1080),
    size: Size(1024, 600),
    title: 'Totem',
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

class TotemApp extends StatelessWidget {
  const TotemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ConnectivityCubit>(),
      child: ToastificationWrapper(
        child: CalendarControllerProvider(
          controller: getIt<EventController>(),
          child: MaterialApp.router(
            title: 'Totem',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: getIt<GoRouter>(), 
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
