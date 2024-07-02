part of 'bloc.dart';

@immutable
abstract class EnvoiEvent {
  const EnvoiEvent();
}

class AddEnvoiEvent extends EnvoiEvent {
  final EnvoiModel envoi;
  const AddEnvoiEvent({
    required this.envoi,
  });
}

class UpdateEnvoiEvent extends EnvoiEvent {
  final EnvoiModel envoi;
  final String id;

  const UpdateEnvoiEvent({
    required this.envoi,
    required this.id,
  });
}

class GetEnvoisEvent extends EnvoiEvent {}

class DeleteEnvoiEvent extends EnvoiEvent {
  final String id;
  const DeleteEnvoiEvent({
    required this.id,
  });
}
