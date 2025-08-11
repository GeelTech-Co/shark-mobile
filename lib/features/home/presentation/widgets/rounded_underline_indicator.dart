import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RoundedUnderlineIndicator extends Decoration {
  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;
  final double borderRadius;

  const RoundedUnderlineIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.blue),
    this.insets = EdgeInsets.zero,
    this.borderRadius = 2.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _RoundedUnderlinePainter(this, onChanged);
  }
}

class _RoundedUnderlinePainter extends BoxPainter {
  final RoundedUnderlineIndicator decoration;

  _RoundedUnderlinePainter(this.decoration, VoidCallback? onChanged)
    : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final ui.TextDirection textDirection =
        configuration.textDirection ?? ui.TextDirection.ltr;
    final Rect indicatorRect = decoration.insets
        .resolve(textDirection)
        .deflateRect(rect);
    final Paint paint = decoration.borderSide.toPaint()
      ..style = PaintingStyle.fill;
    final double height = decoration.borderSide.width;
    final Rect underlineRect = Rect.fromLTWH(
      indicatorRect.left,
      indicatorRect.bottom - height,
      indicatorRect.width,
      height,
    );
    final RRect rrect = RRect.fromRectAndRadius(
      underlineRect,
      Radius.circular(decoration.borderRadius),
    );
    canvas.drawRRect(rrect, paint);
  }
}