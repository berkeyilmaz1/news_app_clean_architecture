import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/config/errors/failures/failures.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/usecases/get_news.dart';
import 'package:news_app/features/news/presentation/providers/news_state.dart';

/// [NewsNotifier] class is a class that extends StateNotifier.
/// This class is used to manage the state of the news.
final class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(this.getNewsUseCase) : super(const NewsState());

  final GetNewsUseCase getNewsUseCase;

  Future<void> getNews(String query) async {
    changeLoading();
    final result = await getNewsUseCase.call(query, 1);
    result.fold(errorState, (news) {
      state = state.copyWith(
        news: news,
        searchHistory: state.searchHistory?.contains(query) ?? false
            ? state.searchHistory
            : [...state.searchHistory ?? [], query],
        newsStatus: NewsStatus.loaded,
      );
    });
  }

  Future<void> loadNews(String query) async {
    changeLoading();
    final page = state.page;
    final result = await getNewsUseCase.call(query, page);

    result.fold(
      errorState,
      (news) {
        final currentNews = state.news ?? [];
        final newNews = checkSameNews(news, currentNews);
        state = state.copyWith(
          news: [...currentNews, ...newNews],
          page: page + 1,
          newsStatus: NewsStatus.loaded,
        );
      },
    );
  }

  List<NewsEntity> checkSameNews(
    List<NewsEntity> news,
    List<NewsEntity> currentNews,
  ) {
    return news.where((element) => !currentNews.contains(element)).toList();
  }

  void errorState(Failure error) {
    state = state.copyWith(
      newsStatus: NewsStatus.error,
      errorMessage: error.errorMessage,
    );
  }

  void changeLoading() {
    state = state.copyWith(newsStatus: NewsStatus.loading);
  }
}
