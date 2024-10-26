import 'package:flutter/material.dart';

enum AgreementLeaveStatus { waiting, accepted, rejected }

String agreementLeaveStatusToString(AgreementLeaveStatus status) {
  switch (status) {
    case AgreementLeaveStatus.waiting:
      return "En attente";
    case AgreementLeaveStatus.accepted:
      return "Accepté";
    case AgreementLeaveStatus.rejected:
      return "Rejeté";
    default:
      return "";
  }
}

Color agreementLeaveStatusToColor(AgreementLeaveStatus status) {
  switch (status) {
    case AgreementLeaveStatus.waiting:
      return const Color(0xFFFFC256);
    case AgreementLeaveStatus.accepted:
      return const Color(0xFF34A853);
    case AgreementLeaveStatus.rejected:
      return const Color(0xFFEA4335);
  }
}
