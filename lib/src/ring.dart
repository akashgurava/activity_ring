import 'package:activity_ring/src/painter.dart';
import 'package:activity_ring/src/template.dart';
import 'package:flutter/material.dart';

// TODO: Add params
/// A progress indicator widget with Apple Watch Rings style
///
/// Creates a Ring with [strokeWidth],[ringColor] [percent] filled.
/// While filling the ring a Tween animation is used with [duration].
/// The [percent] can be greater than 100 too in which case a ring is painted
/// over the previous ring with the same animation.
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

  /// Percentage of completion for this ring.
  ///
  /// Pass the value after * 100 like 8.9 instead of 0.089.
  final double percent;

  /// Color of this ring.
  // TODO: make this dynamic with options for
  // RingColorTemplate, List<Gradient>, List<List<Color>>, List<Color>, Color.
  final List<List<Color>> ringColor;

  /// Template of Ring Colors.
  // TODO: remove this param
  final RingColorTemplate ringTemplate;

  /// Width of stroke
  final double strokeWidth;

  /// Show outer circle enclosing this ring.
  ///
  /// If null then first ring's first color will be darkened to 85%.
  final Color outerCicleColor;

  /// Duration of animation
  ///
  /// If null then 1 second per ring.
  final Duration duration;

  /// Child element for this widget.
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
