import 'package:news_app/features/news/domain/entities/news_entitiy.dart';

/// [NewsModel] is a class that extends the [NewsEntity] class.
/// This class is responsible for converting JSON data to a [NewsEntity] object.
final class NewsModel extends NewsEntity {
  const NewsModel({
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }
}
