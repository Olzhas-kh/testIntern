part of 'news_inside_bloc.dart';


abstract class NewsInsideState {}

class NewsInsideInitial extends NewsInsideState {}

class NewsInsideLoading extends NewsInsideState{}

class NewsInsideSuccess extends NewsInsideState{
  final List<NewsInsideModel> getNewsComment;

  NewsInsideSuccess({required this.getNewsComment});
}

class NewsInsdeFailed extends NewsInsideState{
  final String errorMessage;

  NewsInsdeFailed({required this.errorMessage});
}