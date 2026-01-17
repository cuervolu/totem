import 'package:go_router/go_router.dart';
import 'package:totem/features/home/presentation/pages/home_page.dart';
import 'package:totem/features/calendar/presentation/pages/calendar_detail_page.dart';
import 'package:totem/features/weather/presentation/pages/weather_detail_page.dart';
import 'package:totem/features/rss/presentation/pages/rss_detail_page.dart';

GoRouter createAppRouter() => GoRouter(
  initialLocation: '/',
  routes: [
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
