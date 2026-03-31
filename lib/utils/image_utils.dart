import 'dart:ui';
import 'dart:ui' as ui;

Rect calculateImageRect(Size size, ui.Image bodyImage) {
  final imageAspect = bodyImage.width / bodyImage.height;
  final canvasAspect = size.width / size.height;

  double drawWidth, drawHeight;

  if (canvasAspect > imageAspect) {
    // Fit by height
    drawHeight = size.height;
    drawWidth = drawHeight * imageAspect;
  } else {
    // Fit by width
    drawWidth = size.width;
    drawHeight = drawWidth / imageAspect;
  }

  final left = (size.width - drawWidth) / 2;
  final top = (size.height - drawHeight) / 2;

  return Rect.fromLTWH(left, top, drawWidth, drawHeight);
}
