import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/views/news_view.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: NewsView(),
    );
  }
}
