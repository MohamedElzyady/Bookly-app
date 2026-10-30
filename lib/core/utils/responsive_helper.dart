import 'dart:math';

import 'package:flutter/widgets.dart';

/// Responsive helper using Extension on BuildContext.
/// Design base: iPhone X (375 x 812).
/// Usage:
///   context.w(20)   — proportional width
///   context.h(50)   — proportional height
///   context.sp(18)  — scalable font size (clamped)
///   context.screenW  — full screen width
///   context.screenH  — full screen height
extension ResponsiveExtension on BuildContext {
  static const double _designWidth = 375.0;
  static const double _designHeight = 812.0;

  double get screenW => MediaQuery.sizeOf(this).width;
  double get screenH => MediaQuery.sizeOf(this).height;

  /// Scales a value proportionally to screen **width**.
  double w(num value) => value * (screenW / _designWidth);

  /// Scales a value proportionally to screen **height**.
  double h(num value) => value * (screenH / _designHeight);

  /// Scales font size proportionally, clamped between 0.85x–1.15x
  /// to prevent text from becoming unreadable or oversized.
  double sp(num value) {
    final scaleFactor = min(screenW / _designWidth, screenH / _designHeight);
    final clamped = scaleFactor.clamp(0.85, 1.15);
    return value * clamped;
  }
}
