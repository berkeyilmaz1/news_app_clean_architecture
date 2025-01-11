import 'package:dartz/dartz.dart';
import 'package:news_app/config/errors/failures/failures.dart';
import 'package:news_app/features/news/domain/entities/news_entitiy.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<Either<Failure, List<NewsEntity>>> getNews({required String query}) {
    // TODO: implement getNews
    throw UnimplementedError();
  }
}
