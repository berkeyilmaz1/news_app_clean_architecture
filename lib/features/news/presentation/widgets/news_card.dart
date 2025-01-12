part of '../view/news_view.dart';

/// [NewsCard] is a StatelessWidget that is responsible for displaying the news card.
final class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.news,
    required this.onTap,
    super.key,
  });

  final NewsEntity news;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (news.title == '[Removed]' || news.urlToImage == null) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            _CardImage(news: news),
            _CardTexts(news: news),
          ],
        ),
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
    if (news.urlToImage == null) {
      return const SizedBox.shrink();
    }
    return ClipRRect(
      borderRadius: const BorderRadiusGeneral.allLow(),
      child: Hero(
        tag: news.urlToImage!,
        child: CachedNetworkImage(
          imageUrl: news.urlToImage!,
          width: context.width3,
          height: context.height2,
          fit: BoxFit.cover,
          errorWidget: (context, error, stackTrace) {
            return IconConstants.error.toIcon;
          },
        ),
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
              news.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              news.description ?? '',
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
