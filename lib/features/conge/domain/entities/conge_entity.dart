import 'package:equatable/equatable.dart';

class CongeEntity extends Equatable {
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final String ref;
  final String state;

  const CongeEntity({
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.ref,
    required this.state,
  });

  @override
  List<Object> get props => [];
}
