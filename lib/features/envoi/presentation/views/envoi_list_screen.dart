
import 'package:auto_route/auto_route.dart';
import 'package:digirh/common_widgets/app_search_field.dart';
import 'package:digirh/core/util/utils.dart';
import 'package:digirh/features/envoi/data/models/envoi_model.dart';
import 'package:digirh/features/envoi/presentation/widgets/envoi_item_card.dart';
import 'package:digirh/features/envoi/presentation/widgets/tabs_widget.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class EnvoiListScreen extends StatefulWidget {
  const EnvoiListScreen({super.key});

  @override
  State<EnvoiListScreen> createState() => _EnvoiListScreenState();
}

class _EnvoiListScreenState extends State<EnvoiListScreen> {
  final List<EnvoiModel> envois = [
    EnvoiModel.fromJson(const {
      "id": "id",
      "firstName": "Ala",
      "lastName": "Gtari",
      "image": "image",
      "date": "2024-07-11 14:30:00"
    }),
    EnvoiModel.fromJson(const {
      "id": "id",
      "firstName": "Ala",
      "lastName": "Gtari",
      "image": "image",
      "date": "2024-07-11 14:30:00"
    }),
    EnvoiModel.fromJson(const {
      "id": "id",
      "firstName": "Ala",
      "lastName": "Gtari",
      "image": "image",
      "date": "2024-07-12 11:30:00"
    })
  ];

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<EnvoiModel>> groupedItems = {};

    for (var item in envois) {
      DateTime date = DateTime(item.date.year, item.date.month, item.date.day);
      if (!groupedItems.containsKey(date)) {
        groupedItems[date] = [];
      }
      groupedItems[date]!.add(item);
    }

    groupedItems.forEach((key, value) {
      value.sort((a, b) => b.date.compareTo(a.date));
    });

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
              suffixIcon: SizedBox(
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
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.whiteDarkColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const TabsWidget(),
                    extraSmallVerticalSpacer,
                    Expanded(
                      child: ListView.builder(
                        itemCount: groupedItems.length,
                        itemBuilder: (context, index) {
                          var key = groupedItems.keys.elementAt(index);
                          var value = groupedItems[key];
                          final now = DateTime.now();

                          String formattedDate;
                          if (key.formatDayMonthYear() ==
                              now.formatDayMonthYear()) {
                            formattedDate = "Aujourd'hui";
                          } else {
                            formattedDate = key.formatDateToHumanString();
                          }

                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  formattedDate,
                                  style: TextStyles.mediumTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greyExtraDarkColor
                                        .withOpacity(.5),
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value!.length,
                                itemBuilder: (context, index) {
                                  return EnvoiItemCard(envoi: value[index]);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
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
