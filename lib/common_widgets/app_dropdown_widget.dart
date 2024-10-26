import 'package:flutter/material.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/radius.dart';
import 'package:digirh/theme/text_styles.dart';

class AppDropdownWidget extends StatefulWidget {
  const AppDropdownWidget({
    super.key,
    required this.items,
    required this.onChange,
    required this.hint,
    required this.icon,
    this.initialValue,
    this.backgroundColor = Colors.white,
  });
  final List<DropdownMenuItem> items;
  final void Function(dynamic) onChange;
  final String hint;
  final Widget icon;
  final String? initialValue;
  final Color backgroundColor;

  @override
  State<AppDropdownWidget> createState() => _AppDropdownWidgetState();
}

class _AppDropdownWidgetState extends State<AppDropdownWidget> {
  late ValueNotifier<dynamic> selectedItem;

  @override
  void initState() {
    selectedItem = ValueNotifier<dynamic>(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.all(
            CustomRaius.smallRadius,
          ),
        ),
        child: Row(
          children: [
            widget.icon,
            ValueListenableBuilder(
              valueListenable: selectedItem,
              builder: (context, item, child) {
                return Expanded(
                  child: DropdownButton(
                    hint: Text(
                      widget.hint,
                      style: TextStyles.mediumTextStyle.copyWith(
                        color: AppColors.greyExtraDarkColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: item ?? widget.initialValue,
                    items: widget.items,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.greyExtraDarkColor,
                    ),
                    underline: Container(),
                    onChanged: (value) {
                      setState(() {
                        selectedItem.value = value;
                      });
                      widget.onChange(value);
                    },
                    isExpanded: true,
                    style: TextStyles.mediumTextStyle.copyWith(
                      color: AppColors.greyExtraDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
