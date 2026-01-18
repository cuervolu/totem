import 'package:flutter/material.dart';

class StageWelcome extends StatelessWidget {
  const StageWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.smart_toy_outlined,
              size: 100,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            'HOLA',
            style: theme.textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: 4.0,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: theme.colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
