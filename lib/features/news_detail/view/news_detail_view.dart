import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entities/news_entitiy.dart';

class NewsDetailView extends StatefulWidget {
  const NewsDetailView({required this.news, super.key});
  final NewsEntity news;

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  @override
  Widget build(BuildContext context) {
    final news = widget.news;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Hero(
                tag: news.urlToImage!,
                child: Image.network(news.urlToImage ?? '')),
          ],
        ),
      ),
    );
  }
}
