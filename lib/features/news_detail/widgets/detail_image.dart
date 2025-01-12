part of '../view/news_detail_view.dart';

/// [DetailImage] is a Widget that displays the image of a news article.
final class DetailImage extends StatelessWidget {
  const DetailImage({
    required this.news,
    super.key,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: news.urlToImage!,
      child: CachedNetworkImage(
        imageUrl: news.urlToImage ?? '',
        errorWidget: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
      ),
    );
  }
}
