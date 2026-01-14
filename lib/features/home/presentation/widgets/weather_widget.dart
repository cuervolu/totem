import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final VoidCallback onClick;
  final double? height;

  const WeatherWidget({super.key, required this.onClick, this.height});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const temp = 32;
    const condition = 'Soleado';
    const feelsLike = 35;
    const humidity = 45;

    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.cloud,
                      size: 28,
                      color: theme.colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Clima',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$temp°',
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      condition,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _WeatherDetail(label: 'Sensación', value: '$feelsLike°'),
                    _WeatherDetail(label: 'Humedad', value: '$humidity%'),
                  ],
                ),
              ],
            ),
            if (temp > 30)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '⚠️ CALOR',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onError,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
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
          style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}
