import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/view_models/body_map_editor_view_model.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/body_map_painter.dart';
import 'package:personal_hub_app/utils/asset_loader.dart';
import 'package:personal_hub_app/utils/image_utils.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BodyMapEditor extends StatefulWidget {
  final BodyMapDrawing? initialDrawing;
  final Function(BodyMapDrawing) onChanged;

  const BodyMapEditor({
    super.key,
    this.initialDrawing,
    required this.onChanged,
  });

  @override
  State<BodyMapEditor> createState() => _BodyMapEditorState();
}

class _BodyMapEditorState extends State<BodyMapEditor> {
  late BodyMapEditorViewModel viewModel;
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    viewModel = BodyMapEditorViewModel(widget.initialDrawing);
    _loadImage();
  }

  Future<void> _loadImage() async {
    _image = await loadBodyMapImage();
    setState(() {});
  }

  bool showColorPicker = false;
  bool showStrokeSelector = false;

  void _closeSelectors() {
    if (showColorPicker || showStrokeSelector) {
      setState(() {
        showColorPicker = false;
        showStrokeSelector = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final size = Size(constraints.maxWidth, constraints.maxHeight);

                    return AnimatedBuilder(
                      animation: viewModel,
                      builder: (_, _) {
                        if (_image == null) return const SizedBox.shrink();

                        final imageRect = calculateImageRect(size, _image!);

                        return GestureDetector(
                          // Close any open selectors on tap if open
                          onTapDown: (_) {
                            if (showColorPicker || showStrokeSelector) {
                              _closeSelectors();
                            }
                          },
                          onPanStart: (details) {
                            _closeSelectors();
                            viewModel.startStroke(details.localPosition, imageRect);
                          },
                          onPanUpdate: (details) {
                            viewModel.addPoint(details.localPosition, imageRect);
                          },
                          onPanEnd: (_) {
                            viewModel.endStroke();
                            widget.onChanged(viewModel.drawing);
                          },
                          child: CustomPaint(
                            painter: BodyMapPainter(
                              strokes: viewModel.strokes,
                              bodyImage: _image,
                            ),
                            size: Size.infinite,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              // Overlay controls as floating widgets
              if (showColorPicker)
                Positioned(
                  left: 32,
                  right: 32,
                  top: 48,
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: HueRingPicker(
                        pickerColor: Color(viewModel.selectedColor),
                        onColorChanged: (c) {
                          setState(() {
                            viewModel.setColor(c);
                          });
                        },
                        enableAlpha: false,
                        displayThumbColor: true,
                        portraitOnly: true,
                      ),
                    ),
                  ),
                ),
              if (showStrokeSelector)
                Positioned(
                  left: 32,
                  right: 32,
                  top: 48,
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.brush, size: 32),
                          Expanded(
                            child: Slider(
                              min: 2,
                              max: 18,
                              value: viewModel.strokeWidth,
                              onChanged: (v) {
                                setState(() {
                                  viewModel.strokeWidth = v;
                                });
                              },
                            ),
                          ),
                          Text(viewModel.strokeWidth.toStringAsFixed(0)),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        // Controls bar always at the bottom, never over the image!
        _BodyMapControls(
          selectedColor: Color(viewModel.selectedColor),
          strokeWidth: viewModel.strokeWidth,
          onColorChanged: viewModel.setColor,
          onStrokeWidthChanged: (v) {
            setState(() {
              viewModel.strokeWidth = v;
            });
          },
          onUndo: () {
            setState(() {
              viewModel.undo();
              widget.onChanged(viewModel.drawing);
            });
          },
          onClear: () {
            setState(() {
              viewModel.clear();
              widget.onChanged(viewModel.drawing);
            });
          },
          showColorPicker: showColorPicker,
          showStrokeSelector: showStrokeSelector,
          onShowColorPicker: () {
            setState(() {
              showColorPicker = !showColorPicker;
              if (showColorPicker) showStrokeSelector = false;
            });
          },
          onShowStrokeSelector: () {
            setState(() {
              showStrokeSelector = !showStrokeSelector;
              if (showStrokeSelector) showColorPicker = false;
            });
          },
        ),
      ],
    );
  }
}

/// Controls row for body map editor: stroke width, color picker, and clear button.
/// Color picker expands to a picker; stroke selector expands to a slider.
class _BodyMapControls extends StatelessWidget {
  final Color selectedColor;
  final double strokeWidth;
  final void Function(Color) onColorChanged;
  final void Function(double) onStrokeWidthChanged;
  final VoidCallback onUndo;
  final VoidCallback onClear;
  final bool showColorPicker;
  final bool showStrokeSelector;
  final VoidCallback onShowColorPicker;
  final VoidCallback onShowStrokeSelector;

  const _BodyMapControls({
    required this.selectedColor,
    required this.strokeWidth,
    required this.onColorChanged,
    required this.onStrokeWidthChanged,
    required this.onUndo,
    required this.onClear,
    required this.showColorPicker,
    required this.showStrokeSelector,
    required this.onShowColorPicker,
    required this.onShowStrokeSelector,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            tooltip: 'Color',
            onPressed: onShowColorPicker,
            icon: CircleAvatar(
              backgroundColor: selectedColor,
              child: const Icon(Icons.color_lens, color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            tooltip: 'Brush size',
            onPressed: onShowStrokeSelector,
            icon: Icon(Icons.brush,
                color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 12),
          IconButton(
            tooltip: 'Undo',
            onPressed: onUndo,
            icon: const Icon(Icons.undo),
          ),
          const SizedBox(width: 12),
          IconButton(
            tooltip: 'Clear',
            onPressed: onClear,
            icon: const Icon(Icons.clear),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

