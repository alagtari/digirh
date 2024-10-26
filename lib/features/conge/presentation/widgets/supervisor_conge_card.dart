import 'package:digirh/core/enums/aggreement_leave_status.dart';
import 'package:digirh/core/enums/leave_type.dart';
import 'package:digirh/core/util/utils.dart';
import 'package:digirh/features/conge/data/models/supervisor_conge_model.dart';
import 'package:digirh/features/conge/presentation/widgets/accept_reject_conge_dialog.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

class SupervisorCongeCard extends StatelessWidget {
  const SupervisorCongeCard({
    super.key,
    required this.conge,
    required this.onAccept,
    required this.onReject,
  });

  final SupervisorLeaveModel conge;
  final Function onAccept;
  final Function onReject;

  @override
  Widget build(BuildContext context) {
    final statusColor = agreementLeaveStatusToColor(conge.desisionStatus);
    return GestureDetector(
      onTap: () {
        if (conge.desisionStatus == AgreementLeaveStatus.waiting) {
          showDialog(
            context: context,
            builder: (context) {
              return AcceptRejectCongeDialog(
                onAccept: onAccept,
                onReject: onReject,
              );
            },
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteDarkColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Demande ${leaveTypeToString(conge.leaveType)}",
              style: TextStyles.largeTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            extraMiniVerticalSpacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  style: TextStyles.smallTextStyle.copyWith(),
                ),
                Text(
                  "${conge.startDate.formatDateToHumanString()} - ${conge.endDate.formatDateToHumanString()}",
                  style: TextStyles.smallTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            extraMiniVerticalSpacer,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Durée",
                      style: TextStyles.smallTextStyle.copyWith(),
                    ),
                    Text(
                      "${conge.startDate.daysBetweenTwoDays(conge.endDate)} jours",
                      style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                largeHorizantalSpacer,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Localisation",
                      style: TextStyles.smallTextStyle.copyWith(),
                    ),
                    Text(
                      conge.pay,
                      style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Container(
                  width: 90,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      agreementLeaveStatusToString(conge.desisionStatus),
                      style: TextStyles.smallTextStyle
                          .copyWith(color: statusColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
