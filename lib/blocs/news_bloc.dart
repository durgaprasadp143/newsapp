import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/news_article.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/services/news_service.dart';


part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService _service;
  final List<NewsArticle> _articles = [];

  NewsBloc(this._service) : super(NewsInitialState()) {
    on<FetchNewsEvent>(_onFetchNews);
    on<LoadMoreNewsEvent>(_onLoadMoreNews);
    on<RefreshNewsEvent>(_onRefreshNews);
  }

  void _onFetchNews(FetchNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());
    try {

      final articles = await _service.fetchNewsArticles(1);
      _articles.addAll(articles);
      emit(NewsLoadedState(_articles));
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }

  void _onLoadMoreNews(LoadMoreNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());
    try {
      final  page = ((_articles.length / 10) + 1).round() ;
      final articles = await _service.fetchNewsArticles(page);
      _articles.addAll(articles);
      emit(NewsLoadedState(_articles));
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }

  void _onRefreshNews(RefreshNewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoadingState());
    try {
      _articles.clear();
      final articles = await _service.fetchNewsArticles(1);
      _articles.addAll(articles);
      emit(NewsLoadedState(_articles));
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }
}