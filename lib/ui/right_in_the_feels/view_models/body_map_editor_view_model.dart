import 'package:flutter/material.dart';
import 'package:personal_hub_app/domain/entities/body_map_drawing.dart';

class BodyMapEditorViewModel extends ChangeNotifier {
  final List<Stroke> _strokes = [];
  Stroke? _currentStroke;

  int selectedColor = Colors.red.toARGB32();
  double strokeWidth = 10.0;

  BodyMapEditorViewModel(BodyMapDrawing? initialDrawing) {
    if (initialDrawing != null) {
      _strokes.addAll(initialDrawing.strokes);
    }
  }

  List<Stroke> get strokes =>
      [..._strokes, ?_currentStroke];

  // Start a stroke, position is relative to imageRect
  void startStroke(Offset position, Rect imageRect) {
    final point = _normalize(position, imageRect);

    final normalizedWidth = strokeWidth / imageRect.width;

    _currentStroke = Stroke(
      points: [point],
      normalizedStrokeWidth: normalizedWidth.clamp(0.01, 1),
      color: selectedColor,
    );

    notifyListeners();
  }

  void addPoint(Offset position, Rect imageRect) {
    if (_currentStroke == null) return;

    final point = _normalize(position, imageRect);
    _currentStroke!.points.add(point);

    notifyListeners();
  }

  void endStroke() {
    if (_currentStroke != null) {
      _strokes.add(_currentStroke!);
      _currentStroke = null;
      notifyListeners();
    }
  }

  void setColor(Color color) {
    selectedColor = color.toARGB32();
    notifyListeners();
  }

  /// Remove the last stroke drawn, if any.
  void undo() {
    if (_strokes.isNotEmpty) {
      _strokes.removeLast();
      notifyListeners();
    }
  }

  /// Remove all drawn strokes.
  void clear() {
    _strokes.clear();
    _currentStroke = null;
    notifyListeners();
  }

  BodyMapDrawing get drawing => BodyMapDrawing(strokes: _strokes);

  // Normalize from Offset to Point (0..1) relative to image rect
  Point _normalize(Offset offset, Rect rect) {
    double clamp(double v) => v.clamp(0.0, 1.0);

    return Point(
      clamp((offset.dx - rect.left) / rect.width),
      clamp((offset.dy - rect.top) / rect.height),
    );
  }
}
