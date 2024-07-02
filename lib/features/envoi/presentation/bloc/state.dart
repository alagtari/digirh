part of 'bloc.dart';

@immutable
abstract class EnvoiState {
  const EnvoiState();
}

class EnvoiInitial extends EnvoiState {}

class GetEnvoisLoading extends EnvoiState {}

class GetEnvoisSuccess extends EnvoiState {
  final List<EnvoiModel> envois;
  const GetEnvoisSuccess({
    required this.envois,
  });
}

class GetEnvoisFailed extends EnvoiState {
  final String message;

  const GetEnvoisFailed({
    required this.message,
  });
}

class AddEnvoiLoading extends EnvoiState {}

class AddEnvoiSuccess extends EnvoiState {}

class AddEnvoiFailed extends EnvoiState {
  final String message;

  const AddEnvoiFailed({
    required this.message,
  });
}

class UpdateEnvoiLoading extends EnvoiState {}

class UpdateEnvoiSuccess extends EnvoiState {}

class UpdateEnvoiFailed extends EnvoiState {
  final String message;

  const UpdateEnvoiFailed({
    required this.message,
  });
}

class DeleteEnvoiLoading extends EnvoiState {}

class DeleteEnvoiSuccess extends EnvoiState {}

class DeleteEnvoiFailed extends EnvoiState {
  final String message;

  const DeleteEnvoiFailed({
    required this.message,
  });
}
