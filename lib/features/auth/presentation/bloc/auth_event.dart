part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final AuthRequestModel request;
  const LoginEvent({required this.request});
}

class ForgotPasswordEmailEvent extends AuthEvent {
  final String email;
  const ForgotPasswordEmailEvent({required this.email});
}

class ResendCodeEvent extends AuthEvent {
  final String email;
  const ResendCodeEvent({required this.email});
}

class LogoutEvent extends AuthEvent {}
