import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class UnknownFailure extends Failure {}

class AppFailure extends Failure {
  AppFailure({
    required this.message,
  });

  final String message;
}
