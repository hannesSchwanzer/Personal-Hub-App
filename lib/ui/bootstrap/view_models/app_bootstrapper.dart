import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// AsyncNotifier handles app bootstrapping (e.g., seeding built-in data).
class AppBootstrapper extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    final seeder = ref.read(builtInMeditationSeederProvider);
    await seeder.seedIfNeeded();
  }
}

/// Riverpod provider for AppBootstrapper.
/// Usage: ref.watch(appBootstrapperProvider)
final appBootstrapperProvider =
    AsyncNotifierProvider<AppBootstrapper, void>(AppBootstrapper.new);


