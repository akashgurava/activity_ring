import 'dart:math';

import 'package:flutter/material.dart';

import 'package:activity_ring/src/utilities.dart';

/// Custom painter to draw the ring
class DrawRing extends CustomPainter {
  // ignore: public_member_api_docs
  const DrawRing({
    @required this.percent,
    @required this.strokeWidth,
    @required this.ringColor,
    this.ringBackgroundColor,
  })  : assert(percent != null, 'percent is a required param'),
        assert(ringColor != null, 'Ring color is a required parameter'),
        super();

  /// Percentage of ring to fill
  final double percent;

  /// Width of ring
  final double strokeWidth;

  /// Color of ring
  final List<List<Color>> ringColor;

  /// Color of background of ring.
  ///
  /// If null then no background is drawn.
  final Color ringBackgroundColor;

  void _drawEmptyCircle(
    Offset center,
    double radius,
    Canvas canvas,
    double angle, {
    @required Color color,
  }) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final offset = Offset(
      center.dx + radius * cos(angle),
      center.dy + radius * sin(angle),
    );
    canvas.drawCircle(
      offset,
      strokeWidth / 2,
      paint,
    );
  }

  List<Color> _currentRingColor(int currentRing) {
    if (currentRing <= ringColor.length) {
      return ringColor[currentRing - 1];
    } else {
      final missingRings = currentRing - ringColor.length;
      final lastColor = ringColor.last.last;
      final color = [
        brighten(lastColor, (missingRings - 1) * 20.0),
        brighten(lastColor, missingRings * 20.0),
      ];
      return color;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // size.width, height is reduced by 2 off the parent container

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    if (ringBackgroundColor != null) {
      // Outer circle style on which the percentage indicator is drawn
      final outerCircle = Paint()
        ..strokeWidth = strokeWidth
        ..color = ringBackgroundColor
        ..style = PaintingStyle.stroke;

      // this draws main outer circle
      canvas.drawCircle(center, radius, outerCircle);
    }
    const pi2 = 2 * pi;
    final cutoff = 100 - ((100 * strokeWidth) / (pi2 * radius));
    final startAngle = degreeToRadians(-90);

    final numCirles = percent ~/ 100 + 1;
    var currentRing = 1;

    for (; currentRing < numCirles; currentRing++) {
      if (currentRing > 0) {
        final shader = SweepGradient(
          colors: _currentRingColor(currentRing),
          tileMode: TileMode.repeated,
          startAngle: 3 * pi / 2,
          endAngle: 7 * pi / 2,
        ).createShader(
          Rect.fromCircle(
            center: center,
            radius: 0,
          ),
        );
        final paint = Paint()
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..shader = shader;

        // this draws main outer circle
        canvas.drawCircle(center, radius, paint);
      }
    }
    final currentRingPercent = percent % 100;
    final currentRingColor = _currentRingColor(currentRing);

    final shader = SweepGradient(
      colors: currentRingColor,
      tileMode: TileMode.repeated,
      startAngle: degreeToRadians(270),
      endAngle: degreeToRadians(270 + 360.0),
    ).createShader(
      Rect.fromCircle(
        center: center,
        radius: 0,
      ),
    );
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = shader;

    final sweepAngle = (currentRingPercent / 100) * pi2;

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    // Draw a extra small circle at the initial point to cover
    // circular strokeCap
    if (currentRingPercent < 100) {
      _drawEmptyCircle(
        center,
        radius,
        canvas,
        degreeToRadians(-90),
        color: currentRingColor[0],
      );
    }
    if (currentRingPercent >= cutoff) {
      _drawEmptyCircle(
        center,
        radius,
        canvas,
        -pi / 2 + sweepAngle,
        color: currentRingColor[currentRingColor.length - 1],
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
