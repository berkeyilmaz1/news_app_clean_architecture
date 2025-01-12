import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news/domain/usecases/get_news.dart';
import 'package:news_app/features/news/presentation/providers/news_state.dart';

/// [NewsNotifier] class is a class that extends StateNotifier.
/// This class is used to manage the state of the news.
final class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(this.getNewsUseCase) : super(const NewsState());
  final GetNewsUseCase getNewsUseCase;

  Future<void> getNews(String query) async {
    state = state.copyWith(newsStatus: NewsStatus.loading);
    final result = await getNewsUseCase.call(query, 1);

    result.fold(
      (error) => state = state.copyWith(
        newsStatus: NewsStatus.error,
        errorMessage: error.errorMessage,
      ),
      (news) => state = state.copyWith(
        news: news,
        newsStatus: NewsStatus.loaded,
      ),
    );
  }

  Future<void> loadNews(String query) async {
    state = state.copyWith(newsStatus: NewsStatus.loading);
    final page = state.page;
    final result = await getNewsUseCase.call(query, page);

    result.fold(
      (error) => state = state.copyWith(
        newsStatus: NewsStatus.error,
        errorMessage: error.errorMessage,
      ),
      (news) {
        final currentNews = state.news ?? [];
        final newNews =
            news.where((element) => !currentNews.contains(element)).toList();
        state = state.copyWith(
          news: [...currentNews, ...newNews],
          page: page + 1,
          newsStatus: NewsStatus.loaded,
        );
      },
    );
  }
}
