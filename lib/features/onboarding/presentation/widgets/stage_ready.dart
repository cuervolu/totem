import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/features/home/presentation/widgets/calendar_widget.dart';
import 'package:totem/features/home/presentation/widgets/weather_widget.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class StageReady extends StatelessWidget {
  const StageReady({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Column(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 48,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                '¡Todo Listo!',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Así lucirá tu dashboard',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.outlineVariant,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(child: CalendarWidget(onClick: () {})),
                const SizedBox(width: 12),
                Expanded(child: WeatherWidget(onClick: () {})),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () => context.read<OnboardingCubit>().complete(),
            style: ElevatedButton.styleFrom(minimumSize: const Size(200, 56)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Empezar', style: theme.textTheme.titleLarge),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
