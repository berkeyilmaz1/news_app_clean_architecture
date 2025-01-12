import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/domain/entities/news_entitiy.dart';

/// [NewsState] class is a class that extends Equatable.
/// This class is used to manage the state of the news.
/// The state of the news is managed by the [isLoading], [news], and [errorMessage] properties.
final class NewsState extends Equatable {
  const NewsState({
    this.page = 1,
    this.isLoading = false,
    this.news,
    this.errorMessage,
  });

  final bool isLoading;
  final List<NewsEntity>? news;
  final String? errorMessage;
  final int page;

  @override
  List<Object?> get props => [isLoading, news, errorMessage, page];

  NewsState copyWith({
    bool? isLoading,
    List<NewsEntity>? news,
    String? errorMessage,
    int? page,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      news: news ?? this.news,
      errorMessage: errorMessage ?? this.errorMessage,
      page: page ?? this.page,
    );
  }
}
