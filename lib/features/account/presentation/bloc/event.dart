part of 'bloc.dart';

@immutable
abstract class AccountEvent {
  const AccountEvent();
}

class AddAccountEvent extends AccountEvent {
  final AccountModel account;
  const AddAccountEvent({
    required this.account,
  });
}

class UpdateAccountEvent extends AccountEvent {
  final AccountModel account;
  final String id;

  const UpdateAccountEvent({
    required this.account,
    required this.id,
  });
}

class GetAccountsEvent extends AccountEvent {}

class DeleteAccountEvent extends AccountEvent {
  final String id;
  const DeleteAccountEvent({
    required this.id,
  });
}
