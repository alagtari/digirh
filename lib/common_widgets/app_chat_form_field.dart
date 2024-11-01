import 'package:flutter/material.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/radius.dart';
import 'package:digirh/theme/text_styles.dart';

class AppChatFormField extends StatelessWidget {
  final String hintText;

  final void Function(String?)? onSubmitted;
  final TextEditingController controller;

  const AppChatFormField({
    super.key,
    required this.hintText,
    this.onSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: AppColors.appBackgroundColor,
        borderRadius: BorderRadius.all(
          CustomRaius.smallRadius,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onTap: () {},
          style: TextStyles.smallTextStyle.copyWith(
            color: AppColors.greyDarkColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
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
