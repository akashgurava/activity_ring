# Activity Rings

[![pub package](https://img.shields.io/pub/v/activity_ring.svg)](https://pub.dartlang.org/packages/activity_rings)

Library to create Progress bars in Apple Watch style rings -
[Apple Watch Rings](https://www.apple.com/in/watch/close-your-rings/)

To use, import `package:activity_ring/activity_ring.dart`.

This library is built with to be extremely customizable with low effort.
Please check the API documentation if you get stuck anywhere.

Note: Do not let the auto brighten colors to exceed 3 rings as this will cause a runtime exception.

## Example

There are several ways to create rings.

### Using a single color

```dart
Ring(
  percent: 90,
  color: RingColorScheme(ringColor: Colors.red),
  radius: 80,
  width: 10,
  child: Center(child: Text('90%')),
)
```

![RingColor](https://github.com/akashgurava/activity_ring/blob/master/media/RingColor.gif?raw=true)

The above ring is automatically painted with gradients. To have a
constant color just pass `gradient: false` to RingColorScheme.

### Using a single gradient

```dart
Ring(
  percent: 90,
  color: RingColorScheme(ringGradient: [Colors.red, Colors.blue]),
  radius: 80,
  width: 10,
  child: Center(child: Text('90%')),
),
```

![RingGradient](https://github.com/akashgurava/activity_ring/blob/master/media/RingGradient.gif?raw=true)

The above ring is automatically painted with gradient from colors given.

### Using same color for a ring with different color for each ring

```dart
Ring(
  percent: 190,
  color: RingColorScheme(ringColors: [Colors.red, Colors.blue]),
  radius: 80,
  width: 10,
  child: Center(child: Text('190%')),
),
```

![RingColors](https://github.com/akashgurava/activity_ring/blob/master/media/RingColors.gif?raw=true)

The above ring is automatically painted with gradient from colors given,
where each color in list represents that ring's color. To have a
constant color just pass `gradient: false` to RingColorScheme.

### Explicitly mentioning gradinet for each ring

```dart
Ring(
  percent: 190,
  color: RingColorScheme(ringGradients: [[Colors.red, Colors.yellow], [Colors.yellow, Colors.green]]),
  radius: 80,
  width: 10,
  child: Center(child: Text('190%')),
),
```

![RingGradients](https://github.com/akashgurava/activity_ring/blob/master/media/RingGradients.gif?raw=true)

The above ring is automatically painted with gradient from colors given,
where each color in list represents that ring's color. To have a
constant color just pass `gradient: false` to RingColorScheme.

## TODO

- [ ] Create templates for apple colors
- [ ] Add tests and coverage
