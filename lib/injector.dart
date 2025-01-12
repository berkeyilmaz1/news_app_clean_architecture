import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/config/constants/service_paths.dart';
import 'package:news_app/core/service/news_network_manager.dart';
import 'package:news_app/features/news/data/datasource/news_local_service.dart'; // Import NewsLocalService
import 'package:news_app/features/news/data/datasource/news_service.dart';
import 'package:news_app/features/news/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';
import 'package:news_app/features/news/domain/usecases/get_news.dart';
import 'package:news_app/features/news/presentation/providers/news_notifiers.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Core
  getIt
    ..registerLazySingleton<Dio>(() {
      final dio = Dio();
      return dio;
    })
    ..registerLazySingleton<NewsNetworkManager>(
      () => NewsNetworkManager(
        dio: getIt(),
        baseUrl: ServicePaths.baseUrl,
      ),
    )

    // Data Sources
    ..registerLazySingleton<NewsService>(
      () => NewsService(newsNetworkManager: getIt()),
    )
    ..registerLazySingleton<NewsLocalService>(
      NewsLocalService.new,
    )

    // Repositories
    ..registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(
        newsService: getIt(),
        newsLocalService: getIt(),
      ),
    )

    // Use Cases
    ..registerLazySingleton(
      () => GetNewsUseCase(newsRepository: getIt()),
    )

    // Notifiers
    ..registerFactory(
      () => NewsNotifier(getIt()),
    );

  await getIt<NewsLocalService>().init();
}
