import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';
import 'package:personal_hub_app/ui/food_tracker/view_models/barcode_scan_view_model.dart';

/// Widget for scanning & selecting food via barcode (no quantity)
class BarcodeSelector extends ConsumerStatefulWidget {
  final ValueChanged<FoodProductEntity?> onFoodSelected;
  const BarcodeSelector({super.key, required this.onFoodSelected});
  @override
  ConsumerState<BarcodeSelector> createState() => _BarcodeSelectorState();
}

class _BarcodeSelectorState extends ConsumerState<BarcodeSelector> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(barcodeScanViewModelProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () async {
            await showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => _BarcodeScannerDialog(
                onScanned: (barcode) {
                  if (barcode != null) {
                    ref.read(barcodeScanViewModelProvider.notifier).scanBarcode(barcode);
                  } else {
                    widget.onFoodSelected(null);
                  }
                },
              ),
            );
          },
          child: const Text('Scan Barcode'),
        ),
        const SizedBox(height: 24),
        state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          data: (data) {
            if (data.errorMessage != null) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  data.errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            }
            if (data.foodProduct != null) {
              widget.onFoodSelected(data.foodProduct!);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food Name: ${data.foodProduct!.name}\nBrand: ${data.foodProduct!.brand}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

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

