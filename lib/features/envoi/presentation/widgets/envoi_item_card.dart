import 'package:digirh/core/util/utils.dart';
import 'package:digirh/features/envoi/data/models/envoi_model.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EnvoiItemCard extends StatelessWidget {
  const EnvoiItemCard({
    super.key,
    required this.envoi,
  });

  final EnvoiModel envoi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.greyLessDarkColor,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          extraSmallHorizantalSpacer,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${envoi.firstName} ${envoi.lastName}",
                style: TextStyles.mediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyExtraDarkColor,
                ),
              ),
              Text(
                envoi.date.formatDateTimeToHumanString(),
                style: TextStyles.mediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyExtraDarkColor.withOpacity(.5),
                ),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset("assets/svg/star.svg"),
        ],
      ),
    );
  }
}
