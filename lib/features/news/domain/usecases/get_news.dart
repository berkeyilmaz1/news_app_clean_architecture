import 'package:dartz/dartz.dart';
import 'package:news_app/config/errors/failures/failures.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';

/// [GetNewsUseCase] is a class that implements the [UseCase] class.
/// This class is used to get news from the repository.
/// This class takes a [String] as a parameter and returns a [List<NewsEntity>]
/// or a [Failure].
final class GetNewsUseCase {
  GetNewsUseCase({required NewsRepository newsRepository})
      : _newsRepository = newsRepository;

  final NewsRepository _newsRepository;

  Future<Either<Failure, List<NewsEntity>>> call(String query, int page) {
    return _newsRepository.getNews(query: query, page: page);
  }
}
