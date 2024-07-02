import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.whiteDarkColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/news.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            height: 130,
          ),
          extraMiniVerticalSpacer,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Gestion du Capital Humain",
              style: TextStyles.smallTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Il sagit de la gestion du cursus professionnel du capital humain du recrutement à la retraite. L'application permet le traitement en ligne de toutes",
              style: TextStyles.smallTextStyle.copyWith(
                color: AppColors.greyDarkColor
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
