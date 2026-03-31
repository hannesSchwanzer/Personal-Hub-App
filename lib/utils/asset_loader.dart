import 'dart:ui' as ui;
import 'package:flutter/services.dart';

Future<ui.Image> loadBodyMapImage() async {
  final data = await rootBundle.load('assets/images/body_map.png');
  final bytes = data.buffer.asUint8List();

  final codec = await ui.instantiateImageCodec(bytes);
  final frame = await codec.getNextFrame();

  return frame.image;
}
