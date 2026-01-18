import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class StageReady extends StatelessWidget {
  const StageReady({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.4),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Icon(
              Icons.check_rounded,
              size: 80,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            "¡Todo Listo!",
            style: theme.textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Tu dashboard está preparado.",
            style: theme.textTheme.headlineSmall,
          ),
          const Spacer(),

          ElevatedButton(
            onPressed: () => context.read<OnboardingCubit>().complete(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(280, 90),
              backgroundColor: theme.colorScheme.primaryContainer,
              foregroundColor: theme.colorScheme.onPrimaryContainer,
              elevation: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Empezar",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.arrow_forward_rounded, size: 32),
              ],
            ),
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
