part of 'news_bloc.dart';
abstract class NewsEvent {}

class FetchNewsEvent extends NewsEvent {}

class LoadMoreNewsEvent extends NewsEvent {}

class RefreshNewsEvent extends NewsEvent {}