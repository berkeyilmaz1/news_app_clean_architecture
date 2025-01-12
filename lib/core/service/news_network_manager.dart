import 'package:dio/dio.dart';
import 'package:news_app/features/news/data/datasource/news_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// [NewsNetworkManager] is a class that defines the methods that are used to
/// make network requests.
/// It's used by the [NewsService] class to make network requests.
/// The class currently only includes the GET method. Other methods such as POST, PUT, DELETE
/// can be added if needed, but they are not included here as they are not required at the moment.
final class NewsNetworkManager {
  NewsNetworkManager({
    required Dio dio,
    required String baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );
  }

  final Dio _dio;
  final String _baseUrl;

  ///MARK: GET METHOD
  Future<Response<T>> get<T>(
    String path, {
    required Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: Options(),
    );
    return response;
  }
}
