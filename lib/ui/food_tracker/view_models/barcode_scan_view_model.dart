import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/utils/providers.dart';

/// Represents the state of a barcode scan: idle, loading, data, or error.
class BarcodeScanState {
  final String? barcode;
  final FoodProductEntity? foodProduct;
  final bool isLoading;
  final String? errorMessage;

  const BarcodeScanState({
    this.barcode,
    this.foodProduct,
    this.isLoading = false,
    this.errorMessage,
  });

  BarcodeScanState copyWith({
    String? barcode,
    FoodProductEntity? foodProduct,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BarcodeScanState(
      barcode: barcode ?? this.barcode,
      foodProduct: foodProduct ?? this.foodProduct,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  factory BarcodeScanState.initial() => const BarcodeScanState(isLoading: false);
}

/// ViewModel to manage barcode scanning and food product fetching
class BarcodeScanViewModel extends AsyncNotifier<BarcodeScanState> {
  @override
  FutureOr<BarcodeScanState> build() {
    return BarcodeScanState.initial();
  }

  /// Starts loading, fetches the food by barcode, and updates the state accordingly.
  Future<void> scanBarcode(String barcode) async {
    state = const AsyncValue.loading();
    final foodService = ref.read(foodServiceProvider);
    try {
      final product = await foodService.getFoodProductByBarcode(barcode);
      if (product == null) {
        state = AsyncValue.data(
          BarcodeScanState(
            barcode: barcode,
            foodProduct: null,
            isLoading: false,
            errorMessage: 'No product found for barcode.',
          ),
        );
      } else {
        state = AsyncValue.data(
          BarcodeScanState(
            barcode: barcode,
            foodProduct: product,
            isLoading: false,
            errorMessage: null,
          ),
        );
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

}

final barcodeScanViewModelProvider =
    AsyncNotifierProvider.autoDispose<BarcodeScanViewModel, BarcodeScanState>(BarcodeScanViewModel.new);

