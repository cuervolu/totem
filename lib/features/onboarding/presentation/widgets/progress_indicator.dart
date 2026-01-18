import 'package:flutter/material.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  final OnboardingStage currentStage;

  const OnboardingProgressIndicator({super.key, required this.currentStage});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = OnboardingStage.values.length;
    final current = currentStage.index;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final isActive = index <= current;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 32 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
