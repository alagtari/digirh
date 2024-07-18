import 'package:flutter/material.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/text_styles.dart';

class AppBotton extends StatelessWidget {
  const AppBotton({
    super.key,
    required this.bottonText,
    this.onClick,
  });
  final String bottonText;

  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.symmetric(
          horizontal: 80,
        ),
        decoration: BoxDecoration(
            color: AppColors.primaryDarkColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            bottonText,
            style: TextStyles.largeTextStyle.copyWith(
              color: AppColors.whiteDarkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
