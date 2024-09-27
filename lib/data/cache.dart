import 'package:hive/hive.dart';
import 'package:newsapp/models/news_article.dart';




class Cache {
  final Box<NewsArticle> _box;

  Cache(this._box);

  Future<void> cacheNewsArticles(List<NewsArticle> articles) async {

    await _box.putAll(articles.asMap());
  }

  Future<List<NewsArticle>> getNewsArticles() async {
    return _box.values.toList();
  }
}