import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/envoi/domain/repositories/envoi_repository.dart';
import 'package:digirh/features/envoi/data/models/envoi_model.dart';
part 'event.dart';
part 'state.dart';

class EnvoiBloc extends Bloc<EnvoiEvent, EnvoiState> {
  final _repo = sl<EnvoiRepository>();

  EnvoiBloc() : super(EnvoiInitial()) {
    on<EnvoiEvent>((event, emit) {});
    on<GetEnvoisEvent>(
      (event, emit) async {
        emit(GetEnvoisLoading());
        final res = await _repo.getEnvois();
        res.fold(
          (l) => emit(GetEnvoisFailed(message: l.message)),
          (r) => emit(GetEnvoisSuccess(envois : r.payload!)),
        );
      },
    );

    on<AddEnvoiEvent>(
      (event, emit) async {
        emit(AddEnvoiLoading());
        final res = await _repo.addEnvoi(event.envoi);
        res.fold(
          (l) => emit(AddEnvoiFailed(message: l.message)),
          (r) => emit(AddEnvoiSuccess()),
        );
      },
    );
    on<UpdateEnvoiEvent>(
      (event, emit) async {
        emit(UpdateEnvoiLoading());
        final res = await _repo.updateEnvoi(event.envoi,event.id);
        res.fold(
          (l) => emit(UpdateEnvoiFailed(message: l.message)),
          (r) => emit(UpdateEnvoiSuccess()),
        );
      },
    );
     on<DeleteEnvoiEvent>(
      (event, emit) async {
        emit(DeleteEnvoiLoading());
        final res = await _repo.deleteEnvoi(event.id);
        res.fold(
          (l) => emit(DeleteEnvoiFailed(message: l.message)),
          (r) => emit(DeleteEnvoiSuccess()),
        );
      },
    );

  }
  
}
