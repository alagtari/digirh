import 'package:flutter/material.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/radius.dart';
import 'package:digirh/theme/text_styles.dart';

class AppTextarea extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final bool? obscured;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onSubmitted;
  final TextEditingController controller;

  const AppTextarea({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscured = false,
    this.validator,
    this.onSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.appBackgroundColor,
        borderRadius: BorderRadius.all(
          CustomRaius.smallRadius,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: obscured!,
          onTap: () {},
          style: TextStyles.smallTextStyle.copyWith(
            color: AppColors.greyDarkColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            contentPadding: const EdgeInsets.all(15.0),
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: AppColors.greyDarkColor,
            ),
          ),
          maxLines: 7,
        ),
      ),
    );
  }
}
