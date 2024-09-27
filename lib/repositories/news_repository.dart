

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsapp/models/news_article.dart';

import '../data/cache.dart';
import '../utills/network_manager.dart';




class NewsRepository {
  final String _apiKey = '7e7cbe5e9f6743c0b2d4c6144f8f0f03';
  final String _baseUrl = 'https://newsapi.org/v2/everything';

  Future<List<NewsArticle>> fetchNewsArticles(int page) async {
    final box = await Hive.openBox<NewsArticle>('news_articles');
    final cache = Cache(box);

      bool isConnected = await NetworkManager().checkInternetConnection();
      if (isConnected) {
        final response = await http.get(Uri.parse('$_baseUrl?sources=techcrunch&apiKey=$_apiKey&page=$page'));

        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final articles = jsonData['articles'];

          List<NewsArticle> list = [];
          if (articles != null) {
            try {
              list =
                  articles.map<NewsArticle>((item) => NewsArticle.fromJson(item)).toList();
            }catch(e){
              print(e);
            }
          }
          await cache.cacheNewsArticles(list);
          return list;


      } else if(response.statusCode == 426){
          throw Exception(response.reasonPhrase??"Daily limit exceeded.");
        }


        else {

          throw Exception('Failed to load news articles');
      }


    }
      else {

       List<NewsArticle> cacheData = await cache.getNewsArticles();
       if(cacheData.isNotEmpty){
         return cacheData;
       }else {
         throw Exception('No internet connection');
       }
    }
  }
}