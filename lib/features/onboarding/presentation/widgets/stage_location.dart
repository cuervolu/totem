import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:totem/core/location/models/location_data.dart';
import 'package:totem/features/location/presentation/widgets/address_search_widget.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class StageLocation extends StatelessWidget {
  const StageLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<OnboardingCubit>();
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(48, 24, 48, 24),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 64,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(height: 16),
              Text(
                "¿Dónde estás?",
                style: theme.textTheme.displaySmall,
                textAlign:
                    TextAlign.center, 
              ),
              const SizedBox(height: 8),
              Text(
                "Necesario solo para el widget del clima. Se guarda localmente.",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  width: double
                      .infinity, 
                  child: Card(
                    elevation: 0,
                    color: theme.colorScheme.surfaceContainerLow,
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: AddressSearchWidget(
                        onLocationSelected: (LocationData loc) {
                          cubit.markLocationConfigured();
                          cubit.nextStage();
                        },
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              TextButton(
                onPressed: () => cubit.skipLocationConfiguration(),
                style: TextButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  foregroundColor: theme.colorScheme.secondary,
                ),
                child: Text(
                  "Configurar después",
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
