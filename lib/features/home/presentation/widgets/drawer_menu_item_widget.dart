import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerMenuItemWidget extends StatelessWidget {
  const DrawerMenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25 - 20,
            height: MediaQuery.of(context).size.width * 0.25 - 20,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: AppColors.appBackgroundColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(
                AppColors.greyExtraDarkColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          extraExtraMiniVerticalSpacer,
          Text(
            title,
            style: TextStyles.smallTextStyle.copyWith(
              color: AppColors.greyExtraDarkColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
