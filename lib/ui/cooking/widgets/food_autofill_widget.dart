import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_hub_app/utils/providers.dart';
import 'package:personal_hub_app/domain/entities/food/food_entities.dart';

/// Signature for when an item is selected and query submitted.
typedef FoodAutofillSelectionCallback = void Function(FoodAutoFillEntity? selected, String inputText);

/// A text input widget with autocomplete food suggestions from the backend.
class FoodAutofillWidget extends ConsumerStatefulWidget {
  /// Callback when a suggestion is selected or input submitted
  final FoodAutofillSelectionCallback onSelected;

  /// Optional label for the input field
  final String? labelText;

  /// Optional prefilled value
  final String? initialValue;

  const FoodAutofillWidget({
    Key? key,
    required this.onSelected,
    this.labelText,
    this.initialValue,
  }) : super(key: key);

  @override
  ConsumerState<FoodAutofillWidget> createState() => _FoodAutofillWidgetState();
}

class _FoodAutofillWidgetState extends ConsumerState<FoodAutofillWidget> {
  final TextEditingController _controller = TextEditingController();
  Future<List<FoodAutoFillEntity>> Function(String)? _searchFunction;
  FoodAutoFillEntity? _selectedItem;

  @override
  void initState() {
    super.initState();
    if(widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final foodService = ref.watch(foodServiceProvider);
    _searchFunction = (String value) async {
      if (value.trim().isEmpty) return [];
      return await foodService.searchFood(value);
    };

    return Autocomplete<FoodAutoFillEntity>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text.isEmpty) return const [];
        return await _searchFunction!(textEditingValue.text);
      },
      displayStringForOption: (item) => item.name,
      fieldViewBuilder: (ctx, controller, focusNode, onFieldSubmitted) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: widget.labelText ?? 'Search food',
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) {
            setState(() {
              _selectedItem = null;
            });
          },
          onSubmitted: (value) {
            widget.onSelected(_selectedItem, value);
          },
        );
      },
      onSelected: (FoodAutoFillEntity selection) {
        setState(() {
          _selectedItem = selection;
          _controller.text = selection.name;
        });
        widget.onSelected(selection, selection.name);
      },
      optionsViewBuilder: (ctx, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (ctx, idx) {
                final option = options.elementAt(idx);
                return ListTile(
                  key: ValueKey(option.id),
                  onTap: () => onSelected(option),
                  title: Text(option.name),
                  subtitle: Text(option.type.name),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

