part of 'bloc.dart';

@immutable
abstract class CongeState {
  const CongeState();
}

class CongeInitial extends CongeState {}

class GetCongesLoading extends CongeState {}

class GetCongesSuccess extends CongeState {
  final List<LeaveModel> conges;
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

class GetSupervisorCongesLoading extends CongeState {}

class GetSupervisorCongesSuccess extends CongeState {
  final List<SupervisorLeaveModel> conges;
  const GetSupervisorCongesSuccess({
    required this.conges,
  });
}

class GetSupervisorCongesFailed extends CongeState {
  final String message;

  const GetSupervisorCongesFailed({
    required this.message,
  });
}

class GetCongeSupervisorsLoading extends CongeState {}

class GetCongeSupervisorsSuccess extends CongeState {
  final List<SupervisorModel> supervisors;
  const GetCongeSupervisorsSuccess({
    required this.supervisors,
  });
}

class GetCongeSupervisorsFailed extends CongeState {
  final String message;

  const GetCongeSupervisorsFailed({
    required this.message,
  });
}

class AddCongeLoading extends CongeState {}

class AddCongeSuccess extends CongeState {
  final List<LeaveModel> conges;

  const AddCongeSuccess({required this.conges});
}

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

class SubmitCongeLoading extends CongeState {}

class SubmitCongeSuccess extends CongeState {
  final List<LeaveModel> conges;

  const SubmitCongeSuccess({required this.conges});
}

class SubmitCongeFailed extends CongeState {
  final String message;

  const SubmitCongeFailed({
    required this.message,
  });
}

class DeleteCongeLoading extends CongeState {}

class DeleteCongeSuccess extends CongeState {
  final List<LeaveModel> conges;
  const DeleteCongeSuccess({
    required this.conges,
  });
}

class DeleteCongeFailed extends CongeState {
  final String message;

  const DeleteCongeFailed({
    required this.message,
  });
}

class AcceptCongeLoading extends CongeState {}

class AcceptCongeSuccess extends CongeState {
  final List<SupervisorLeaveModel> conges;

  const AcceptCongeSuccess({required this.conges});
}

class AcceptCongeFailed extends CongeState {
  final String message;

  const AcceptCongeFailed({
    required this.message,
  });
}

class RejectCongeLoading extends CongeState {}

class RejectCongeSuccess extends CongeState {
  final List<SupervisorLeaveModel> conges;

  const RejectCongeSuccess({required this.conges});
}

class RejectCongeFailed extends CongeState {
  final String message;

  const RejectCongeFailed({
    required this.message,
  });
}
