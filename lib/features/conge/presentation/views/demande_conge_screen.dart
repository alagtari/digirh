import 'package:auto_route/auto_route.dart';
import 'package:digirh/common_widgets/app_botton.dart';
import 'package:digirh/common_widgets/app_date_picker.dart';
import 'package:digirh/common_widgets/app_dropdown_widget.dart';
import 'package:digirh/common_widgets/app_form_field.dart';
import 'package:digirh/core/enums/leave_type.dart';
import 'package:digirh/features/conge/data/models/conge_model.dart';
import 'package:digirh/theme/colors.dart';
import 'package:digirh/theme/spacers.dart';
import 'package:digirh/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class DemandeCongeScreen extends StatefulWidget {
  const DemandeCongeScreen({super.key, required this.onAdd});
  final Function(LeaveModel) onAdd;

  @override
  State<DemandeCongeScreen> createState() => _DemandeCongeScreenState();
}

class _DemandeCongeScreenState extends State<DemandeCongeScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  ValueNotifier<LeaveType?> _leaveType = ValueNotifier<LeaveType?>(null);
  DateTime? _startDate;
  DateTime? _endDate;

  final leaveTypes = LeaveType.values
      .map(
        (item) => DropdownMenuItem(
          value: item.index,
          child: Text(
            leaveTypeToString(item),
            style: const TextStyle(
              color: AppColors.greyDarkColor,
            ),
          ),
        ),
      )
      .toList();

  ValueNotifier<String> errorMessage = ValueNotifier<String>("");
  bool valid = true;

  void changeLeaveType(dynamic value) {
    setState(() {
      _leaveType.value = LeaveType.values[leaveTypes
          .firstWhere((element) => element.value == value as int)
          .value!];
    });
  }

  void onStartDateSelected(DateTime date) {
    setState(() {
      _startDate = date;
    });
  }

  void onEndDateSelected(DateTime date) {
    setState(() {
      _endDate = date;
    });
  }

  void _validateLeaveType() {
    if (_leaveType.value == null) {
      setState(() {
        errorMessage.value = "Veuillez choisir le type de congé";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateStartDate() {
    if (_startDate == null) {
      setState(() {
        errorMessage.value = "Veuillez choisir le date de debut";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateEndDate() {
    if (_endDate == null) {
      setState(() {
        errorMessage.value = "Veuillez choisir le date de fin";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validatePhoneNumber() {
    if (phoneController.text.isEmpty) {
      setState(() {
        errorMessage.value = "Veuillez saisir le numero du telephone";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _validateLocation() {
    if (locationController.text.isEmpty) {
      setState(() {
        errorMessage.value = "Veuillez saisir location";
        valid = false;
      });
    } else {
      setState(() {
        errorMessage.value = '';
        valid = true;
      });
    }
  }

  void _onSubmit() {
    _validateLeaveType();

    if (valid) {
      _validateStartDate();
    }
    if (valid) {
      _validateEndDate();
    }
    if (valid) {
      _validatePhoneNumber();
    }
    if (valid) {
      _validateLocation();
    }
    if (valid) {
      final conge = LeaveModel(
          leaveType: _leaveType.value!,
          startDate: _startDate!,
          endDate: _endDate!,
          phone: phoneController.text,
          pay: locationController.text);
      widget.onAdd(conge);
    }
  }

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
                      'Demande congé',
                      style: TextStyles.extraExtraLargeTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                )
              ],
            ),
            extraLargeVerticalSpacer,
            AppDropdownWidget(
              items: leaveTypes,
              onChange: changeLeaveType,
              hint: "Type congé",
              icon: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/document.svg',
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            AppDatePickerField(
              onDateSelected: onStartDateSelected,
              hint: "Date début",
              icon: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/conge.svg',
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            AppDatePickerField(
              onDateSelected: onEndDateSelected,
              hint: "Date fin",
              icon: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/conge.svg',
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              color: AppColors.whiteDarkColor,
              textColor: AppColors.greyExtraDarkColor,
              hintText: "Telephone",
              controller: phoneController,
              prefixIcon: Container(
                width: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/user.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColors.greyExtraDarkColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            extraSmallVerticalSpacer,
            AppFormField(
              color: AppColors.whiteDarkColor,
              textColor: AppColors.greyExtraDarkColor,
              hintText: "Localisation",
              controller: locationController,
              prefixIcon: Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/svg/location.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColors.greyExtraDarkColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            extraMiniVerticalSpacer,
            Align(
              alignment: Alignment.centerLeft,
              child: ValueListenableBuilder(
                valueListenable: errorMessage,
                builder: (context, value, child) {
                  return Text(
                    errorMessage.value,
                    style: TextStyles.extraSmallTextStyle.copyWith(
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
            extraExtraLargeVerticalSpacer,
            AppBotton(
                bottonText: "Ajouter",
                onClick: () {
                  _onSubmit();
                }),
          ],
        ),
      ),
    );
  }
}
