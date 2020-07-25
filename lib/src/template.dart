import 'package:flutter/material.dart';

enum RingColorTemplate { red, blue, green }

extension RingColorTemplateExtension on RingColorTemplate {
  List<List<Color>> get colors {
    switch (this) {
      case RingColorTemplate.red:
        return const [
          [
            Color.fromARGB(255, 225, 0, 20),
            Color.fromARGB(255, 240, 20, 60),
            Color.fromARGB(255, 250, 40, 120),
            Color.fromARGB(255, 250, 60, 140),
          ],
        ];
        break;
      default:
        return const [
          [
            Color.fromARGB(255, 225, 0, 20),
            Color.fromARGB(255, 240, 20, 60),
            Color.fromARGB(255, 250, 40, 120),
            Color.fromARGB(255, 250, 60, 140),
          ]
        ];
    }
  }
}
