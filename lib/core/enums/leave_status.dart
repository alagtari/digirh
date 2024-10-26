import 'package:flutter/material.dart';

enum LeaveStatus { draft, pending, approved, rejected }

String leaveStatusToString(LeaveStatus status) {
  switch (status) {
    case LeaveStatus.draft:
      return "Draft";
    case LeaveStatus.pending:
      return "En cours";
    case LeaveStatus.approved:
      return "Approuvé";
    case LeaveStatus.rejected:
      return "Rejeté";
    default:
      return "";
  }
}

Color leaveStatusToColor(LeaveStatus status) {
  switch (status) {
    case LeaveStatus.draft:
      return const Color(0xFF048BCE);
    case LeaveStatus.pending:
      return const Color(0xFFFFC256);
    case LeaveStatus.approved:
      return const Color(0xFF34A853);
    case LeaveStatus.rejected:
      return const Color(0xFFEA4335);
  }
}
