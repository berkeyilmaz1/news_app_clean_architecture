import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news/domain/usecases/get_news.dart';
import 'package:news_app/features/news/presentation/providers/news_state.dart';

/// [NewsNotifier] class is a class that extends StateNotifier.
/// This class is used to manage the state of the news.
final class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(this.getNewsUseCase) : super(const NewsState());
  final GetNewsUseCase getNewsUseCase;

  Future<void> getNews(String query) async {
    state = state.copyWith(isLoading: true);
    final result = await getNewsUseCase.call(query);
    state = state.copyWith(isLoading: false);
    result.fold(
      (error) => state = state.copyWith(errorMessage: error.errorMessage),
      (news) => state = state.copyWith(news: news),
    );
  }
}
