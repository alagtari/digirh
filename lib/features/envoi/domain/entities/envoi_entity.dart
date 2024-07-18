import 'package:equatable/equatable.dart';

class EnvoiEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String image;
  final DateTime date;

  const EnvoiEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.date,
  });

  @override
  List<Object> get props => [];
}
