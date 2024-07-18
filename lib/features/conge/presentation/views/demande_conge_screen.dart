import 'package:auto_route/auto_route.dart';
import 'package:digirh/common_widgets/app_botton.dart';
import 'package:digirh/common_widgets/app_form_field.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class DemandeCongeScreen extends StatefulWidget {
  const DemandeCongeScreen({super.key});

  @override
  State<DemandeCongeScreen> createState() => _DemandeCongeScreenState();
}

class _DemandeCongeScreenState extends State<DemandeCongeScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var usernameController;
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .075,
        ),
        child: Column(
          children: [
            largeVerticalSpacer,
            Row(
              children: [
                GestureDetector(
                  onTap: () => context.router.back(),
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.whiteDarkColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/arrow_back.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Demande congé',
                      style: TextStyles.extraExtraLargeTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                )
              ],
            ),
            extraLargeVerticalSpacer,
            AppFormField(
              color: AppColors.whiteDarkColor,
              textColor: AppColors.greyExtraDarkColor,
              hintText: "Type congé",
              controller: controller,
              prefixIcon: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/document.svg',
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              color: AppColors.whiteDarkColor,
              textColor: AppColors.greyExtraDarkColor,
              hintText: "Date début",
              controller: controller,
              prefixIcon: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/conge.svg',
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              color: AppColors.whiteDarkColor,
              textColor: AppColors.greyExtraDarkColor,
              hintText: "Date fin",
              controller: controller,
              prefixIcon: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/conge.svg',
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              color: AppColors.whiteDarkColor,
              textColor: AppColors.greyExtraDarkColor,
              hintText: "Remplaçant",
              controller: controller,
              prefixIcon: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/user.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColors.greyExtraDarkColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              color: AppColors.whiteDarkColor,
              textColor: AppColors.greyExtraDarkColor,
              hintText: "Pay",
              controller: controller,
              prefixIcon: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/location.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColors.greyExtraDarkColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            extraExtraLargeVerticalSpacer,
            AppBotton(bottonText: "Ajouter", onClick: () {}),
          ],
        ),
      ),
    );
  }
}
