import 'package:flutter/material.dart';
import 'package:totem/core/utils/platform_utils.dart';
import 'package:totem/features/home/presentation/widgets/calendar_widget.dart';
import 'package:totem/features/home/presentation/widgets/weather_widget.dart';
import 'package:totem/features/home/presentation/widgets/rss_widget.dart';

class HomeGridView extends StatelessWidget {
  final VoidCallback onCalendarClick;
  final VoidCallback onWeatherClick;
  final VoidCallback onRssClick;

  const HomeGridView({
    super.key,
    required this.onCalendarClick,
    required this.onWeatherClick,
    required this.onRssClick,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        CalendarWidget(height: 250, onClick: onCalendarClick),
        const SizedBox(height: 16),
        WeatherWidget(height: 220, onClick: onWeatherClick),
        const SizedBox(height: 16),
        RssWidget(onClick: onRssClick),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      children: [
        SizedBox(
          height: 380,
          child: Row(
            children: [
              Expanded(child: CalendarWidget(onClick: onCalendarClick)),
              const SizedBox(width: 24),
              Expanded(child: WeatherWidget(onClick: onWeatherClick)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        RssWidget(onClick: onRssClick),
      ],
    );
  }
}
