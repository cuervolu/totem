import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:totem/core/router/app_router.dart';
import 'package:totem/core/theme/theme.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';

void main() {
  runApp(const TotemApp());
}

class TotemApp extends StatelessWidget {
  const TotemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConnectivityCubit(),
      child: ToastificationWrapper(
        child: CalendarControllerProvider(
          controller: EventController(),
          child: MaterialApp.router(
            title: 'Totem',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
