import 'package:digirh/core/enums/leave_status.dart';
import 'package:digirh/core/enums/leave_type.dart';
import 'package:digirh/core/util/utils.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';
import 'package:digirh/features/conge/presentation/widgets/approval_bottom_sheet.dart';
import 'package:digirh/features/conge/presentation/widgets/controls_dialog.dart';
import 'package:digirh/features/conge/presentation/widgets/draft_dialog.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CongeCard extends StatelessWidget {
  const CongeCard({
    super.key,
    required this.conge,
    required this.onDelete,
    required this.onSubmit,
  });

  final LeaveModel conge;
  final Function() onDelete;
  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    final statusColor = leaveStatusToColor(conge.status!);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ControlsDialog(onDelete: onDelete);
          },
        );
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
                GestureDetector(
                  onTap: () {
                    if (conge.status == LeaveStatus.draft) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DraftDialog(onSubmit: onSubmit);
                        },
                      );
                    } else {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ApprovalBottomSheet(
                            congeId: conge.id!,
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    width: 75,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        leaveStatusToString(conge.status!),
                        style: TextStyles.smallTextStyle
                            .copyWith(color: statusColor),
                      ),
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
