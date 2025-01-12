import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/config/constants/string_constants.dart';
import 'package:news_app/features/news/data/models/news_cache_model.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

final class NewsLocalService {
  late Box<NewsCacheModel> _box;

  Future<void> init() async {
    Hive
      ..registerAdapter(NewsCacheModelAdapter())
      ..registerAdapter(NewsModelAdapter());
    _box = await Hive.openBox(StringConstants.cacheBoxName);
  }

  Future<void> cacheNews(String query, List<NewsModel> news) async {
    final cacheModel = NewsCacheModel(
      query: query,
      news: news,
    );
    await _box.put(query, cacheModel);
  }

  NewsCacheModel? getCachedNews(String query) {
    final data = _box.get(query);

    if (data == null) return null;
    return data;
  }

  Future<void> clearCache() async {
    await _box.clear();
  }
}
