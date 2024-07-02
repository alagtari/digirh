import 'package:flutter/material.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/radius.dart';
import 'package:digirh/theme/text_styles.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final bool? obscured;
  final void Function(String?)? onSubmitted;
  final TextEditingController controller;
  final bool readOnly;

  const AppFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscured = false,
    this.onSubmitted,
    required this.controller,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: AppColors.greyLightColor,
        borderRadius: BorderRadius.all(
          CustomRaius.smallRadius,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: obscured!,
          readOnly: readOnly,
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
