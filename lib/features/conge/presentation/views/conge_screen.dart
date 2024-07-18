import 'package:auto_route/auto_route.dart';
import 'package:digirh/core/routes/app_router.gr.dart';
import 'package:digirh/features/conge/presentation/widgets/conge_card.dart';
import 'package:digirh/main.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CongeScreen extends StatefulWidget {
  const CongeScreen({super.key});

  @override
  State<CongeScreen> createState() => _CongeScreenState();
}

class _CongeScreenState extends State<CongeScreen> {
  @override
  Widget build(BuildContext context) {
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
                  onTap: () => MyApp.scaffoldKey.currentState?.openDrawer(),
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.whiteDarkColor,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/menu.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Congé',
                      style: TextStyles.extraExtraLargeTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.whiteDarkColor,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/notification.svg',
                  ),
                )
              ],
            ),
            smallVerticalSpacer,
            Text(
              "59",
              style: TextStyles.extraExtraLargeTextStyle.copyWith(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Encore congé annuelle par jour",
              style: TextStyles.mediumTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            extraSmallVerticalSpacer,
            GestureDetector(
              onTap: () => context.router.push(const DemandeCongeRoute()),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primaryDarkColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/plus_outline.svg"),
                    miniHorizantalSpacer,
                    Text(
                      "Nouvelle demande de congé",
                      style: TextStyles.mediumTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteDarkColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            smallVerticalSpacer,
            const CongeCard()
          ],
        ),
      ),
    );
  }
}
