// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:activity_ring/activity_ring.dart';

/// Manually specify all colors
final RingColorScheme ringGradients = RingColorScheme(ringGradients: [
  [Colors.red, Colors.yellow],
  [Colors.yellow, Colors.green],
  [Colors.green, Colors.blue],
]);

/// Specify only 1 color per ring
final RingColorScheme ringColors = RingColorScheme(ringColors: [
  Colors.red,
  Colors.green,
  Colors.blue,
], intensity: 20);

/// Specify only gradinet color set for the first ring only.
/// Other rings will be interpolated.
final RingColorScheme ringGradient = RingColorScheme(ringGradient: [
  Colors.red[900],
  Colors.blue[300],
]);

/// Specify only 1 color
final RingColorScheme ringColor = RingColorScheme(
  ringColor: Colors.red,
  intensity: 20,
);

const firstRingPercent = 80.0;
const secondRingPercent = 140.0;
const ringRadius = 40.0;
const width = 10.0;

const gradientsChild = Center(child: Text('Ring Gradients'));
const colorsChild = Center(child: Text('Ring Colors'));
const gradientChild = Center(child: Text('Ring Gradient'));
const colorChild = Center(child: Text('Ring Color'));
