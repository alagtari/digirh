import 'package:digirh/core/enums/aggreement_leave_status.dart';
import 'package:digirh/core/enums/leave_status.dart';
import 'package:digirh/core/enums/leave_type.dart';
import 'package:digirh/features/conge/domain/entities/supervisor_conge_entity.dart';

class SupervisorLeaveModel extends SuprvsisorLeaveEntity {
  const SupervisorLeaveModel({
    super.id,
    super.staffId,
    required super.leaveType,
    required super.startDate,
    required super.endDate,
    required super.phone,
    required super.pay,
    super.status,
    required super.desisionStatus,
    required super.desisonId,
  });

  factory SupervisorLeaveModel.fromJson(Map<String, dynamic> json) {
    return SupervisorLeaveModel(
      id: json['id'],
      staffId: json['staffId'],
      leaveType: LeaveType.values[json['leaveType']],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      phone: json['phone'],
      pay: json['pay'],
      status: LeaveStatus.values[json['status']],
      desisionStatus: AgreementLeaveStatus.values[json['desision']],
      desisonId: json['desisionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  // Adding copyWith method
  SupervisorLeaveModel copyWith({
    LeaveType? leaveType,
    DateTime? startDate,
    DateTime? endDate,
    String? phone,
    String? pay,
    LeaveStatus? status,
    AgreementLeaveStatus? desisionStatus,
    String? desisonId,
  }) {
    return SupervisorLeaveModel(
      id: id,
      staffId: staffId,
      leaveType: leaveType ?? this.leaveType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      phone: phone ?? this.phone,
      pay: pay ?? this.pay,
      status: status ?? this.status,
      desisionStatus: desisionStatus ?? this.desisionStatus,
      desisonId: desisonId ?? this.desisonId,
    );
  }
}
