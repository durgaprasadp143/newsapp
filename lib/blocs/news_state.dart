part of 'news_bloc.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<NewsArticle> articles;

  NewsLoadedState(this.articles);
}

class NewsErrorState extends NewsState{
  final String error;

  NewsErrorState(this.error);
}