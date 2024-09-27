import 'package:hive/hive.dart';
part 'news_article.g.dart';

@HiveType(typeId: 0)
class NewsArticle {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? url;
  @HiveField(3)
  final String? urlToImage;
  @HiveField(4)
  final String? author;
  @HiveField(5)
  final String? publishedAt;
  @HiveField(6)
  final String? content;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.author,
    required this.publishedAt,
    required this.content
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
        author:json['author'],
      publishedAt:json['publishedAt'],
        content:json['content']
    );
  }
}