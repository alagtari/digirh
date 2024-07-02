import 'package:equatable/equatable.dart';

class AuthRequestEntity extends Equatable {
  final String username;
  final String password;

  const AuthRequestEntity({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [];
}
