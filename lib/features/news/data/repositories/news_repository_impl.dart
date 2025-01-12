import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/errors/failures/failures.dart';
import 'package:news_app/features/news/data/datasource/news_service.dart';
import 'package:news_app/features/news/data/models/news_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';

/// [NewsRepositoryImpl] is the implementation of the NewsRepository
final class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required NewsService newsService})
      : _newsService = newsService;

  final NewsService _newsService;
  @override
  Future<Either<Failure, List<NewsModel>>> getNews({
    required String query,
    required int page,
  }) async {
    try {
      final response = await _newsService.getNews(query: query, page: page);
      return Right(response);
    } on DioException catch (_) {
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
