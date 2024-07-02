import 'package:digirh/features/home/presentation/widgets/drawer_menu_item_widget.dart';
import 'package:digirh/main.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xFFF2F2F2),
        child: SafeArea(
          child: Column(
            children: [
              mediumVerticalSpacer,
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  GestureDetector(
                    onTap: () => MyApp.scaffoldKey.currentState?.closeDrawer(),
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.whiteDarkColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/close.svg',
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              extraMiniVerticalSpacer,
              Text(
                "Makrem Taieb",
                style: TextStyles.mediumTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Ingénieur Informaticien",
                style: TextStyles.mediumTextStyle.copyWith(
                  // fontWeight: FontWeight.bold,
                ),
              ),
              mediumVerticalSpacer,
              const Row(
                children: [
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/home.svg',
                    title: 'Acceuil',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/cartes.svg',
                    title: 'Cartes',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/wallet.svg',
                    title: 'Wallet',
                  ),
                ],
              ),
              const Row(
                children: [
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/conge.svg',
                    title: 'Congé',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/user.svg',
                    title: 'Profile',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
