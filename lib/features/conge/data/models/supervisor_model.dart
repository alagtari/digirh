import 'package:digirh/core/enums/leave_agreement_enum.dart';
import 'package:digirh/features/conge/domain/entities/supervisor_entity.dart';

class SupervisorModel extends SupervisorEntity {
  const SupervisorModel({
    required super.id,
    required super.prenom,
    required super.nom,
    required super.image,
    required super.accord,
    required super.createdAt,
    required super.lastModified,
  });

  factory SupervisorModel.fromJson(Map<String, dynamic> json) {
    return SupervisorModel(
      id: json['id'],
      prenom: json['prenom'],
      nom: json['nom'],
      image: json['image'],
      accord: LeaveAgreementEnum.values[json['accord']],
      createdAt: DateTime.parse(json['createdAt']),
      lastModified: DateTime.parse(json['lastModified']),
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
