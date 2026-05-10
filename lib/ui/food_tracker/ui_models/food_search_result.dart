/// Model representing the result of a food barcode search/scan.
///
/// Contains the found food product and the user-provided quantity.
class FoodSearchResult {
  /// The selected or scanned food product.
  final dynamic foodProduct; // Replace dynamic with actual FoodProduct type if available

  /// The quantity entered by the user corresponding to the food product.
  final double quantity;

  /// Constructs a [FoodSearchResult] with the given [foodProduct] and [quantity].
  const FoodSearchResult({required this.foodProduct, required this.quantity});
}

