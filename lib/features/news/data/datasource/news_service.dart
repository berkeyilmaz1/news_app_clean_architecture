import 'package:dio/dio.dart';
import 'package:news_app/config/constants/service_paths.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/config/env/app_environment.dart';
import 'package:news_app/config/errors/exceptions/exceptions.dart';
import 'package:news_app/core/service/enums/network_manager_queries.dart';
import 'package:news_app/core/service/news_network_manager.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

abstract class INewsService {
  Future<List<NewsModel>> getNews({required String query, required int page});
}

/// [NewsService] is a class that implements the [INewsService] class.
/// This class is responsible for fetching news data from the network.
final class NewsService implements INewsService {
  NewsService({required NewsNetworkManager newsNetworkManager})
      : _newsNetworkManager = newsNetworkManager;

  final NewsNetworkManager _newsNetworkManager;
  @override
  Future<List<NewsModel>> getNews({
    required String query,
    required int page,
  }) async {
    try {
      final response = await _newsNetworkManager.get<Map<String, dynamic>>(
        ServicePaths.news,
        queryParameters: Map.fromEntries([
          NetworkManagerQueries.makeQuery(
            query: NetworkManagerQueries.q,
            value: query,
          ),
          NetworkManagerQueries.makeQuery(
            query: NetworkManagerQueries.apiKey,
            value: AppEnvironmentItems.apiKey.value,
          ),
          NetworkManagerQueries.makeQuery(
            query: NetworkManagerQueries.pageSize,
            value: StringConstants.pageSize,
          ),
          NetworkManagerQueries.makeQuery(
            query: NetworkManagerQueries.page,
            value: page.toString(),
          ),
        ]),
      );
      if (response.data == null) throw NullResponseException();
      final news = response.data!['articles'] as List;

      return news
          .map((item) => NewsModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        message: e.message,
      );
    } on Exception catch (_) {
      throw ServerException();
    }
  }
}
