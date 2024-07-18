import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/journal/domain/repositories/journal_repository.dart';
import 'package:digirh/features/journal/data/models/journal_model.dart';
part 'event.dart';
part 'state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final _repo = sl<JournalRepository>();

  JournalBloc() : super(JournalInitial()) {
    on<JournalEvent>((event, emit) {});
    on<GetJournalsEvent>(
      (event, emit) async {
        emit(GetJournalsLoading());
        final res = await _repo.getJournals();
        res.fold(
          (l) => emit(GetJournalsFailed(message: l.message)),
          (r) => emit(GetJournalsSuccess(journals : r.payload!)),
        );
      },
    );

    on<AddJournalEvent>(
      (event, emit) async {
        emit(AddJournalLoading());
        final res = await _repo.getJournals();
        res.fold(
          (l) => emit(AddJournalFailed(message: l.message)),
          (r) => emit(AddJournalSuccess()),
        );
      },
    );
    on<UpdateJournalEvent>(
      (event, emit) async {
        emit(UpdateJournalLoading());
        final res = await _repo.getJournals();
        res.fold(
          (l) => emit(UpdateJournalFailed(message: l.message)),
          (r) => emit(UpdateJournalSuccess()),
        );
      },
    );
     on<DeleteJournalEvent>(
      (event, emit) async {
        emit(DeleteJournalLoading());
        final res = await _repo.getJournals();
        res.fold(
          (l) => emit(DeleteJournalFailed(message: l.message)),
          (r) => emit(DeleteJournalSuccess()),
        );
      },
    );

  }
  
}
