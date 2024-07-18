import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JournalCard extends StatelessWidget {
  const JournalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: AppColors.whiteDarkColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "VIR ÉMIS DIGITAL ÉPARGNE MM",
            style: TextStyles.largeTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          extraMiniVerticalSpacer,
          Text(
            "Date Opération",
            style: TextStyles.smallTextStyle.copyWith(),
          ),
          Text(
            "18  juillet  2024",
            style: TextStyles.smallTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          extraMiniVerticalSpacer,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date valeur",
                    style: TextStyles.smallTextStyle.copyWith(),
                  ),
                  Text(
                    "21  juillet  2024",
                    style: TextStyles.smallTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              largeHorizantalSpacer,
              const Expanded(child: SizedBox()),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "1000 TND",
                  style: TextStyles.extraLargeTextStyle.copyWith(
                    color: AppColors.primaryDarkColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
