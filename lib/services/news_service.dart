import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/repositories/news_repository.dart';

class NewsService {
  final NewsRepository _repository;

  NewsService(this._repository);

  Future<List<NewsArticle>> fetchNewsArticles(int page) async {
    return await _repository.fetchNewsArticles(page);
  }
}