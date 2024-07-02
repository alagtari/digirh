import 'package:auto_route/auto_route.dart';
import 'package:digirh/common_widgets/app_search_field.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class EnvoiListScreen extends StatefulWidget {
  const EnvoiListScreen({super.key});

  @override
  State<EnvoiListScreen> createState() => _EnvoiListScreenState();
}

class _EnvoiListScreenState extends State<EnvoiListScreen> {
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
                      'Envois',
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
                    'assets/svg/search.svg',
                  ),
                )
              ],
            ),
            smallVerticalSpacer,
            AppSearchField(
              hintText: 'Rechercher',
              prefixIcon: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/search.svg',
                ),
              ),
              suffixIcon: Container(
                  height: 40,
                  width: 80,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/svg/close.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/svg/filter.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  )),
              controller: TextEditingController(),
            ),
            smallVerticalSpacer,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteDarkColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            smallVerticalSpacer,
          ],
        ),
      ),
    );
  }
}
