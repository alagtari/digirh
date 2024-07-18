import 'package:auto_route/auto_route.dart';
import 'package:digirh/common_widgets/bottom_navigation_icon_widget.dart';
import 'package:digirh/core/routes/app_router.gr.dart';
import 'package:digirh/features/home/presentation/views/app_drawer.dart';
import 'package:digirh/main.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppFrame extends StatefulWidget {
  const AppFrame({super.key});

  @override
  State<AppFrame> createState() => _AppFrameState();
}

class _AppFrameState extends State<AppFrame> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.router.replace(const HomeRoute());
        break;
      case 1:
        context.router.replace(const JournalRoute());
        break;
      case 2:
        // context.router.replace(const DriverIncidentRoute());
        break;
      case 3:
        context.router.replace(const CongeRoute());
        break;
      case 4:
        context.router.replace(const AccountsRoute());
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MyApp.scaffoldKey,
      body: const AutoRouter(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 0,
              icon: 'assets/svg/home.svg',
            ),
            label: "Acceuil",
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 1,
              icon: 'assets/svg/cartes.svg',
            ),
            label: "Journal",
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 2,
              icon: 'assets/svg/wallet.svg',
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 3,
              icon: 'assets/svg/conge.svg',
            ),
            label: "Congé",
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationIconWidget(
              selectedIndex: _selectedIndex,
              index: 4,
              icon: 'assets/svg/user.svg',
            ),
            label: "Comptes",
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: AppColors.greyExtraDarkColor.withOpacity(0.5),
        selectedLabelStyle: TextStyles.extraSmallTextStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: TextStyles.extraSmallTextStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
        selectedItemColor: AppColors.primaryDarkColor,
        onTap: _onItemTapped,
      ),
      drawer: const AppDrawer(),
    );
  }
}
