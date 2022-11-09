import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/auth.enum.dart';
import 'package:mobile/modules/auth/data/model/dtos/auth_response.dto.dart';
import 'package:mobile/modules/auth/data/repository/auth.repository.dart';
import 'package:mobile/modules/base/controllers/base_controller.export.dart';

class FillEmailController extends GetxController {
  final AuthRepository authRepository;
  final VerifyAuthController verifyAuthController;

  FillEmailController({
    required this.authRepository,
    required this.verifyAuthController,
  });

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;
  final RxBool showPassword = false.obs;

  final RxString passwordError = ''.obs;
  final RxString authContent = ''.obs;
  final RxString authButton = LocaleKeys.auth_continue.tr.obs;

  String? validateEmail(String? value) {
    if (value == '') {
      return LocaleKeys.validate_email.tr;
    } else if (!value!.isEmail) {
      return LocaleKeys.validate_invalid_email.tr;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == '') {
      return LocaleKeys.validate_password.tr;
    }

    return null;
  }

  Future<void> verifyEmailAuth() async {
    passwordError.value = '';

    if (isLoading.value) return;
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      final AuthResponseDTO verifyAuth = await authRepository.verifyWithEmail(
        email: emailTextController.text,
        password: passwordTextController.text.isEmpty
            ? null
            : passwordTextController.text,
      );

      _setIsLoading();

      if (verifyAuth.user != null) {
        await verifyAuthController.setCurrentUser(verifyAuth.user);
      } else {
        switch (verifyAuth.verifyResult) {
          case ErrorAuthentication.needRegister:
            authButton.value = LocaleKeys.auth_sign_up.tr;
            _setShowPassword();
            break;
          case ErrorAuthentication.needAuth:
            authContent.value = LocaleKeys.validate_login_email.tr;
            authButton.value = LocaleKeys.auth_login.tr;
            _setShowPassword();
            break;
          case ErrorAuthentication.incorrectPassword:
            passwordError.value = LocaleKeys.validate_incorrect_password.tr;
        }
      }
    } catch (err) {
      log('Error in verifyEmailAuth from FillEmailController: $err');
      _setIsLoading();
      SnackbarUtil.showError();
    }
  }

  void _setIsLoading() {
    isLoading.toggle();
  }

  void _setShowPassword() {
    showPassword.value = true;
  }
}
