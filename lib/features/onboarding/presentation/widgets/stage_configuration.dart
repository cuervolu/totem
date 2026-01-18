import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/core/location/models/location_data.dart';
import 'package:totem/features/location/presentation/widgets/address_search_widget.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_state.dart';

class StageConfiguration extends StatelessWidget {
  const StageConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final hasInternet = state is OnboardingInProgress && state.hasInternet;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: hasInternet
                          ? theme.colorScheme.primaryContainer.withValues(
                              alpha: 0.3,
                            )
                          : theme.colorScheme.errorContainer.withValues(
                              alpha: 0.3,
                            ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          hasInternet ? Icons.wifi : Icons.wifi_off,
                          size: 20,
                          color: hasInternet
                              ? theme.colorScheme.primary
                              : theme.colorScheme.error,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          hasInternet ? 'Conectado' : 'Sin conexión',
                          style: theme.textTheme.titleSmall,
                        ),
                        if (!hasInternet) ...[
                          const SizedBox(width: 6),
                          Tooltip(
                            message: 'Clima y noticias requieren internet',
                            child: Icon(
                              Icons.info_outline,
                              size: 14,
                              color: theme.colorScheme.onErrorContainer,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Icon(
                    Icons.location_on_outlined,
                    size: 48,
                    color: theme.colorScheme.secondary,
                  ),

                  const SizedBox(height: 8),

                  Text('¿Dónde estás?', style: theme.textTheme.headlineMedium),

                  const SizedBox(height: 4),

                  Text(
                    'Necesario para mostrar el clima local',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: theme.colorScheme.surfaceContainerLow,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: AddressSearchWidget(
                          onLocationSelected: (LocationData loc) {
                            context
                                .read<OnboardingCubit>()
                                .markLocationConfigured();
                            context.read<OnboardingCubit>().nextStage();
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextButton(
                    onPressed: () => context
                        .read<OnboardingCubit>()
                        .skipLocationConfiguration(),
                    child: const Text('Configurar después'),
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
