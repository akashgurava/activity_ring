/// Library to create Progress bars in Apple Watch style rings -
/// [Apple Watch Rings](https://www.apple.com/in/watch/close-your-rings/)
///
/// To use, import `package:activity_ring/activity_ring.dart`.
///
/// This library comes with default template gradients to easily get rings
/// style to match Apple watch ring colors. If you dont want that you can easily
/// get started with a single color too, gradients and animations will be
/// handled by library in both cases.
///
/// The library can gracefully handle when percent is greater than 100%.
/// In which case, a new ring will be drawn on the existing 100% ring just like
/// iOS activity app rings. For example when ring's percent is 160%, we first
/// draw a full ring to cover 100% and then a partial ring with 60%. Genral rule
/// of thmb while looking at docs is when it says second ring then its the ring
/// that get painted when percent is between 100 and 200. Similarly for third,
/// fourth etc.
///
/// This library is built with to be extremely customizable with low effort.
/// Please check the API documentation if you get stuck anywhere.
library activity_ring;

export './src/color.dart';
export './src/painter.dart';
export './src/ring.dart';
export './src/utilities.dart';
