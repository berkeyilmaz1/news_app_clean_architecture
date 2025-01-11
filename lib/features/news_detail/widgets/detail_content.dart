part of '../view/news_detail_view.dart';

/// [DetailContent] is a Widget that displays the content of a news article.
final class DetailContent extends StatelessWidget {
  const DetailContent({
    required this.news,
    super.key,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            news.title ?? '',
            style: const TextStyle(
              fontSize: WidgetSizes.spacingLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Text(
            news.description ?? '',
            style: const TextStyle(
              fontSize: WidgetSizes.spacingMid,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: WidgetSizes.spacingNormal),
          Text(
            news.content ?? '',
            style: const TextStyle(
              fontSize: WidgetSizes.spacingNormal,
            ),
          ),
        ],
      ),
    );
  }
}
