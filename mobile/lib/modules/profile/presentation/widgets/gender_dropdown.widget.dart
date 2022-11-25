import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

class GenderDropdownButton extends StatefulWidget {
  final String? initValue;
  final void Function(String value)? onChanged;

  const GenderDropdownButton({
    super.key,
    this.initValue,
    this.onChanged,
  });

  @override
  State<GenderDropdownButton> createState() => _GenderDropdownButtonState();
}

class _GenderDropdownButtonState extends State<GenderDropdownButton> {
  late String currentValue;

  @override
  void initState() {
    currentValue = widget.initValue ?? 'Khác';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        value: currentValue,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Palette.red600,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Palette.blue400,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Palette.gray100,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Palette.gray100,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Palette.red600,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelText: 'Giới tính',
          labelStyle:
              TextStyles.s14RegularText.copyWith(color: Palette.gray100),
          floatingLabelStyle:
              TextStyles.s14RegularText.copyWith(color: Palette.blue400),
        ),
        // buttonDecoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(6),
        //   border: Border.all(color: Palette.gray100),
        // ),
        // dropdownPadding: const EdgeInsets.only(right: 24),
        // dropdownWidth: Get.width ,
        // buttonPadding: const EdgeInsets.only(left: 50),
        buttonPadding: EdgeInsets.zero,
        // itemPadding: EdgeInsets.zero,
        offset: const Offset(-20, 0),
        dropdownWidth: Get.width - 2 * UIConfigs.horizontalPadding,
        buttonHeight: 48,
        isExpanded: true,
        style: TextStyles.s14RegularText,
        onChanged: (value) {
          widget.onChanged?.call(value!);
          setState(() {
            currentValue = value!;
          });
        },
        buttonElevation: 0,
        dropdownDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        selectedItemHighlightColor: Palette.blue100,
        items: const [
          DropdownMenuItem(
            value: 'Nam',
            child: Text('Nam'),
          ),
          DropdownMenuItem(
            value: 'Nữ',
            child: Text('Nữ'),
          ),
          DropdownMenuItem(
            value: 'Khác',
            child: Text('Khác'),
          )
        ],
      ),
    );
  }
}
