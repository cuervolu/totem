import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/core/database/database.dart';
import 'package:totem/core/weather/models/weather_alert.dart';
import 'package:totem/core/weather/weather_alert_evaluator.dart';
import 'package:totem/core/weather/weather_theme_helper.dart';
import 'package:totem/features/home/presentation/widgets/weather_particles.dart';
import 'package:totem/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:totem/features/weather/presentation/cubit/weather_state.dart';

class WeatherWidget extends StatelessWidget {
  final VoidCallback onClick;
  final double? height;

  const WeatherWidget({super.key, required this.onClick, this.height});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return switch (state) {
          WeatherInitial() => _buildLoading(context),
          WeatherLoading(:final cachedData) =>
            cachedData != null
                ? _buildContent(context, cachedData)
                : _buildLoading(context),
          WeatherSuccess(:final current) => _buildContent(context, current),
          WeatherError(:final cachedData, :final message) =>
            cachedData != null
                ? _buildContent(context, cachedData, error: message)
                : _buildError(context, message),
        };
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    WeatherCacheData data, {
    String? error,
  }) {
    final theme = Theme.of(context);
    final temp = data.currentTemp.round();
    final feelsLike = data.feelsLike.round();
    final shouldShowFeelsLike = (data.currentTemp - data.feelsLike).abs() > 3;
    final alert = WeatherAlertEvaluator.evaluate(data);

    return FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            gradient: WeatherThemeHelper.getGradient(data.weatherCode),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              if (WeatherThemeHelper.shouldShowParticles(data.weatherCode))
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: WeatherParticles(
                      type: WeatherThemeHelper.getParticleType(
                        data.weatherCode,
                      ),
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Pulse(
                          infinite: true,
                          duration: const Duration(seconds: 2),
                          child: Icon(
                            _getWeatherIcon(data.weatherCode),
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Clima',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        if (error != null) ...[
                          const SizedBox(width: 8),
                          Icon(
                            Icons.warning_amber,
                            size: 16,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ],
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$temp°',
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data.condition,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (shouldShowFeelsLike)
                          _WeatherDetail(
                            label: 'Sensación',
                            value: '$feelsLike°',
                          ),
                        _WeatherDetail(
                          label: 'Humedad',
                          value: '${data.humidity}%',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              if (alert.level != WeatherAlertLevel.normal)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Flash(
                    infinite: alert.level == WeatherAlertLevel.extreme,
                    duration: const Duration(seconds: 2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _getAlertColor(alert.level, theme),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        alert.badge,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getAlertColor(WeatherAlertLevel level, ThemeData theme) {
    return switch (level) {
      WeatherAlertLevel.extreme => const Color(0xFFD32F2F),
      WeatherAlertLevel.warning => const Color(0xFFF57C00),
      WeatherAlertLevel.normal => Colors.transparent,
    };
  }

  Widget _buildLoading(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: CircularProgressIndicator(color: theme.colorScheme.onPrimary),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: theme.colorScheme.onErrorContainer,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getWeatherIcon(int code) {
    return switch (code) {
      0 => Icons.wb_sunny,
      1 || 2 => Icons.wb_cloudy,
      3 => Icons.cloud,
      >= 51 && <= 67 => Icons.water_drop,
      >= 71 && <= 86 => Icons.ac_unit,
      >= 95 => Icons.thunderstorm,
      _ => Icons.cloud_queue,
    };
  }
}

class _WeatherDetail extends StatelessWidget {
  final String label;
  final String value;

  const _WeatherDetail({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}
