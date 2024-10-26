import 'package:digirh/core/enums/aggreement_leave_status.dart';
import 'package:digirh/core/enums/leave_status.dart';
import 'package:digirh/core/enums/leave_type.dart';
import 'package:equatable/equatable.dart';

class SuprvsisorLeaveEntity extends Equatable {
  final String? id;
  final String? staffId;
  final LeaveType leaveType;
  final DateTime startDate;
  final DateTime endDate;
  final String phone;
  final String pay;
  final LeaveStatus? status;
  final AgreementLeaveStatus desisionStatus;
  final String desisonId;

  const SuprvsisorLeaveEntity({
    this.id,
    this.staffId,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.phone,
    required this.pay,
    this.status,
    required this.desisionStatus,
    required this.desisonId,
  });

  @override
  List<Object?> get props => [id];
}
