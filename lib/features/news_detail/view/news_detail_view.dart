import 'package:flutter/material.dart';
import 'package:news_app/config/widgets/page/page_padding.dart';
import 'package:news_app/config/widgets/widget_sizes.dart';
import 'package:news_app/features/news/domain/entities/news_entitiy.dart';

part '../widgets/detail_content.dart';
part '../widgets/detail_image.dart';

/// [NewsDetailView] is a StatefulWidget that displays the details of a news article.
/// It takes a [NewsEntity] as a parameter and displays the image and content of the news.
/// It uses [DetailImage] and [DetailContent] widgets to display the image and content of the news.
final class NewsDetailView extends StatefulWidget {
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: Column(
          children: [
            DetailImage(news: news),
            DetailContent(news: news),
          ],
        ),
      ),
    );
  }
}
