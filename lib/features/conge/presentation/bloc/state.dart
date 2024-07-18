part of 'bloc.dart';

@immutable
abstract class CongeState {
  const CongeState();
}

class CongeInitial extends CongeState {}

class GetCongesLoading extends CongeState {}

class GetCongesSuccess extends CongeState {
  final List<CongeModel> conges;
  const GetCongesSuccess({
    required this.conges,
  });
}

class GetCongesFailed extends CongeState {
  final String message;

  const GetCongesFailed({
    required this.message,
  });
}

class AddCongeLoading extends CongeState {}

class AddCongeSuccess extends CongeState {}

class AddCongeFailed extends CongeState {
  final String message;

  const AddCongeFailed({
    required this.message,
  });
}

class UpdateCongeLoading extends CongeState {}

class UpdateCongeSuccess extends CongeState {}

class UpdateCongeFailed extends CongeState {
  final String message;

  const UpdateCongeFailed({
    required this.message,
  });
}

class DeleteCongeLoading extends CongeState {}

class DeleteCongeSuccess extends CongeState {}

class DeleteCongeFailed extends CongeState {
  final String message;

  const DeleteCongeFailed({
    required this.message,
  });
}
