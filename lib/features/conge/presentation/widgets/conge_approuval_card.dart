import 'package:digirh/core/enums/leave_agreement_enum.dart';
import 'package:digirh/core/util/utils.dart';
import 'package:digirh/features/conge/data/models/supervisor_model.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CongeApprouvalCard extends StatelessWidget {
  const CongeApprouvalCard({
    super.key,
    required this.supervisor,
  });

  final SupervisorModel supervisor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.appBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          smallHorizantalSpacer,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                supervisor.lastModified.formatDateToHumanString(),
                style: TextStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyExtraDarkColor,
                ),
              ),
              Text(
                "${supervisor.prenom} ${supervisor.nom}",
                style: TextStyles.largeTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyExtraDarkColor,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: leaveAgreementToColor(supervisor.accord).withOpacity(.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                leaveAgreementToString(supervisor.accord),
                style: TextStyles.smallTextStyle
                    .copyWith(color: leaveAgreementToColor(supervisor.accord)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
