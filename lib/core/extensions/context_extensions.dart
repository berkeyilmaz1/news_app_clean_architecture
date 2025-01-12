import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
    double get width => MediaQuery.of(this).size.width;
    double get height => MediaQuery.of(this).size.height;

  /// [width1] is 10% of the screen width
    double get width1 => width * 0.1;

  /// [height1] is 10% of the screen height
  double get height1 => height * 0.1;

  /// [width3] is 30% of the screen width
  double get width3 => width * 0.3;

  /// [height3] is 30% of the screen height
  double get height3 => height * 0.3;
}
