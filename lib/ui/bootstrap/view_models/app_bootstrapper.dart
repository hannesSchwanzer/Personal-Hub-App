import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// AsyncNotifier handles app bootstrapping (e.g., seeding built-in data).
/// Status for each bootstrap phase.
enum BootstrapStep {
  readingMeditations,
  done,
}

/// Class holding detailed bootstrap state.
class AppBootstrapState {
  final BootstrapStep step;
  final String message;

  AppBootstrapState({required this.step, required this.message});
}

/// AsyncNotifier handles app bootstrapping (e.g., seeding built-in data).
class AppBootstrapper extends AsyncNotifier<AppBootstrapState> {
  @override
  Future<AppBootstrapState> build() async {
    state = AsyncLoading();
    // 1. Reading built-in meditations
    state = AsyncData(AppBootstrapState(
      step: BootstrapStep.readingMeditations,
      message: "Reading built-in meditations...",
    ));

    final seeder = ref.read(builtInMeditationSeederProvider);
    await seeder.seedIfNeeded();

    // 2. Done
    return AppBootstrapState(
      step: BootstrapStep.done,
      message: "Done loading.",
    );
  }
}

/// Riverpod provider for AppBootstrapper.
/// Usage: ref.watch(appBootstrapperProvider)
final appBootstrapperProvider =
    AsyncNotifierProvider<AppBootstrapper, AppBootstrapState>(AppBootstrapper.new);


