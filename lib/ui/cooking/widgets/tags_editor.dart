import 'package:flutter/material.dart';

/// Widget for editing a list of tags with autocomplete using Flutter's Autocomplete.
/// Displays entered tags as chips and provides suggestions in an overlay.
class TagsEditor extends StatefulWidget {
  final List<String> initialTags;
  final ValueChanged<List<String>> onTagsChanged;
  final List<String> tagRecommendations;

  /// Widget for editing a list of tags.
  /// - Chips are always rounded.
  /// - A + button appears instead of the persistent text field.
  /// - On clicking +, a chip appears with a text field for editing.
  /// - Suggestions/autocomplete are preserved.
  const TagsEditor({
    super.key,
    required this.initialTags,
    required this.onTagsChanged,
    required this.tagRecommendations,
  });

  @override
  State<TagsEditor> createState() => _TagsEditorState();
}

class _TagsEditorState extends State<TagsEditor> {
  late List<String> _tags;
  String? _editingTag;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _tags = List.of(widget.initialTags);
  }

  void _startAddingTag() {
    setState(() {
      _editingTag = '';
      _controller.clear();
    });
    FocusScope.of(context).requestFocus(_focusNode);
  }

  void _commitTag([String? value]) {
    String tag = value ?? _controller.text;
    tag = tag.trim();
    if (tag.isEmpty || _tags.contains(tag)) {
      setState(() => _editingTag = null);
      _controller.clear();
      return;
    }
    setState(() {
      _tags.add(tag);
      _editingTag = null;
      _controller.clear();
    });
    widget.onTagsChanged(_tags);
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
    widget.onTagsChanged(_tags);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        ..._tags.map((tag) => Chip(
              label: Text(tag),
              onDeleted: () => _removeTag(tag),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )),
        if (_editingTag != null)
          SizedBox(
            width: 120,
            child: RawAutocomplete<String>(
              focusNode: _focusNode,
              textEditingController: _controller,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return widget.tagRecommendations
                    .where((option) => option
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase()))
                    .where((t) => !_tags.contains(t));
              },
              displayStringForOption: (option) => option,
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController fieldTextEditingController,
                FocusNode fieldFocusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  label: SizedBox(
                    width: 90,
                    child: TextField(
                      autofocus: true,
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Tag',
                      ),
                      onSubmitted: (val) => _commitTag(val),
                      onEditingComplete: _commitTag,
                    ),
                  ),
                );
              },
              optionsViewBuilder: (
                BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options,
              ) {
                if (options.isEmpty) return const SizedBox.shrink();
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final String option = options.elementAt(index);
                          return ListTile(
                            title: Text(option),
                            onTap: () {
                              _controller.text = option;
                              _commitTag(option);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              onSelected: (String selection) {
                _controller.text = selection;
                _commitTag(selection);
              },
            ),
          ),
        if (_editingTag == null)
          ActionChip(
            avatar: const Icon(Icons.add, size: 20, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            label: const Text('Add', style: TextStyle(color: Colors.white)),
            onPressed: _startAddingTag,
          ),
      ],
    );
  }
}

