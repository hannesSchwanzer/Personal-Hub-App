import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/domain/entities/food/food_tracking_entity.dart';
import 'package:personal_hub_app/domain/entities/food/recipe_entity.dart';
import 'package:personal_hub_app/utils/providers.dart';

class FoodTrackerAddState {
  final FoodTrackingEntity? foodTrackingItem;
  final bool isSaving;
  final String? addResult;

  FoodTrackerAddState({
    this.foodTrackingItem,
    this.isSaving = false,
    this.addResult,
  });

  FoodTrackerAddState copyWith({
    FoodTrackingEntity? foodTrackingItem,
    bool? isSaving,
    String? addResult,
  }) {
    return FoodTrackerAddState(
      foodTrackingItem: foodTrackingItem ?? this.foodTrackingItem,
      isSaving: isSaving ?? this.isSaving,
      addResult: addResult ?? this.addResult,
    );
  }

  factory FoodTrackerAddState.initial() => FoodTrackerAddState();
}

/// ViewModel that manages the add food tracker UI state and saving logic.
class FoodTrackerAddViewModel extends Notifier<FoodTrackerAddState> {

  @override
  FoodTrackerAddState build() {
    return FoodTrackerAddState.initial();
  }
  
  void onRecipeSelected(RecipeEntity? value) {
    if (value != null) {
      final foodTrackingItem = FoodTrackingEntity(
        name: value.name,
        nutrition: value.nutritionInfo,
        trackedAt: DateTime.now(),
        quantity: state.foodTrackingItem == null ? 1 : state.foodTrackingItem!.quantity,
        source: FoodTrackingSource.recipe,
        referenceId: value.id,
      );
      state = state.copyWith(foodTrackingItem: foodTrackingItem);
    }
  }

  void onManualFoodSelected(CustomFoodEntity? value) {
    if (value != null) {
      final foodTrackingItem = FoodTrackingEntity(
        name: value.name,
        nutrition: value.nutrition,
        trackedAt: DateTime.now(),
        quantity: state.foodTrackingItem == null ? 1 : state.foodTrackingItem!.quantity,
        source: FoodTrackingSource.manual,
      );
      state = state.copyWith(foodTrackingItem: foodTrackingItem);
    }
  }

  void onProductSelected(FoodProductEntity? value) {
    if (value != null) {
      final foodTrackingItem = FoodTrackingEntity(
        name: value.name,
        nutrition: value.nutrition,
        trackedAt: DateTime.now(),
        quantity: state.foodTrackingItem == null ? 1 : state.foodTrackingItem!.quantity,
        source: FoodTrackingSource.product,
        referenceId: value.id,
      );
      state = state.copyWith(foodTrackingItem: foodTrackingItem);
    }
  }

  void onAmountChanged(String? value) {
    if (value != null && value.isNotEmpty) {
      final parsed = double.tryParse(value);
      final amount = parsed != null && parsed > 0 ? parsed : null;
      if (amount != null) {
        final updatedItem = state.foodTrackingItem?.copyWith(quantity: amount);
        state = state.copyWith(foodTrackingItem: updatedItem, addResult: null);
      } else {
        state = state.copyWith(addResult: "Please enter a valid number for amount.");
      }
    } else {
      state = state.copyWith(addResult: "Amount cannot be empty.");
    }
  }

  Future<void> saveFoodEntry() async {
    if (state.foodTrackingItem == null) {
      final addResult = "Please select a food and enter a valid amount.";
      state = state.copyWith(addResult: addResult);
      return;
    }

    state.copyWith(isSaving: true, addResult: null);
    try {
      final repo = ref.read(foodTrackingRepositoryProvider);
      await repo.insertFoodTracking(
        state.foodTrackingItem!,
      );
      state = FoodTrackerAddState(addResult: "Saved!");
    } catch (e) {
      state = FoodTrackerAddState(addResult: "Failed to save: $e");
    }
    state = state.copyWith(
      isSaving: false,
    );
  }

  void clearResult() {
    state = state.copyWith(addResult: null);
  }
}

final foodTrackerAddViewModelProvider =
    NotifierProvider.autoDispose<FoodTrackerAddViewModel, FoodTrackerAddState>(
  () => FoodTrackerAddViewModel(),
);
