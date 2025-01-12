import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/features/news/data/models/news_model.dart';

part 'news_cache_model.g.dart';

@HiveType(typeId: 0)
class NewsCacheModel extends HiveObject {
  NewsCacheModel({
    required this.query,
    required this.news,
  });
  @HiveField(0)
  final String query;

  @HiveField(1)
  final List<NewsModel> news;
}
