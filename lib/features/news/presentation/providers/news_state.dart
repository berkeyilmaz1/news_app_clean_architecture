import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/domain/entities/news_entitiy.dart';

/// [NewsStatus] is an enum class.
/// This class is used to manage the status of the news.
/// This class has four properties: [initial], [loading], [loaded], [error].
enum NewsStatus { initial, loading, loaded, error }

/// [NewsState] class is a class that extends Equatable.
/// This class is used to manage the state of the news.
/// This class has four properties: [news], [page], [newsStatus].
final class NewsState extends Equatable {
  const NewsState({
    this.page = 1,
    this.news,
    this.newsStatus = NewsStatus.initial,
    this.errorMessage,
    this.searchHistory,
  });

  final List<NewsEntity>? news;
  final int page;
  final NewsStatus newsStatus;
  final String? errorMessage;
  final List<String>? searchHistory;

  @override
  List<Object?> get props =>
      [news, page, newsStatus, errorMessage, searchHistory];

  NewsState copyWith({
    List<NewsEntity>? news,
    int? page,
    NewsStatus? newsStatus,
    String? errorMessage,
    List<String>? searchHistory,
  }) {
    return NewsState(
      news: news ?? this.news,
      page: page ?? this.page,
      newsStatus: newsStatus ?? this.newsStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      searchHistory: searchHistory ?? this.searchHistory,
    );
  }
}
