import 'package:digirh/features/envoi/domain/entities/envoi_entity.dart';

class EnvoiModel extends EnvoiEntity {
  const EnvoiModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.image,
    required super.date,
  });

  factory EnvoiModel.fromJson(Map<String, dynamic> json) {
    return EnvoiModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
