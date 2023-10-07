part of 'news_bloc.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsPostLoading extends NewsState {}

class NewsPostSuccess extends NewsState {
  final List<NewsModel> successNews;

  NewsPostSuccess({required this.successNews});
}

class NewsPostFailed extends NewsState {
  final String errorMessage;

  NewsPostFailed({required this.errorMessage});
}
