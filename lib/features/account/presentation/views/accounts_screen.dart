import 'package:auto_route/auto_route.dart';
import 'package:digirh/features/account/presentation/widgets/account_card.dart';
import 'package:digirh/main.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountsScreen> {
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
                      'Comptes',
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
            mediumVerticalSpacer,
            const AccountCard(),
            const AccountCard(),
          ],
        ),
      ),
    );
  }
}
