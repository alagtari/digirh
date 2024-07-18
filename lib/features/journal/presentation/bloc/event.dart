part of 'bloc.dart';

@immutable
abstract class JournalEvent {
  const JournalEvent();
}

class AddJournalEvent extends JournalEvent {
  final JournalModel journal;
  const AddJournalEvent({
    required this.journal,
  });
}

class UpdateJournalEvent extends JournalEvent {
  final JournalModel journal;
  final String id;

  const UpdateJournalEvent({
    required this.journal,
    required this.id,
  });
}

class GetJournalsEvent extends JournalEvent {}

class DeleteJournalEvent extends JournalEvent {
  final String id;
  const DeleteJournalEvent({
    required this.id,
  });
}
