import 'dart:convert';

class BodyMapDrawing {
  final List<Stroke> strokes;

  BodyMapDrawing({required this.strokes});

  Map<String, dynamic> toJson() => {
        'strokes': strokes.map((s) => s.toJson()).toList(),
      };

  factory BodyMapDrawing.fromJson(Map<String, dynamic> json) {
    return BodyMapDrawing(
      strokes: (json['strokes'] as List)
          .map((s) => Stroke.fromJson(s))
          .toList(),
    );
  }

  /// Helper for encoding to a String for persistence
  String toJsonString() => jsonEncode(toJson());

  /// Helper for decoding from a string for persistence
  static BodyMapDrawing? fromJsonString(String? jsonStr) {
    if (jsonStr == null) return null;
    final map = jsonDecode(jsonStr);
    return BodyMapDrawing.fromJson(map);
  }
}

class Stroke {
  final List<Point> points;
  final int color;
  final double normalizedStrokeWidth; // relative to image width

  Stroke({
    required this.points,
    required this.color,
    required this.normalizedStrokeWidth,
  });

  Map<String, dynamic> toJson() => {
        'points': points.map((p) => p.toJson()).toList(),
        'color': color,
        'normalizedStrokeWidth': normalizedStrokeWidth,
      };

  factory Stroke.fromJson(Map<String, dynamic> json) {
    return Stroke(
      points: (json['points'] as List)
          .map((p) => Point.fromJson(p))
          .toList(),
      color: json['color'],
      normalizedStrokeWidth: (json['normalizedStrokeWidth'] as num).toDouble(),
    );
  }

  // helper for default width if needed
  double getStrokeWidth(double imageWidth) =>
      (normalizedStrokeWidth * imageWidth).clamp(1.0, double.infinity);
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);

  Map<String, dynamic> toJson() => {'x': x, 'y': y};

  factory Point.fromJson(Map<String, dynamic> json) =>
      Point((json['x'] as num).toDouble(), (json['y'] as num).toDouble());
}
