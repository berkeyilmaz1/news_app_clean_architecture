part of '../view/news_view.dart';

final class NewsList extends StatelessWidget {
  const NewsList({
    required this.scrollController,
    required this.state,
    super.key,
  });

  final ScrollController scrollController;
  final NewsState state;

  void navigateToNewsDetail(NewsEntity news, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<NewsDetailView>(
        builder: (context) => NewsDetailView(news: news),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: state.news!.length + 1,
        itemBuilder: (context, index) {
          if (index == state.news!.length) {
            return CustomLoading(
              width: context.width1,
              height: context.height1,
            );
          }
          final news = state.news![index];
          return Padding(
            padding: const PagePadding.allSmall(),
            child: NewsCard(
              news: news,
              onTap: () => navigateToNewsDetail(news, context),
            ),
          );
        },
      ),
    );
  }
}
