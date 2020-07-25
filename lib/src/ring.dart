import 'package:activity_ring/src/painter.dart';
import 'package:activity_ring/src/template.dart';
import 'package:flutter/material.dart';

/// A progress indicator widget with iOS Activity Rings style
// TODO: Add params
class Ring extends StatelessWidget {
  // ignore: public_member_api_docs
  const Ring({
    @required this.percent,
    this.ringColor,
    this.ringTemplate,
    this.strokeWidth = 25.0,
    this.outerCicleColor,
    this.duration,
    this.child,
    Key key,
  })  : assert(
          ringColor != null || ringTemplate != null,
          'Provide ringColor or ringTemplate',
        ),
        super(key: key);

  /// Percentage of completion for ring
  ///
  /// Pass the value after * 100 like 8.9 instead of 0.089
  final double percent;

  /// Color of ring
  final List<List<Color>> ringColor;

  /// Template of Ring Colors
  final RingColorTemplate ringTemplate;

  /// Width of stroke
  final double strokeWidth;

  /// Show outer circle enclosing the ring
  final Color outerCicleColor;

  /// Duration of animation
  final Duration duration;

  /// Child element for this widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _ringColor = ringColor ?? ringTemplate.colors;
    final _numRings = percent ~/ 100 + 1;

    final _duration = duration ?? Duration(seconds: _numRings);

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: percent),
      curve: Curves.easeOutQuad,
      duration: _duration,
      // ignore: avoid_types_on_closure_parameters
      builder: (_, double percent, __) {
        return CustomPaint(
          painter: DrawRing(
            percent: percent,
            ringColor: _ringColor,
            ringBackgroundColor: outerCicleColor,
            strokeWidth: strokeWidth,
          ),
          child: Center(
            child: child,
          ),
        );
      },
    );
  }
}
