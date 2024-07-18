import 'package:digirh/features/conge/presentation/widgets/conge_approuval_card.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CongeCard extends StatelessWidget {
  const CongeCard({
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
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: const Column(
            children: [
              CongeApprouvalCard(),
              CongeApprouvalCard(),
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
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.whiteDarkColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Demande conge de repos",
                style: TextStyles.largeTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              extraMiniVerticalSpacer,
              Text(
                "Date",
                style: TextStyles.smallTextStyle.copyWith(),
              ),
              Text(
                "18  juillet  2024   -   21  juillet  2024",
                style: TextStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              extraMiniVerticalSpacer,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Durée",
                        style: TextStyles.smallTextStyle.copyWith(),
                      ),
                      Text(
                        "3 jours",
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  largeHorizantalSpacer,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Référence",
                        style: TextStyles.smallTextStyle.copyWith(),
                      ),
                      Text(
                        "55896",
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0x3334A853),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Approuvé",
                      style: TextStyles.smallTextStyle
                          .copyWith(color: const Color(0xFF34A853)),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
