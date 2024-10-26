part of 'bloc.dart';

@immutable
abstract class CongeEvent {
  const CongeEvent();
}

class AddCongeEvent extends CongeEvent {
  final LeaveModel conge;
  const AddCongeEvent({
    required this.conge,
  });
}

class UpdateCongeEvent extends CongeEvent {
  final LeaveModel conge;
  final String id;

  const UpdateCongeEvent({
    required this.conge,
    required this.id,
  });
}

class SubmitCongeEvent extends CongeEvent {
  final String congeId;

  const SubmitCongeEvent({
    required this.congeId,
  });
}

class GetCongesEvent extends CongeEvent {}

class GetSupervisorCongesEvent extends CongeEvent {}

class GetCongeSupervisorsEvent extends CongeEvent {
  final String congeId;

  const GetCongeSupervisorsEvent({required this.congeId});
}

class DeleteCongeEvent extends CongeEvent {
  final String id;
  const DeleteCongeEvent({
    required this.id,
  });
}

class AcceptCongeEvent extends CongeEvent {
  final String congeId;

  const AcceptCongeEvent({
    required this.congeId,
  });
}

class RejectCongeEvent extends CongeEvent {
  final String congeId;

  const RejectCongeEvent({
    required this.congeId,
  });
}
