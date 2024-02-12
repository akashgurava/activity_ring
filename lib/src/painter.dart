import 'dart:math';
import 'dart:ui' as ui;

import 'package:activity_ring/src/color.dart';
import 'package:activity_ring/src/utilities.dart';
import 'package:flutter/material.dart';

/// Draws a full ring with [width] and [radius].
class DrawFullRing extends CustomPainter {
  // ignore: public_member_api_docs
  const DrawFullRing({
    required this.width,
    this.ringPaint,
    this.center,
    this.radius,
  }) : super();

  /// Width of ring
  final double width;

  /// Color for ring.
  final Paint? ringPaint;

  /// Center for this ring.
  ///
  /// If null parent widget's Size will be used.
  /// Then center = Offset(size.width / 2, size.height / 2)
  final Offset? center;

  /// Ring's radius.
  ///
  /// If null parent widget's Size will be used.
  /// Then radius = (min(size.width, size.height) - strokeWidth) / 2
  final double? radius;

  @override
  void paint(Canvas canvas, Size size) {
    final ringCenter = center ?? Offset(size.width / 2, size.height / 2);

    final ringRadius = radius ?? (min(size.width, size.height) - width) / 2;

    if (ringPaint != null) {
      canvas.drawCircle(ringCenter, ringRadius, ringPaint!);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

/// Custom painter to draw ring
class DrawRing extends CustomPainter {
  // ignore: public_member_api_docs
  const DrawRing({
    required this.percent,
    required this.color,
    required this.width,
    Offset? center,
    double? radius,
    ui.Image? tip,
  })  : _center = center,
        _radius = radius,
        _numCircles = percent ~/ 100 + 1,
        _tip = tip,
        super();

  /// Percent of ring to paint.
  ///
  /// Pass the value after * 100 like 8.9 instead of 0.089
  final double percent;

  /// Color scheme for rings
  final RingColorScheme color;

  /// Width of ring
  final double width;

  /// Center for this ring.
  ///
  /// If null parent widget's Size will be used.
  /// Then center = Offset(size.width / 2, size.height / 2)
  final Offset? _center;

  /// Optional image used for the ring tip
  final ui.Image? _tip;

  /// Ring's radius.
  ///
  /// If null parent widget's Size will be used.
  /// Then radius = (min(size.width, size.height) - strokeWidth) / 2
  final double? _radius;

  final int _numCircles;

  /// Get the center for placing smaller circles around the ring.
  Offset getSmallCircleCenter(
    Offset ringCenter,
    double ringRadius,
    double angle,
  ) {
    return Offset(
      ringCenter.dx + ringRadius * cos(angle),
      ringCenter.dy + ringRadius * sin(angle),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = _center ?? Offset(size.width / 2, size.height / 2);
    final radius = _radius ?? (min(size.width, size.height) - width) / 2;

    final rect = Rect.fromCircle(center: center, radius: radius);
    final startAngle = degreeToRadians(-90);
    // Calculate sweepAngle only extra percent after removing 100s(full ring).
    final sweepAngle = ((percent % 100) / 100) * pi * 2;
    // Calculate cutoff to extra circle at the end of arc
    final cutoff = 100 - ((100 * width) / (pi * 2 * radius));

    // Update colors cache for numbers of circles we are going to paint.
    color
      ..updateRingColors(_numCircles)
      ..setPaints(center, width);

    final x =
        center.dx - (radius * cos(degreeToRadians(90 + (percent * 360 / 100))));
    final y =
        center.dy - (radius * sin(degreeToRadians(90 + (percent * 360 / 100))));

    // If number of circles is more than 1, paint only last but one circle
    if (_numCircles > 1) {
      canvas.drawCircle(
        center,
        radius,
        color.getCirclePaints(_numCircles - 1, center, width).arcPaint!,
      );

      // Add shadow
      if (percent % 100 > 0.1) {
        final oval = Path()
          ..addOval(Rect.fromCircle(center: Offset(x, y), radius: width));

        final shadowPaint = Paint()
          ..color = Colors.black.withOpacity(0.7)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10)
          ..blendMode = BlendMode.overlay;

        canvas.drawPath(oval, shadowPaint);
      }
    }

    // Paint ring for 0<percent<100 values.
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      color.getCirclePaints(_numCircles, center, width).arcPaint!,
    );

    // Paint initial circle to cover stroke's circle at the beginning
    if (_numCircles > 1 && percent % 100 <= 0.1) {
      canvas.drawCircle(
        getSmallCircleCenter(center, radius, degreeToRadians(-90)),
        width / 2,
        color.getCirclePaints(_numCircles - 1, center, width).finalCirclePaint!,
      );
    } else {
      canvas.drawCircle(
        getSmallCircleCenter(center, radius, degreeToRadians(-90)),
        width / 2,
        color.getCirclePaints(_numCircles, center, width).initialCirclePaint!,
      );
    }

    if (percent % 100 >= cutoff) {
      canvas.drawCircle(
        getSmallCircleCenter(center, radius, -pi / 2 + sweepAngle),
        width / 2,
        color.getCirclePaints(_numCircles, center, width).finalCirclePaint!,
      );
    }

    if (_tip != null) {
      canvas.drawImage(
          _tip!, Offset(x - _tip!.width / 2, y - _tip!.height / 2), Paint());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
