# Activity Rings

Library to create Progress bars in Apple Watch style rings -
[Apple Watch Rings](https://www.apple.com/in/watch/close-your-rings/)

To use, import `package:activity_ring/activity_ring.dart`.

This library comes with default template gradients to easily get rings
style to match Apple watch ring colors. If you dont want that you can easily
get started with a single color too, gradients and animations will be
handled by library in both cases.

The library can gracefully handle when percent is greater than 100%.
In which case, a new ring will be drawn on the existing 100% ring just like
iOS activity app rings. For example when ring's percent is 160%, we first
draw a full ring to cover 100% and then a partial ring with 60%. Genral rule
of thmb while looking at docs is when it says second ring then its the ring
that get painted when percent is between 100 and 200. Similarly for third,
fourth etc.

This library is built with to be extremely customizable with low effort.
Please check the API documentation if you get stuck anywhere.

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

![RingColor](https://github.com/akashgurava/activity_ring/blob/cleanup/media/RingColor.jpg?raw=true)

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

![RingGradient](https://github.com/akashgurava/activity_ring/blob/cleanup/media/RingGradient.jpg?raw=true)

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

![RingColors](https://github.com/akashgurava/activity_ring/blob/cleanup/media/RingColors.jpg?raw=true)

The above ring is automatically painted with gradient from colors given,
where each color in list represents that ring's color. To have a
constant color just pass `gradient: false` to RingColorScheme.

### Explicitly mentioning gradinet for each ring

```dart
Ring(
  percent: 190,
  color: RingColorScheme(ringColors: [[Colors.red, Colors.yellow], [Colors.yellow, Colors.green]]),
  radius: 80,
  width: 10,
  child: Center(child: Text('190%')),
),
```

![RingGradients](https://github.com/akashgurava/activity_ring/blob/cleanup/media/RingGradients.jpg?raw=true)

The above ring is automatically painted with gradient from colors given,
where each color in list represents that ring's color. To have a
constant color just pass `gradient: false` to RingColorScheme.
