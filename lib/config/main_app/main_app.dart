import 'package:flutter/material.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/widgets/widget_sizes.dart';
import 'package:news_app/features/news/presentation/view/news_view.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
            shadows: <Shadow>[Shadow(blurRadius: WidgetSizes.spacingNormal)],
          ),
        ),
      ),
      home: const NewsView(),
    );
  }
}
