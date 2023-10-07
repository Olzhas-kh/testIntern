
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_intern/logic/check/models/check_model.dart';
import 'package:test_intern/logic/check/repositories/check_repository.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
      final CheckRepository checkRepository;

  CheckBloc(this.checkRepository) : super(CheckInitial()) {
    on<CheckGetTodosEvents>((event, emit)async {
       emit(CheckLoading());
      try {
        final List<CheckModel> response = await checkRepository.getTodos();
        emit(CheckSuccess(getTodos: response));
      }catch (e) {
        emit(CheckFailed(errorMessage: e.toString()));
      }
    });
  }
}
