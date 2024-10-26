import 'package:digirh/features/conge/presentation/bloc/bloc.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DraftDialog extends StatelessWidget {
  const DraftDialog({super.key, required this.onSubmit});

  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 16,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Soumettre le congé',
              style: TextStyles.extraExtraLargeTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Êtes-vous sûr de vouloir soumettre cette demande de congé ?',
              textAlign: TextAlign.center,
              style: TextStyles.largeTextStyle,
            ),
            const SizedBox(height: 20.0),
            _buildDraftDialogButtons(context),
          ],
        ),
      ),
    );
  }

  Row _buildDraftDialogButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildDialogButton(context, 'Annuler', AppColors.greyLessDarkColor,
            AppColors.greyExtraDarkColor, () {
          Navigator.of(context).pop();
        }),
        _buildDialogButton(
            context, 'Confirmer', AppColors.primaryDarkColor, Colors.white, () {
          onSubmit();
          Navigator.of(context).pop();
        }),
      ],
    );
  }

  ElevatedButton _buildDialogButton(BuildContext context, String label,
      Color color, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyles.mediumTextStyle.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
