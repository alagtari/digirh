import 'package:flutter/material.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/radius.dart';
import 'package:digirh/theme/text_styles.dart';

class AppSearchField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final void Function(String?)? onSubmitted;
  final TextEditingController controller;

  const AppSearchField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration:  BoxDecoration(
        color: AppColors.whiteDarkColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onTap: () {},
          style: TextStyles.mediumTextStyle.copyWith(
            color: AppColors.greyDarkColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 14),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: AppColors.greyDarkColor,
            ),
          ),
        ),
      ),
    );
  }
}
