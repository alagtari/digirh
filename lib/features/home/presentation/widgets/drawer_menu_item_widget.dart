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
      width: MediaQuery.of(context).size.width * 0.27,
      height: MediaQuery.of(context).size.width * 0.27,
      margin: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.031 - 7,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteDarkColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(
                Color(0xFF424242),
                BlendMode.srcIn,
              ),
            ),
          ),
          extraMiniVerticalSpacer,
          Text(
            title,
            style: TextStyles.mediumTextStyle.copyWith(
                color: const Color(0xFF424242), fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
