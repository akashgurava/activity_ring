import 'dart:math';

import 'package:flutter/material.dart';

/// Convert degrees to radians
double degreeToRadians(num degree) => degree.roundToDouble() * pi / 180;

/// Darken a [color] by [percent]
Color darken(Color color, double percent) {
  assert(percent <= 100, 'percent should not be greater than 100');
  final strength = 1 - percent / 100;
  return Color.fromARGB(
    color.alpha,
    (color.red * strength).round(),
    (color.green * strength).round(),
    (color.blue * strength).round(),
  );
}

/// Brighten a [color] by [percent]
Color brighten(Color color, double percent) {
  assert(percent <= 100, 'percent should not be greater than 100');
  final strength = percent / 100;
  return Color.fromARGB(
    color.alpha,
    color.red + ((255 - color.red) * strength).round(),
    color.green + ((255 - color.green) * strength).round(),
    color.blue + ((255 - color.blue) * strength).round(),
  );
}
