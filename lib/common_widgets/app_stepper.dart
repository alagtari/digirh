import 'package:flutter/material.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/text_styles.dart';

class AppStepper extends StatelessWidget {
  const AppStepper({
    super.key,
    required this.step,
  });

  final int step;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryDarkColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Center(
            child: step == 1
                ? Text(
                    "1",
                    style: TextStyles.largeTextStyle.copyWith(
                        color: AppColors.whiteDarkColor,
                        fontWeight: FontWeight.w600),
                  )
                : const Icon(
                    Icons.check,
                    color: AppColors.whiteDarkColor,
                  ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: step > 1
                      ? AppColors.primaryDarkColor
                      : AppColors.appBackgroundColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        step >= 2
            ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryDarkColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: step == 2
                      ? Text(
                          "2",
                          style: TextStyles.largeTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.w600),
                        )
                      : const Icon(
                          Icons.check,
                          color: AppColors.whiteDarkColor,
                        ),
                ),
              )
            : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: AppColors.appBackgroundColor, width: 2)),
                child: Center(
                  child: Text(
                    "2",
                    style: TextStyles.largeTextStyle.copyWith(
                        color: AppColors.greyDarkColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: step > 2
                      ? AppColors.primaryDarkColor
                      : AppColors.appBackgroundColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        step == 3
            ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryDarkColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                    child: Text(
                  "3",
                  style: TextStyles.largeTextStyle.copyWith(
                      color: AppColors.whiteDarkColor,
                      fontWeight: FontWeight.w600),
                )),
              )
            : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: AppColors.appBackgroundColor, width: 2)),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyles.largeTextStyle.copyWith(
                        color: AppColors.greyDarkColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
      ],
    );
  }
}
