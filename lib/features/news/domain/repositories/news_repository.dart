import 'package:dartz/dartz.dart';
import 'package:news_app/config/errors/failures/failures.dart';
import 'package:news_app/features/news/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';

/// [NewsRepository] is an abstract class that defines the methods that must be
/// implemented by the [NewsRepositoryImpl] class.
abstract class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getNews({
    required String query,
    required int page,
  });
}
