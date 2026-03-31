import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';
import 'package:personal_hub_app/utils/image_utils.dart';

class BodyMapPainter extends CustomPainter {
  final List<Stroke> strokes;
  final ui.Image? bodyImage;

  BodyMapPainter({required this.strokes, required this.bodyImage});

  @override
  void paint(Canvas canvas, Size size) {
    if (bodyImage == null) return;

    final imageRect = calculateImageRect(size, bodyImage!);

    _drawStrokes(canvas, imageRect);
    _drawBodyOverlay(canvas, imageRect);
  }


  void _drawStrokes(Canvas canvas, Rect imageRect) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..color = Color(stroke.color)
        ..strokeWidth = stroke.getStrokeWidth(imageRect.width)
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;

      final path = Path();

      if (stroke.points.isEmpty) continue;

      final first = _scalePoint(stroke.points.first, imageRect);
      path.moveTo(first.dx, first.dy);

      for (int i = 1; i < stroke.points.length; i++) {
        final point = _scalePoint(stroke.points[i], imageRect);
        path.lineTo(point.dx, point.dy);
      }

      canvas.drawPath(path, paint);
    }
  }

  void _drawBodyOverlay(Canvas canvas, Rect rect) {
    final src = Rect.fromLTWH(
      0,
      0,
      bodyImage!.width.toDouble(),
      bodyImage!.height.toDouble(),
    );

    canvas.drawImageRect(bodyImage!, src, rect, Paint());
  }

  Offset _scalePoint(Point point, Rect rect) {
    return Offset(
      rect.left + point.x * rect.width,
      rect.top + point.y * rect.height,
    );
  }

  @override
  bool shouldRepaint(covariant BodyMapPainter oldDelegate) {
    return oldDelegate.strokes != strokes || oldDelegate.bodyImage != bodyImage;
  }
}
