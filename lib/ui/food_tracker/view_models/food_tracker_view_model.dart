import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/domain/entities/food/food_tracking_entity.dart';
import 'package:personal_hub_app/domain/entities/food/nutrition_entity.dart';
import 'package:personal_hub_app/utils/providers.dart';

class FoodTrackerState {
  final List<FoodTrackingEntity> todayTrackings;
  final NutritionEntity totalNutrition;

  FoodTrackerState({required this.todayTrackings, required this.totalNutrition});
}

/// ViewModel for food tracking screen, provides today's food tracking entries and macro summary.
class FoodTrackerViewModel extends AsyncNotifier<FoodTrackerState> {
  @override
  FutureOr<FoodTrackerState> build() async {
    return await _loadToday();
  }

  /// Adds a new food tracking entry from a scanned product and quantity.
  /// Calls the repository to persist the entry and refreshes today's list after success.
  Future<void> addFoodEntryFromProduct({
    required FoodProductEntity product,
    required double quantity,
  }) async {
    print("Adding food entry for product ${product.name} with quantity $quantity");
    final repo = ref.read(foodTrackingRepositoryProvider);
    final entity = FoodTrackingEntity(
      id: "",
      name: product.name,
      nutrition: product.nutrition,
      trackedAt: DateTime.now(),
      quantity: quantity,
      source: FoodTrackingSource.product,
      referenceId: product.id,
    );
    await repo.insertFoodTracking(entity);
    await refresh();
  }

  Future<FoodTrackerState> _loadToday() async {
    final date = DateTime.now();
    final entries = await ref.watch(foodTrackingRepositoryProvider).getFoodTrackingsForDate(date);
    final totalNutrition = _sumNutrition(entries);
    return FoodTrackerState(todayTrackings: entries, totalNutrition: totalNutrition);
  }

  NutritionEntity _sumNutrition(List<FoodTrackingEntity> entries) {
    // Uses operator+ if available, else manually sum macros
    NutritionEntity sum = NutritionEntity();
    for (var e in entries) {
      sum = sum + e.totalNutrition;
    }
    return sum;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadToday());
  }

  /// Deletes a food entry by its id and refreshes the tracked list.
  Future<void> deleteFoodEntry(String id) async {
    final repo = ref.read(foodTrackingRepositoryProvider);
    await repo.deleteFoodTracking(id);
    await refresh();
  }
}

final foodTrackerViewModelProvider = AsyncNotifierProvider<FoodTrackerViewModel, FoodTrackerState>(() {
  return FoodTrackerViewModel();
});

