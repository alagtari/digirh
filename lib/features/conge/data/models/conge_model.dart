import 'package:digirh/core/enums/leave_status.dart';
import 'package:digirh/core/enums/leave_type.dart';
import 'package:digirh/features/conge/domain/entities/conge_entity.dart';

class LeaveModel extends LeaveEntity {
  const LeaveModel({
    super.id,
    super.staffId,
    required super.leaveType,
    required super.startDate,
    required super.endDate,
    required super.phone,
    required super.pay,
    super.status,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) {
    return LeaveModel(
      id: json['id'],
      staffId: json['staffId'],
      leaveType: LeaveType.values[json['leaveType']],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      phone: json['phone'],
      pay: json['pay'],
      status: LeaveStatus.values[json['status']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'leave': {
        'id': id,
        'staffId': staffId,
        'leaveType': leaveType.index,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'phone': phone,
        'pay': pay,
        'status': status?.index,
      }
    };
  }

  // Adding copyWith method
  LeaveModel copyWith({
    LeaveType? leaveType,
    DateTime? startDate,
    DateTime? endDate,
    String? phone,
    String? pay,
    LeaveStatus? status,
  }) {
    return LeaveModel(
      id: id,
      staffId: staffId,
      leaveType: leaveType ?? this.leaveType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      phone: phone ?? this.phone,
      pay: pay ?? this.pay,
      status: status ?? this.status,
    );
  }
}
