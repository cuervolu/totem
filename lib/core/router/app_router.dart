import 'package:go_router/go_router.dart';
import 'package:totem/core/di/injection.dart';
import 'package:totem/core/services/preferences_service.dart';
import 'package:totem/features/home/presentation/pages/home_page.dart';
import 'package:totem/features/calendar/presentation/pages/calendar_detail_page.dart';
import 'package:totem/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:totem/features/weather/presentation/pages/weather_detail_page.dart';
import 'package:totem/features/rss/presentation/pages/rss_detail_page.dart';

GoRouter createAppRouter() => GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final onboardingDone = getIt<PreferencesService>().isOnboardingCompleted();
    if (!onboardingDone && state.uri.toString() != '/onboarding') {
      return '/onboarding';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/calendar',
      name: 'calendar',
      builder: (context, state) => const CalendarDetailPage(),
    ),
    GoRoute(
      path: '/weather',
      name: 'weather',
      builder: (context, state) => const WeatherDetailPage(),
    ),
    GoRoute(
      path: '/rss',
      name: 'rss',
      builder: (context, state) => const RssDetailPage(),
    ),
  ],
);
