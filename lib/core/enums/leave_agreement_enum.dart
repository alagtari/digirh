import 'package:flutter/material.dart';

enum LeaveAgreementEnum { waiting, accepted, rejected }

String leaveAgreementToString(LeaveAgreementEnum agreement) {
  switch (agreement) {
    case LeaveAgreementEnum.waiting:
      return "En attente";
    case LeaveAgreementEnum.accepted:
      return "Accepté";
    case LeaveAgreementEnum.rejected:
      return "Rejeté";
    default:
      return "";
  }
}

Color leaveAgreementToColor(LeaveAgreementEnum agreement) {
  switch (agreement) {
    case LeaveAgreementEnum.waiting:
      return const Color(0xFFFFC256);
    case LeaveAgreementEnum.accepted:
      return const Color(0xFF34A853);
    case LeaveAgreementEnum.rejected:
      return const Color(0xFFEA4335);
  }
}
