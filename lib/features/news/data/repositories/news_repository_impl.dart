import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/errors/failures/failures.dart';
import 'package:news_app/features/news/data/datasource/news_local_service.dart';
import 'package:news_app/features/news/data/datasource/news_service.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';

/// [NewsRepositoryImpl] is the implementation of the NewsRepository
/// It is responsible for fetching news data from the API and caching it locally.
final class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({
    required NewsService newsService,
    required NewsLocalService newsLocalService,
  })  : _newsService = newsService,
        _newsLocalService = newsLocalService;

  final NewsService _newsService;
  final NewsLocalService _newsLocalService;
  @override
  Future<Either<Failure, List<NewsModel>>> getNews({
    required String query,
    required int page,
  }) async {
    try {
      /// Because we only cache the first page
      if (page == 1) {
        final response = _newsLocalService.getCachedNews(query);
        if (response != null) {
          return Right(response.news);
        }
      }
      final response = await _newsService.getNews(query: query, page: page);

      /// Cache the first page
      if (page == 1) {
        await _newsLocalService.cacheNews(query, response);
      }
      return Right(response);
    } on DioException catch (e) {
      return Left(
        NetworkFailure(
          errorMessage: StringConstants.networkError,
        ),
      );
    } catch (e) {
      return Left(
        UnknownFailure(
          errorMessage: StringConstants.unknownFailure,
        ),
      );
    }
  }
}
