import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/features/home/presentation/widgets/totem_mascot.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class StageWelcome extends StatefulWidget {
  const StageWelcome({super.key});

  @override
  State<StageWelcome> createState() => _StageWelcomeState();
}

class _StageWelcomeState extends State<StageWelcome> {
  final _nameController = TextEditingController();
  bool _showNameInput = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _showNameInput = true);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100, width: 100, child: TotemMascot()),

              const SizedBox(height: 24),

              Text(
                'Soy tu Tótem',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                'Tu compañero de escritorio para clima, noticias y agenda',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              if (_showNameInput) ...[
                SizedBox(
                  width: 380,
                  child: TextField(
                    controller: _nameController,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                    decoration: InputDecoration(
                      hintText: '¿Cómo quieres llamarme?',
                      filled: true,
                      fillColor: theme.colorScheme.surfaceContainerHighest,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text.trim();
                    if (name.isNotEmpty) {
                      context.read<OnboardingCubit>().setMascotName(name);
                    }
                    context.read<OnboardingCubit>().nextStage();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(180, 56),
                  ),
                  child: Text('Continuar', style: theme.textTheme.titleLarge),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
