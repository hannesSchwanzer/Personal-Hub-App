import 'package:flutter/material.dart';

/// A general-purpose widget that shows [child] normally,
/// but pops up [tooltipBuilder] as an Overlay when tapped.
/// Tapping outside the overlay will close it.
/// Typical use: Place [TapTooltip] around a header row, for easy mobile-accessible tooltips.
class TapTooltip extends StatefulWidget {
  /// The widget that is always visible.
  final Widget child;

  /// The widget to show as overlay. 
  /// (The BuildContext provided is for the overlay.)
  final WidgetBuilder tooltipBuilder;

  /// Where the tooltip will appear (relative to the child): below (default) or above.
  final Alignment tooltipAlignment;

  const TapTooltip({
    super.key,
    required this.child,
    required this.tooltipBuilder,
    this.tooltipAlignment = Alignment.bottomLeft,
  });

  @override
  State<TapTooltip> createState() => _TapTooltipState();
}

class _TapTooltipState extends State<TapTooltip> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _showTooltip() {
    if (_overlayEntry != null) return; // Don't show multiple

    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    RenderBox box = context.findRenderObject() as RenderBox;
    final target = box.localToGlobal(
      box.size.bottomLeft(Offset.zero),
      ancestor: overlay,
    );

    _overlayEntry = OverlayEntry(
      builder: (overlayContext) => GestureDetector(
        behavior: HitTestBehavior.translucent, // Absorb outside taps
        onTap: _hideTooltip,
        child: Stack(
          children: [
            Positioned(
              left: target.dx,
              top: target.dy + 8, // Slight vertical offset
              child: Material(
                color: Colors.transparent,
                child: widget.tooltipBuilder(overlayContext),
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _showTooltip,
        child: widget.child,
      ),
    );
  }
}
