import 'package:flutter/material.dart';
import 'package:news_app/config/widgets/widget_sizes.dart';

final class AppTheme {
  AppTheme._();

  static ThemeData appThemeData() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: WidgetSizes.spacingLarge,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
          shadows: <Shadow>[Shadow(blurRadius: WidgetSizes.spacingNormal)],
        ),
      ),
    );
  }
}
