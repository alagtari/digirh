import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

class DetailAccountCard extends StatelessWidget {
  const DetailAccountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteDarkColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "VIR ÉMIS DIGITAL EPARGNE MM AG",
              style: TextStyles.smallTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "1000.000 TND",
              style: TextStyles.largeTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            miniVerticalSpacer,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date Opération",
                      style: TextStyles.smallTextStyle.copyWith(),
                    ),
                    Text(
                      "18  juillet  2024",
                      style: TextStyles.mediumTextStyle.copyWith(
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
                      "Date Valeur",
                      style: TextStyles.smallTextStyle.copyWith(),
                    ),
                    Text(
                      "21  juillet  2024",
                      style: TextStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
