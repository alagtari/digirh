import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:digirh/core/injection/injection_container.dart';
import 'package:digirh/features/account/domain/repositories/account_repository.dart';
import 'package:digirh/features/account/data/models/account_model.dart';
part 'event.dart';
part 'state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final _repo = sl<AccountRepository>();

  AccountBloc() : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {});
    on<GetAccountsEvent>(
      (event, emit) async {
        emit(GetAccountsLoading());
        final res = await _repo.getAccounts();
        res.fold(
          (l) => emit(GetAccountsFailed(message: l.message)),
          (r) => emit(GetAccountsSuccess(accounts : r.payload!)),
        );
      },
    );

    on<AddAccountEvent>(
      (event, emit) async {
        emit(AddAccountLoading());
        final res = await _repo.getAccounts();
        res.fold(
          (l) => emit(AddAccountFailed(message: l.message)),
          (r) => emit(AddAccountSuccess()),
        );
      },
    );
    on<UpdateAccountEvent>(
      (event, emit) async {
        emit(UpdateAccountLoading());
        final res = await _repo.getAccounts();
        res.fold(
          (l) => emit(UpdateAccountFailed(message: l.message)),
          (r) => emit(UpdateAccountSuccess()),
        );
      },
    );
     on<DeleteAccountEvent>(
      (event, emit) async {
        emit(DeleteAccountLoading());
        final res = await _repo.getAccounts();
        res.fold(
          (l) => emit(DeleteAccountFailed(message: l.message)),
          (r) => emit(DeleteAccountSuccess()),
        );
      },
    );

  }
  
}
