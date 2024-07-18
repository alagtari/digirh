import 'package:digirh/features/conge/domain/entities/conge_entity.dart';

class CongeModel extends CongeEntity {
  const CongeModel({
    required super.type,
    required super.startDate,
    required super.endDate,
    required super.ref,
    required super.state,
  });

  factory CongeModel.fromJson(Map<String, dynamic> json) {
    return CongeModel(
      type: json['type'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      ref: json['ref'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'startDate': startDate,
      'endDate': endDate,
      'ref': ref,
      'state': state,
    };
  }
}
