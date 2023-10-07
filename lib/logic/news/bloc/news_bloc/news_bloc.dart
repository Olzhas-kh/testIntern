import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/logic/news/models/news_model.dart';
import 'package:test_intern/logic/news/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<NewsPostEvent>((event, emit) async {
      emit(NewsPostLoading());
      try {
        final List<NewsModel> response = await newsRepository.getNewsPost();
        emit(NewsPostSuccess(successNews: response));
      }catch (e) {
        emit(NewsPostFailed(errorMessage: e.toString()));
      }
    });
  }
}
