import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/generated/locales.g.dart';

class SignUpController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value == '') {
      return LocaleKeys.validate_name.tr;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == '') {
      return LocaleKeys.validate_email.tr;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == '') {
      return LocaleKeys.validate_password.tr;
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == '') {
      return LocaleKeys.validate_confirm_password.tr;
    } else if (passwordTextController.text.compareTo(value!) != 0) {
      return LocaleKeys.validate_not_match_password.tr;
    }
    return null;
  }

  Future<void> signUp() async {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }
  }
}
