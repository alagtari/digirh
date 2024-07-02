import 'package:digirh/features/envoi/domain/entities/envoi_entity.dart';

class EnvoiModel extends EnvoiEntity {
  EnvoiModel({
    required this.id,
  });
  final int id;

  factory EnvoiModel.fromJson(Map<String, dynamic> json) {
    return EnvoiModel(id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
