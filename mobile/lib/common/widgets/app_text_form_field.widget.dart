import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? textController;

  final bool isObscure;
  final bool readOnly;
  final bool extendField;
  final bool enabled;
  final bool isCenterText;

  final String? hintText;
  final String? errorText;

  final double borderRadius;

  final Color focusedBorderColor;
  final Color borderColor;
  final Color fillColor;
  final Color hintColor;

  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final TextInputType? keyboardType;

  final String? Function(String?)? validator;
  final void Function()? onTap;
  final Future<void> Function(String)? onChanged;

  const AppTextFormField({
    Key? key,
    this.textController,
    this.isObscure = false,
    this.readOnly = false,
    this.extendField = true,
    this.enabled = true,
    this.isCenterText = false,
    this.hintText,
    this.errorText,
    this.borderRadius = 6,
    this.borderColor = Palette.gray100,
    this.focusedBorderColor = Palette.blue400,
    this.fillColor = Colors.white,
    this.hintColor = Palette.gray100,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _showPassword = false;

  void _changeShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      textInputAction: TextInputAction.done,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      validator: widget.validator,
      obscureText: widget.isObscure ? (_showPassword ? false : true) : false,
      readOnly: widget.readOnly,
      enableSuggestions: false,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      style: TextStyles.s14RegularText.copyWith(color: Palette.zodiacBlue),
      textAlign: widget.isCenterText ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyles.s14RegularText.copyWith(color: widget.hintColor),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: Palette.red600,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.focusedBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: Palette.red600,
          ),
        ),
        // isDense: true,
        filled: true,
        fillColor: widget.fillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        suffixIcon: widget.isObscure
            ? GestureDetector(
                onTap: _changeShowPassword,
                child: Icon(
                  _showPassword
                      ? PhosphorIcons.eye_bold
                      : PhosphorIcons.eye_slash_bold,
                ),
              )
            : widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        helperText: widget.extendField ? '' : null,
        helperStyle: widget.extendField
            ? TextStyles.regularText.copyWith(fontSize: 11)
            : null,
        errorText: widget.errorText == '' || widget.errorText == null
            ? null
            : widget.errorText,
        errorStyle: TextStyles.regularText
            .copyWith(color: Colors.red, fontSize: 11, height: 0),
      ),
    );
  }
}
