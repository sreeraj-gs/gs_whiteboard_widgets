import 'package:flutter/material.dart';

class Sizer {
  static late Size _mediaQuerySize;
  static late double screenWidth;
  static late double screenHeight;
  static late double devicePixelRatio;

  /// Initializes the Sizer with the [BuildContext].
  static void init(BuildContext context) {
    // Ensure MediaQuery.sizeOf(context) is called only once.
    _mediaQuerySize = MediaQuery.sizeOf(context);
    screenWidth = _mediaQuerySize.width;
    screenHeight = _mediaQuerySize.height;
    devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
  }

  static bool get isTablet => screenWidth >= 768 && screenWidth < 1024;
  static bool get isDesktop => screenWidth >= 1024;
}

extension SizerExt on num {
  /// Calculates a responsive height based on a percentage of the screen height.
  /// `this` refers to the percentage (e.g., 50 for 50%).
  double get h => (toDouble() / 100) * Sizer.screenHeight;

  /// Calculates a responsive width based on a percentage of the screen width.
  /// `this` refers to the percentage (e.g., 50 for 50%).
  double get w => (toDouble() / 100) * Sizer.screenWidth;

  /// Calculates a responsive radius, scaled based on a percentage of the screen width.
  /// `this` refers to the percentage (e.g., 1 for 1% of screen width).
  double get r => (toDouble() / 100) * Sizer.screenWidth;
}

//should be a separate file in util
extension ContextExt on BuildContext {
  //will not trigerr rebuild because not depending on mq
  double get width => Sizer.screenWidth;
  double get height => Sizer.screenHeight;

  //will trigger rebuilds
  double get _width => MediaQuery.sizeOf(this).width;
  bool get isTablet => _width >= 768 && _width < 1024;
  bool get isDesktop => _width >= 1024;

  //theme
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
