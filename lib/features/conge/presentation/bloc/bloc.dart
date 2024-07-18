import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/conge/domain/repositories/conge_repository.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';
part 'event.dart';
part 'state.dart';

class CongeBloc extends Bloc<CongeEvent, CongeState> {
  final _repo = sl<CongeRepository>();

  CongeBloc() : super(CongeInitial()) {
    on<CongeEvent>((event, emit) {});
    on<GetCongesEvent>(
      (event, emit) async {
        emit(GetCongesLoading());
        final res = await _repo.getConges();
        res.fold(
          (l) => emit(GetCongesFailed(message: l.message)),
          (r) => emit(GetCongesSuccess(conges : r.payload!)),
        );
      },
    );

    on<AddCongeEvent>(
      (event, emit) async {
        emit(AddCongeLoading());
        final res = await _repo.getConges();
        res.fold(
          (l) => emit(AddCongeFailed(message: l.message)),
          (r) => emit(AddCongeSuccess()),
        );
      },
    );
    on<UpdateCongeEvent>(
      (event, emit) async {
        emit(UpdateCongeLoading());
        final res = await _repo.getConges();
        res.fold(
          (l) => emit(UpdateCongeFailed(message: l.message)),
          (r) => emit(UpdateCongeSuccess()),
        );
      },
    );
     on<DeleteCongeEvent>(
      (event, emit) async {
        emit(DeleteCongeLoading());
        final res = await _repo.getConges();
        res.fold(
          (l) => emit(DeleteCongeFailed(message: l.message)),
          (r) => emit(DeleteCongeSuccess()),
        );
      },
    );

  }
  
}
