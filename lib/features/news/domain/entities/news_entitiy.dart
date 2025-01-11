import 'package:equatable/equatable.dart';

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
