enum LeaveType { repos, maladie, annuelle, maternite, paternite }

String leaveTypeToString(LeaveType type) {
  switch (type) {
    case LeaveType.repos:
      return "conge de repos";
    case LeaveType.maladie:
      return "conge de maladie";
    case LeaveType.annuelle:
      return "conge annuelle";
    case LeaveType.maternite:
      return "conge de maternité";
    case LeaveType.paternite:
      return "conge de paternité";
    default:
      return "";
  }
}
