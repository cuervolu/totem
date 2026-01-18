enum OnboardingStage {
  welcome,
  configuration, 
  ready,
}
sealed class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingInProgress extends OnboardingState {
  final OnboardingStage stage;
  final bool hasInternet;
  final bool locationConfigured;
  final String? mascotName; 

  OnboardingInProgress({
    required this.stage,
    required this.hasInternet,
    this.locationConfigured = false,
    this.mascotName,
  });

  OnboardingInProgress copyWith({
    OnboardingStage? stage,
    bool? hasInternet,
    bool? locationConfigured,
    String? mascotName,
  }) {
    return OnboardingInProgress(
      stage: stage ?? this.stage,
      hasInternet: hasInternet ?? this.hasInternet,
      locationConfigured: locationConfigured ?? this.locationConfigured,
      mascotName: mascotName ?? this.mascotName,
    );
  }
}

class OnboardingComplete extends OnboardingState {}
