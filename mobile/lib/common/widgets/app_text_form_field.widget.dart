import 'package:flutter/material.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? textController;

  final bool isObscure;
  final bool readOnly;

  final String? hintText;
  final String? errorText;

  final double borderRadius;

  final Color borderColor;
  final Color fillColor;

  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final TextInputType? keyboardType;

  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  const AppTextFormField({
    Key? key,
    this.textController,
    this.isObscure = false,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.borderRadius = 6,
    this.borderColor = Palette.blue400,
    this.fillColor = Colors.white,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // focusNode: focusNode,
      controller: textController,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      obscureText: isObscure,
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: TextStyles.s14regularText.copyWith(color: Palette.gray300),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.s14regularText.copyWith(color: Palette.gray300),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Palette.red600,
          ),
        ),
        isDense: true,
        // errorStyle: ,
        fillColor: fillColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        helperText: '',
        helperStyle: TextStyles.regularText.copyWith(fontSize: 12),
        errorText: errorText == '' || errorText == null ? null : errorText,
        errorStyle:
            TextStyles.regularText.copyWith(color: Colors.red, fontSize: 12),
      ),
    );
  }
}
