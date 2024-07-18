part of 'bloc.dart';

@immutable
abstract class CongeEvent {
  const CongeEvent();
}

class AddCongeEvent extends CongeEvent {
  final CongeModel conge;
  const AddCongeEvent({
    required this.conge,
  });
}

class UpdateCongeEvent extends CongeEvent {
  final CongeModel conge;
  final String id;

  const UpdateCongeEvent({
    required this.conge,
    required this.id,
  });
}

class GetCongesEvent extends CongeEvent {}

class DeleteCongeEvent extends CongeEvent {
  final String id;
  const DeleteCongeEvent({
    required this.id,
  });
}
