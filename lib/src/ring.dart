import 'package:flutter/material.dart';

import 'package:activity_ring/src/color.dart';
import 'package:activity_ring/src/painter.dart';

/// A progress indicator widget with Apple Watch Rings style
class Ring extends StatelessWidget {
  // ignore: public_member_api_docs
  const Ring({
    required this.percent,
    required this.color,
    this.center,
    this.radius,
    this.width = 25.0,
    this.showBackground = true,
    this.animate = true,
    this.curve,
    this.duration,
    this.child,
    Key? key,
  })  : assert(percent != null, 'percent is a mandatory param'),
        assert(color != null, 'ringColor is a mandatory param'),
        assert(width != null, 'width cannot be null'),
        super(key: key);

  /// Percent of ring to paint.
  ///
  /// Pass the value after * 100 like 8.9 instead of 0.089
  final double percent;

  /// Ring's color.
  final RingColorScheme color;

  /// Center for this ring.
  final Offset? center;

  /// Ring's radius.
  ///
  /// If null parent widget's Size will be used.
  /// Then radius = (min(size.width, size.height) - strokeWidth) / 2
  final double? radius;

  /// Ring's width.
  final double width;

  /// True if this ring should have backround ring.
  final bool showBackground;

  /// Duration of animation
  final Duration? duration;

  /// If true then ring will be animated to fill [percent]
  final bool animate;

  /// Curve to animate the ring
  final Curve? curve;

  /// Child element for this widget.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final animatedRing = TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: percent),
      curve: curve ?? Curves.easeOutQuad,
      duration: duration ?? Duration(seconds: (percent ~/ 100) + 1),
      // ignore: avoid_types_on_closure_parameters
      builder: (_, double percent, Widget? child) {
        return CustomPaint(
          painter: DrawRing(
            percent: percent,
            color: color,
            width: width,
            center: center,
            radius: radius,
          ),
          child: child,
        );
      },
      child: child,
    );
    final staticRing = CustomPaint(
      painter: DrawRing(
        percent: percent,
        color: color,
        width: width,
        center: center,
        radius: radius,
      ),
      child: child,
    );

    return CustomPaint(
      painter: DrawFullRing(
        width: width,
        ringPaint: showBackground ? color.backgroundRingPaint(width) : null,
        center: center,
        radius: radius,
      ),
      child: animate ? animatedRing : staticRing,
    );
  }
}
