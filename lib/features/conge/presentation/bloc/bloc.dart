import 'package:bloc/bloc.dart';
import 'package:digirh/core/enums/aggreement_leave_status.dart';
import 'package:digirh/core/enums/leave_status.dart';
import 'package:digirh/features/conge/data/models/supervisor_conge_model.dart';
import 'package:digirh/features/conge/data/models/supervisor_model.dart';
import 'package:flutter/foundation.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/conge/domain/repositories/conge_repository.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';
part 'event.dart';
part 'state.dart';

class CongeBloc extends Bloc<CongeEvent, CongeState> {
  final _repo = sl<CongeRepository>();
  List<LeaveModel> _conges = [];
  List<LeaveModel> get conges => _conges;

  List<SupervisorLeaveModel> _supervisorConges = [];
  List<SupervisorLeaveModel> get supervisorConges => _supervisorConges;

  CongeBloc() : super(CongeInitial()) {
    on<CongeEvent>((event, emit) {});
    on<GetCongesEvent>(
      (event, emit) async {
        emit(GetCongesLoading());
        final res = await _repo.getConges();
        res.fold(
          (l) => emit(GetCongesFailed(message: l.message)),
          (r) {
            _conges = r.payload!;
            emit(GetCongesSuccess(conges: r.payload!));
          },
        );
      },
    );

    on<GetSupervisorCongesEvent>(
      (event, emit) async {
        emit(GetSupervisorCongesLoading());
        final res = await _repo.getSupervisorConges();
        res.fold(
          (l) => emit(GetSupervisorCongesFailed(message: l.message)),
          (r) {
            _supervisorConges = r.payload!;
            emit(GetSupervisorCongesSuccess(conges: r.payload!));
          },
        );
      },
    );

    on<GetCongeSupervisorsEvent>(
      (event, emit) async {
        emit(GetCongeSupervisorsLoading());
        final res = await _repo.getCongeSupervisors(event.congeId);
        res.fold(
          (l) => emit(GetCongeSupervisorsFailed(message: l.message)),
          (r) {
            emit(GetCongeSupervisorsSuccess(supervisors: r.payload!));
          },
        );
      },
    );

    on<AddCongeEvent>(
      (event, emit) async {
        emit(AddCongeLoading());
        final res = await _repo.addConge(event.conge);
        res.fold(
          (l) => emit(AddCongeFailed(message: l.message)),
          (r) {
            _conges.insert(0, r.payload!);
            emit(AddCongeSuccess(conges: _conges));
          },
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

    on<SubmitCongeEvent>(
      (event, emit) async {
        emit(SubmitCongeLoading());
        final res = await _repo.submitConge(event.congeId);
        res.fold(
          (l) => emit(SubmitCongeFailed(message: l.message)),
          (r) {
            int index =
                _conges.indexWhere((leave) => leave.id == event.congeId);
            _conges[index] =
                _conges[index].copyWith(status: LeaveStatus.pending);
            emit(SubmitCongeSuccess(conges: _conges));
          },
        );
      },
    );
    on<DeleteCongeEvent>(
      (event, emit) async {
        emit(DeleteCongeLoading());
        final res = await _repo.deleteConge(event.id);
        res.fold(
          (l) => emit(DeleteCongeFailed(message: l.message)),
          (r) {
            _conges.removeWhere((conge) => conge.id == event.id);
            emit(DeleteCongeSuccess(conges: _conges));
          },
        );
      },
    );

    on<AcceptCongeEvent>(
      (event, emit) async {
        emit(AcceptCongeLoading());
        final res = await _repo.acceptConge(event.congeId);
        res.fold(
          (l) => emit(AcceptCongeFailed(message: l.message)),
          (r) {
            int index = _supervisorConges
                .indexWhere((leave) => leave.id == event.congeId);
            _supervisorConges[index] = _supervisorConges[index]
                .copyWith(desisionStatus: AgreementLeaveStatus.accepted);
            emit(AcceptCongeSuccess(conges: _supervisorConges));
          },
        );
      },
    );

    on<RejectCongeEvent>(
      (event, emit) async {
        emit(RejectCongeLoading());
        final res = await _repo.rejectConge(event.congeId);
        res.fold(
          (l) => emit(RejectCongeFailed(message: l.message)),
          (r) {
            int index = _supervisorConges
                .indexWhere((leave) => leave.id == event.congeId);
            _supervisorConges[index] = _supervisorConges[index]
                .copyWith(desisionStatus: AgreementLeaveStatus.rejected);
            emit(RejectCongeSuccess(conges: _supervisorConges));
          },
        );
      },
    );
  }
}
