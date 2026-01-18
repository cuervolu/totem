import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class StageIdentity extends StatefulWidget {
  const StageIdentity({super.key});

  @override
  State<StageIdentity> createState() => _StageIdentityState();
}

class _StageIdentityState extends State<StageIdentity> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onContinue(BuildContext context) {
    if (_nameController.text.isNotEmpty) {
      context.read<OnboardingCubit>().setMascotName(_nameController.text);
    }
    context.read<OnboardingCubit>().nextStage();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.smart_toy,
                size: 100,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 32),

              Text(
                "Soy tu Tótem",
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  "Tu compañero de escritorio para mantenerte informado sin interrumpir tu flujo.",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 450,
                child: TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "¿Cómo quieres llamarme?",
                    filled: true,
                    fillColor: theme.colorScheme.surfaceContainerHighest,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 28,
                      horizontal: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () => _onContinue(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(260, 88),
                  elevation: 4,
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                ),
                child: Text(
                  "Mucho gusto",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
