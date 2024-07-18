part of 'bloc.dart';

@immutable
abstract class AccountState {
  const AccountState();
}

class AccountInitial extends AccountState {}

class GetAccountsLoading extends AccountState {}

class GetAccountsSuccess extends AccountState {
  final List<AccountModel> accounts;
  const GetAccountsSuccess({
    required this.accounts,
  });
}

class GetAccountsFailed extends AccountState {
  final String message;

  const GetAccountsFailed({
    required this.message,
  });
}

class AddAccountLoading extends AccountState {}

class AddAccountSuccess extends AccountState {}

class AddAccountFailed extends AccountState {
  final String message;

  const AddAccountFailed({
    required this.message,
  });
}

class UpdateAccountLoading extends AccountState {}

class UpdateAccountSuccess extends AccountState {}

class UpdateAccountFailed extends AccountState {
  final String message;

  const UpdateAccountFailed({
    required this.message,
  });
}

class DeleteAccountLoading extends AccountState {}

class DeleteAccountSuccess extends AccountState {}

class DeleteAccountFailed extends AccountState {
  final String message;

  const DeleteAccountFailed({
    required this.message,
  });
}
