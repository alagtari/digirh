import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneralInfoWidget extends StatelessWidget {
  const GeneralInfoWidget({
    super.key,
  });

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(30.0),
          decoration: const BoxDecoration(
            color: AppColors.whiteDarkColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: const Column(
            children: [
              BottomSheetItemWidget(
                title: "Compte chéque personel",
                content: "-8 539.567 TND",
                icon: "assets/svg/ccp.svg",
                color: Colors.red,
              ),
              BottomSheetItemWidget(
                title: "Total credit",
                content: "30 000.000 TND",
                icon: "assets/svg/tcr.svg",
              ),
              BottomSheetItemWidget(
                title: "Total En Cours",
                content: "26 450.357 TND",
                icon: "assets/svg/tc.svg",
              ),
              BottomSheetItemWidget(
                title: "Total Mensualite",
                content: "365.016 TND",
                icon: "assets/svg/tm.svg",
              ),
              BottomSheetItemWidget(
                title: "Solde Congé",
                content: "54 Jours",
                icon: "assets/svg/sc.svg",
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showModalBottomSheet(context);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: SvgPicture.asset(
              'assets/svg/home_card.svg',
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85 - 50,
                    child: Row(
                      children: [
                        Text(
                          "Makrem Taieb".toUpperCase(),
                          style: TextStyles.mediumTextStyle.copyWith(
                              color: AppColors.whiteDarkColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          "4591P",
                          style: TextStyles.mediumTextStyle.copyWith(
                            color: AppColors.whiteDarkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  miniVerticalSpacer,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85 - 50,
                    height: 40,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ingénieur Informaticien",
                              style: TextStyles.mediumTextStyle.copyWith(
                                color: AppColors.whiteDarkColor,
                              ),
                            ),
                            Text(
                              "Chef de Service",
                              style: TextStyles.mediumTextStyle.copyWith(
                                color: AppColors.whiteDarkColor,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        SvgPicture.asset("assets/svg/white_logo.svg"),
                      ],
                    ),
                  ),
                  extraLargeVerticalSpacer,
                  extraSmallVerticalSpacer,
                  Text(
                    "DIRECTION DEVELOPPEMENT DIGITAL",
                    style: TextStyles.mediumTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteDarkColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetItemWidget extends StatelessWidget {
  const BottomSheetItemWidget({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    this.color = AppColors.blackDarkColor,
  });

  final String title;
  final String content;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: AppColors.greyExtraDarkColor,
          width: .2,
        )),
      ),
      child: Row(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            content,
            style: TextStyles.mediumTextStyle
                .copyWith(color: color, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: TextStyles.smallTextStyle,
          ),
        ]),
        const Expanded(child: SizedBox()),
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            width: 30,
            height: 30,
            icon,
          ),
        ),
      ]),
    );
  }
}
