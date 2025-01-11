part of '../views/news_view.dart';

final class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.news,
    super.key,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          _CardImage(news: news),
          _CardTexts(news: news),
        ],
      ),
    );
  }
}

final class _CardImage extends StatelessWidget {
  const _CardImage({
    required this.news,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadiusGeneral.allLow(),
      child: Image.network(
        news.urlToImage!,
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        fit: BoxFit.cover,
      ),
    );
  }
}

final class _CardTexts extends StatelessWidget {
  const _CardTexts({
    required this.news,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const PagePadding.allSmall(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              news.description!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
