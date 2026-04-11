import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/ui/bootstrap/view_models/app_bootstrapper.dart';
import 'package:personal_hub_app/ui/core/screens/error_screen.dart';
import 'package:personal_hub_app/ui/core/screens/splash_screen.dart';
import 'package:personal_hub_app/ui/hub/widgets/hub_view.dart';

class BootstrapperView extends ConsumerWidget {
  const BootstrapperView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bootstrapState = ref.watch(appBootstrapperProvider);

    return bootstrapState.when(
      loading: () => const SplashScreen(),
      error: (e, st) => ErrorScreen(error: e),
      data: (bootstrapState) {
        // When status is "done", show HubView
        if (bootstrapState.step == BootstrapStep.done) {
          return const HubView();
        }
        // Otherwise, show SplashScreen with message
        return SplashScreen(
          statusMessage: bootstrapState.message,
        );
      },
    );
  }
}
