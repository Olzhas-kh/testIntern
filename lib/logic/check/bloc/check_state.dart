part of 'check_bloc.dart';

abstract class CheckState {}

class CheckInitial extends CheckState {}

class CheckLoading extends CheckState {}

class CheckSuccess extends CheckState {
  final List<CheckModel> getTodos;

  CheckSuccess({required this.getTodos});
}

class CheckFailed extends CheckState {
  final String errorMessage;

  CheckFailed({required this.errorMessage});
}