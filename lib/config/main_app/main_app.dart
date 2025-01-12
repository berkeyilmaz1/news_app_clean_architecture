import 'package:flutter/material.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/features/news/presentation/view/news_view.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      theme: AppTheme.appThemeData(),
      home: const NewsView(),
    );
  }
}
