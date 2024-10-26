import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ControlsDialog extends StatelessWidget {
  const ControlsDialog({super.key, required this.onDelete});
  final Function() onDelete;

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
              'Gérer le congé',
              style: TextStyles.extraExtraLargeTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Que souhaitez-vous faire avec cette demande de congé ?',
              textAlign: TextAlign.center,
              style: TextStyles.largeTextStyle,
            ),
            const SizedBox(height: 20.0),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Row _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildDialogButton(context, 'Mettre à jour', AppColors.primaryDarkColor,
            () {
          // context.read<CongeBloc>().add(UpdateCongeEvent(congeId: congeId));
          Navigator.of(context).pop();
        }),
        _buildDialogButton(context, 'Supprimer', Colors.red, () {
          onDelete();
          Navigator.of(context).pop();
        }),
      ],
    );
  }

  ElevatedButton _buildDialogButton(
      BuildContext context, String label, Color color, VoidCallback onPressed) {
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
        style: TextStyles.mediumTextStyle
            .copyWith(color: AppColors.whiteDarkColor),
      ),
    );
  }
}
