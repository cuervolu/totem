import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class StageFeatures extends StatelessWidget {
  const StageFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text("Lo que haré por ti", style: theme.textTheme.displaySmall),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _FeatureCard(
                icon: Icons.calendar_month_rounded,
                label: "Agenda",
                color: Colors.blueAccent,
              ),
              _FeatureCard(
                icon: Icons.wb_sunny_rounded,
                label: "Clima",
                color: Colors.orangeAccent,
              ),
              _FeatureCard(
                icon: Icons.rss_feed_rounded,
                label: "Noticias",
                color: Colors.greenAccent,
              ),
            ],
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: () => context.read<OnboardingCubit>().nextStage(),
            style: ElevatedButton.styleFrom(minimumSize: const Size(240, 80)),
            child: Text("Entendido", style: theme.textTheme.headlineSmall),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Icon(icon, size: 64, color: color),
        ),
        const SizedBox(height: 16),
        Text(
          label,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
