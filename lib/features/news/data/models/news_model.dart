import 'package:hive/hive.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';

part 'news_model.g.dart';

/// [NewsModel] is a class that extends the [NewsEntity] class.
/// This class is responsible for converting JSON data to a [NewsEntity] object.
@HiveType(typeId: 1)
final class NewsModel extends NewsEntity {
  const NewsModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }) : super(
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

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
  @override
  @HiveField(0)
  final String? author;

  @override
  @HiveField(1)
  final String? title;

  @override
  @HiveField(2)
  final String? description;

  @override
  @HiveField(3)
  final String? url;

  @override
  @HiveField(4)
  final String? urlToImage;

  @override
  @HiveField(5)
  final String? publishedAt;

  @override
  @HiveField(6)
  final String? content;
}
