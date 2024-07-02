import 'package:auto_route/auto_route.dart';
import 'package:digirh/common_widgets/app_search_field.dart';
import 'package:digirh/features/news/presentation/widgets/news_card_widget.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
                      'Actualités',
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
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const NewsCardWidget();
                },
              ),
            ),
            extraMiniVerticalSpacer,
          ],
        ),
      ),
    );
  }
}
