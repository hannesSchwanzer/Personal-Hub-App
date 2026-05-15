import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/food_tracking_entity.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/utils/providers.dart';

class FoodTrackerState {
  final List<FoodTrackingEntity> todayTrackings;
  final NutritionEntity totalNutrition;

  FoodTrackerState({
    required this.todayTrackings,
    required this.totalNutrition,
  });
}

/// ViewModel for food tracking screen, provides today's food tracking entries and macro summary.
class FoodTrackerViewModel extends AsyncNotifier<FoodTrackerState> {
  FoodTrackerViewModel(this.selectedDate);
  final DateTime selectedDate;

  @override
  FutureOr<FoodTrackerState> build() {
    final entriesAsync = ref.watch(foodTrackingsForDateProvider(selectedDate));
    return entriesAsync.maybeWhen(
      data: (entries) {
        return FoodTrackerState(
          todayTrackings: entries,
          totalNutrition: _sumNutrition(entries),
        );
      },
      orElse: () => throw const AsyncLoading(),
    );
  }

  NutritionEntity _sumNutrition(List<FoodTrackingEntity> entries) {
    NutritionEntity sum = NutritionEntity();
    for (var e in entries) {
      sum = sum + e.totalNutrition;
    }
    return sum;
  }

  /// Deletes a food entry by its id. The UI will update reactively.
  Future<void> deleteFoodEntry(String id) async {
    final repo = ref.read(foodTrackingRepositoryProvider);
    await repo.deleteFoodTracking(id);
    // No need to manually refresh, UI updates from Flow
  }
}

final foodTrackerViewModelProvider =
  AsyncNotifierProvider.autoDispose.family<FoodTrackerViewModel, FoodTrackerState, DateTime>(
    FoodTrackerViewModel.new,
  );
