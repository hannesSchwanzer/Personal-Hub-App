import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:personal_hub_app/ui/cooking/widgets/recipe_nutrition_widget.dart';
import 'package:personal_hub_app/ui/food_tracker/ui_models/food_search_result.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/barcode_scan_view_model.dart';
import 'package:personal_hub_app/ui/food_tracker/widgets/quantity_input_widget.dart';

/// Barcode Scan Screen that allows scanning and fetching food info from barcode.
class BarcodeScanScreen extends ConsumerStatefulWidget {
  const BarcodeScanScreen({super.key});

  @override
  ConsumerState<BarcodeScanScreen> createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends ConsumerState<BarcodeScanScreen> {
  final TextEditingController _quantityController = TextEditingController();
  bool _isQuantityValid = false;

  @override
  void initState() {
    super.initState();
    _quantityController.addListener(_validateQuantity);
  }

  @override
  void dispose() {
    _quantityController.removeListener(_validateQuantity);
    _quantityController.dispose();
    super.dispose();
  }

  /// Validates that the quantity field is not empty and is a valid number.
  void _validateQuantity() {
    final text = _quantityController.text;
    final isValid = text.isNotEmpty && num.tryParse(text) != null;
    if (_isQuantityValid != isValid) {
      setState(() {
        _isQuantityValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(barcodeScanViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Food Barcode')),
      body: Center(
        child: state.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                error.toString(),
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            );
          },
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => _BarcodeScannerDialog(
                      onScanned: (barcode) {
                        if (barcode != null) {
                          ref
                              .read(barcodeScanViewModelProvider.notifier)
                              .scanBarcode(barcode);
                        }
                      },
                    ),
                  );
                },
                child: const Text('Scan Barcode'),
              ),
              const SizedBox(height: 24),
              if (data.barcode != null) ...[
                Text(
                  'Barcode: ${data.barcode}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
              if (data.errorMessage != null) ...[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    data.errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              if (data.foodProduct != null) ...[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Food Name: ${data.foodProduct!.name}\n' // You can expand to show more fields
                    'Brand: ${data.foodProduct!.brand}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: NutritionDisplayWidget(nutrition: data.foodProduct!.nutrition),
                ),
                // Quantity input field and Done button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: QuantityInputWidget(
                                    controller: _quantityController,
                                    unitAbbreviation: data.foodProduct!.nutrition.quantityUnit?.abbreviation ?? 'unit',
                                    isValid: _isQuantityValid,
                                    onChanged: (text) => _validateQuantity(),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _isQuantityValid
                      ? () {
                          Navigator.of(context).pop(
                            FoodSearchResult(
                              foodProduct: data.foodProduct,
                              quantity: double.parse(_quantityController.text),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Done'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Dialog widget for barcode scanning using mobile_scanner
class _BarcodeScannerDialog extends StatefulWidget {
  final void Function(String? barcode) onScanned;

  const _BarcodeScannerDialog({required this.onScanned});

  @override
  State<_BarcodeScannerDialog> createState() => _BarcodeScannerDialogState();
}

class _BarcodeScannerDialogState extends State<_BarcodeScannerDialog> {
  bool _scanned = false;

  void _handleScanned(String? code) {
    if (!_scanned && code != null && code.isNotEmpty) {
      _scanned = true;
      Navigator.of(context).pop();
      widget.onScanned(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Scan Barcode'),
      content: SizedBox(
        width: 300,
        height: 400,
        child: MobileScanner(
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            if (barcodes.isNotEmpty) {
              final code = barcodes.first.rawValue;
              _handleScanned(code);
            }
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onScanned(null);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
