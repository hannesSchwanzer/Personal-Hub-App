import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';
import 'package:personal_hub_app/ui/right_in_the_feels/widgets/body_map_painter.dart';
import 'package:personal_hub_app/utils/asset_loader.dart';

class BodyMapViewer extends StatefulWidget {
  final List<Stroke> strokes;

  const BodyMapViewer({super.key, required this.strokes});

  @override
  State<BodyMapViewer> createState() => _BodyMapViewerState();
}

class _BodyMapViewerState extends State<BodyMapViewer> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    _image = await loadBodyMapImage();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (_image == null) return const SizedBox.shrink();

        return CustomPaint(
          painter: BodyMapPainter(
            strokes: widget.strokes,
            bodyImage: _image!,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

