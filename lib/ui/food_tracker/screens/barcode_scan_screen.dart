import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:personal_hub_app/ui/cooking/widgets/recipe_nutrition_widget.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/barcode_scan_view_model.dart';

/// Barcode Scan Screen that allows scanning and fetching food info from barcode.
class BarcodeScanScreen extends ConsumerWidget {
  const BarcodeScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    'Brand: ${data.foodProduct!.brand ?? '-'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: NutritionDisplayWidget(nutrition: data.foodProduct!.nutrition),
                )
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
