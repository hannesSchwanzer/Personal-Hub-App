import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// ViewModel for handling food search and fetching full product info.
class FoodSearchViewModel extends AsyncNotifier<FoodProductEntity?> {
  @override
  FutureOr<FoodProductEntity?> build() async {
    // Empty at start—wait for user selection
    return null;
  }

  /// Fetches product by id and updates state
  Future<void> fetchProductById(String id) async {
    state = const AsyncLoading();
    final foodService = ref.read(foodServiceProvider);
    state = await AsyncValue.guard(() async {
      return await foodService.getFoodProductById(id);
    });
  }

  /// Reset to empty state (for clearing selection)
  void clear() => state = const AsyncData(null);
}

final foodSearchViewModelProvider = AsyncNotifierProvider<FoodSearchViewModel, FoodProductEntity?>(() => FoodSearchViewModel());

