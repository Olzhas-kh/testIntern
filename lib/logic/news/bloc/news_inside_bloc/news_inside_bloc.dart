import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/logic/news/models/news_inside_model.dart';
import 'package:test_intern/logic/news/repositories/news_inside_repository.dart';

part 'news_inside_event.dart';
part 'news_inside_state.dart';

class NewsInsideBloc extends Bloc<NewsInsideEvent, NewsInsideState> {
  final NewsInsideRepository newsInsideRepository;
  NewsInsideBloc(this.newsInsideRepository) : super(NewsInsideInitial()) {
    on<NewsInsideGetCommentEvent>((event, emit) async {
      emit(NewsInsideLoading());
      try {
        final List<NewsInsideModel> response =
            await newsInsideRepository.getNewsComment();
        emit(NewsInsideSuccess(getNewsComment: response));
      } catch (e) {
        emit(NewsInsdeFailed(errorMessage: e.toString()));
      }
    });
  }
}
