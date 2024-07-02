import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable {
  final String accessToken;

  const AuthResponseEntity({
    required this.accessToken,
  });

  @override
  List<Object> get props => [];
}
