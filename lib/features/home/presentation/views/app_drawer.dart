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
        color: AppColors.whiteDarkColor,
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
                        color: AppColors.appBackgroundColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/close.svg',
                      ),
                    ),
                  )
                ],
              ),
              // Container(
              //   width: 150,
              //   height: 150,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     image: const DecorationImage(
              //       image: AssetImage('assets/images/profile.jpg'),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              extraExtraLargeVerticalSpacer,
              const Row(
                children: [
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/user.svg',
                    title: 'Profile',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/contact.svg',
                    title: 'Contacts',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/carte_visite.svg',
                    title: 'C.Visite',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/actualite.svg',
                    title: 'Actualité',
                  )
                ],
              ),
              const Row(
                children: [
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/credit.svg',
                    title: 'Credit',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/epargner.svg',
                    title: 'Epargner',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/avance.svg',
                    title: 'Avances',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/wallet.svg',
                    title: 'Wallet',
                  )
                ],
              ),
              const Row(
                children: [
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/mobile.svg',
                    title: 'Mobile',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/envoi.svg',
                    title: 'Envoi',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/cheque.svg',
                    title: 'Cheques',
                  ),
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/rib.svg',
                    title: 'RIB',
                  )
                ],
              ),
              const Row(
                children: [
                  DrawerMenuItemWidget(
                    icon: 'assets/svg/settings.svg',
                    title: 'Parametres',
                  ),
                ],
              ),
              extraExtraLargeVerticalSpacer,
              Row(
                children: [
                  SvgPicture.asset("assets/svg/disconnect.svg"),
                  miniHorizantalSpacer,
                  Text(
                    "Déconnexion",
                    style: TextStyles.mediumTextStyle.copyWith(
                      color: const Color(0xFFF15F56),
                      fontWeight: FontWeight.bold,
                    ),
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
