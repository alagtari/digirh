import 'package:auto_route/auto_route.dart';
import 'package:digirh/core/routes/app_router.gr.dart';
import 'package:digirh/features/home/presentation/widgets/general_info_widget.dart';
import 'package:digirh/features/home/presentation/widgets/quick_action_widget.dart';
import 'package:digirh/features/home/presentation/widgets/small_news_card_widget.dart';
import 'package:digirh/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .075,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  largeVerticalSpacer,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            MyApp.scaffoldKey.currentState?.openDrawer(),
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
                      extraSmallHorizantalSpacer,
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
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
                  const GeneralInfoWidget(),
                  smallVerticalSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuickActionWidget(
                        icon: 'assets/svg/envoi.svg',
                        title: 'Envoi',
                        onTap: () {
                          context.router.push(const EnvoiListRoute());
                        },
                      ),
                      QuickActionWidget(
                        icon: 'assets/svg/cheque.svg',
                        title: 'Cheque',
                        onTap: () {},
                      ),
                      QuickActionWidget(
                        icon: 'assets/svg/rib.svg',
                        title: 'RIB',
                        onTap: () {},
                      ),
                    ],
                  ),
                  smallVerticalSpacer,
                  Row(
                    children: [
                      Text(
                        "Actualités",
                        style: TextStyles.largeTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () => context.router.push(const NewsRoute()),
                        child: Text(
                          "plus",
                          style: TextStyles.mediumTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryDarkColor),
                        ),
                      ),
                    ],
                  ),
                  miniVerticalSpacer,
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 210,
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .075,
                ),
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const SmallNewsCardWidget();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
