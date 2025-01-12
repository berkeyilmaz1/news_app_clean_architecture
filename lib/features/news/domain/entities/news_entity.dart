import 'package:equatable/equatable.dart';

/// NewsEntity is a class that represents the news entity in the domain layer.
/// It extends Equatable which is a class that helps to compare objects of the same type.

class NewsEntity extends Equatable {
  const NewsEntity({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final String? author;

  final String? title;

  final String? description;

  final String? url;

  final String? urlToImage;

  final String? publishedAt;

  final String? content;

  @override
  List<Object?> get props =>
      [author, title, description, url, urlToImage, publishedAt, content];
}
