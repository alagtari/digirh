import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CongeApprouvalCard extends StatelessWidget {
  const CongeApprouvalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.appBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          smallHorizantalSpacer,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "03 juillet 2024",
                style: TextStyles.smallTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyExtraDarkColor,
                ),
              ),
              Text(
                "Mounir Gtari",
                style: TextStyles.largeTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyExtraDarkColor,
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
      ),
    );
  }
}
