import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_state.dart';

class StageConnectivity extends StatelessWidget {
  const StageConnectivity({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final hasInternet = state is OnboardingInProgress && state.hasInternet;
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center, 
                children: [
                  Icon(
                    hasInternet ? Icons.wifi : Icons.wifi_off_rounded,
                    size: 120,
                    color: hasInternet
                        ? theme.colorScheme.primary
                        : theme.colorScheme.error,
                  ),
                  const SizedBox(height: 32),

                  Text(
                    hasInternet
                        ? "Conexión Establecida"
                        : "Sin conexión a Internet",
                    style: theme.textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      hasInternet
                          ? "Puedo actualizar datos en tiempo real."
                          : "Necesito internet para mostrarte noticias y clima.",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 64),

                  ElevatedButton(
                    onPressed: hasInternet
                        ? () => context.read<OnboardingCubit>().nextStage()
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(240, 80),
                      backgroundColor: hasInternet
                          ? null
                          : theme.colorScheme.surfaceContainerHighest,
                    ),
                    child: Text(
                      hasInternet ? "Continuar" : "Esperando red...",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
