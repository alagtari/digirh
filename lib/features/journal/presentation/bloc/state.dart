part of 'bloc.dart';

@immutable
abstract class JournalState {
  const JournalState();
}

class JournalInitial extends JournalState {}

class GetJournalsLoading extends JournalState {}

class GetJournalsSuccess extends JournalState {
  final List<JournalModel> journals;
  const GetJournalsSuccess({
    required this.journals,
  });
}

class GetJournalsFailed extends JournalState {
  final String message;

  const GetJournalsFailed({
    required this.message,
  });
}

class AddJournalLoading extends JournalState {}

class AddJournalSuccess extends JournalState {}

class AddJournalFailed extends JournalState {
  final String message;

  const AddJournalFailed({
    required this.message,
  });
}

class UpdateJournalLoading extends JournalState {}

class UpdateJournalSuccess extends JournalState {}

class UpdateJournalFailed extends JournalState {
  final String message;

  const UpdateJournalFailed({
    required this.message,
  });
}

class DeleteJournalLoading extends JournalState {}

class DeleteJournalSuccess extends JournalState {}

class DeleteJournalFailed extends JournalState {
  final String message;

  const DeleteJournalFailed({
    required this.message,
  });
}
