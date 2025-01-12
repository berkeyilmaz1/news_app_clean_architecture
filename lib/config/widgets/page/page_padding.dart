import 'package:flutter/material.dart';

final class PagePadding extends EdgeInsets {
  /// Padding is 20 [EdgeInsets.all]
  const PagePadding.all() : super.all(20);

  /// Padding is 12 [EdgeInsets.all]
  const PagePadding.generalCardAll() : super.all(12);

  /// Padding is 16 [EdgeInsets.all]
  const PagePadding.allMedium() : super.all(16);

  /// Padding is 8 [EdgeInsets.all]
  const PagePadding.allSmall() : super.all(8);
}
