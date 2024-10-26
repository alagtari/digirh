import 'package:digirh/core/enums/leave_agreement_enum.dart';
import 'package:equatable/equatable.dart';

class SupervisorEntity extends Equatable {
  final String id;
  final String prenom;
  final String nom;
  final String image;
  final LeaveAgreementEnum accord;
  final DateTime createdAt;
  final DateTime lastModified;

  const SupervisorEntity({
    required this.id,
    required this.prenom,
    required this.nom,
    required this.image,
    required this.accord,
    required this.createdAt,
    required this.lastModified,
  });

  @override
  List<Object?> get props => [id];
}
