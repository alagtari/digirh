import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.primaryDarkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "Récent",
                style: TextStyles.smallTextStyle.copyWith(
                  color: AppColors.whiteDarkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        smallHorizantalSpacer,
        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              // color: AppColors.primaryDarkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "Contact",
                style: TextStyles.smallTextStyle.copyWith(
                  // color: AppColors.whiteDarkColor,
                  color: AppColors.primaryDarkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        smallHorizantalSpacer,
        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              // color: AppColors.primaryDarkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "Favoris",
                style: TextStyles.smallTextStyle.copyWith(
                  // color: AppColors.whiteDarkColor,
                  color: AppColors.primaryDarkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
