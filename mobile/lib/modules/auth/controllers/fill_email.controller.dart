import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/auth.enum.dart';
import 'package:mobile/modules/auth/data/model/dtos/auth_response.dto.dart';
import 'package:mobile/modules/auth/data/repositories/auth.repository.dart';
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

  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  final RxString authContent = ''.obs;
  final RxString authButton = LocaleKeys.auth_continue.tr.obs;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    _listenFocusForm();
    super.onInit();
  }

  void _listenFocusForm() {
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        emailError.value = '';
      }
    });

    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        passwordError.value = '';
      }
    });
  }

  String validateEmail() {
    String error = '';

    if (emailTextController.text.isEmpty) {
      error = LocaleKeys.validate_email.tr;
    } else if (!emailTextController.text.isEmail) {
      error = LocaleKeys.validate_invalid_email.tr;
    }

    emailError.value = error;

    return error;
  }

  String validatePassword() {
    String error = '';

    if (showPassword.value && passwordTextController.text.isEmpty) {
      error = LocaleKeys.validate_password.tr;
    }

    passwordError.value = error;

    return error;
  }

  bool _validateForm() {
    final bool checkEmail = validateEmail().isEmpty;
    final bool checkPassword = validatePassword().isEmpty;

    return checkEmail && checkPassword;
  }

  Future<void> verifyEmailAuth() async {
    if (isLoading.value) return;

    if (!_validateForm()) {
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
        await verifyAuthController.proccessUpdateCurrentUser(verifyAuth.user);

        Get.close(2); // Close fill email and auth view
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

  void _setShowPassword({bool value = true}) {
    showPassword.value = value;
  }

  void onChangedEmail(String? value) {
    _setShowPassword(value: false);
    authContent.value = '';
    authButton.value = LocaleKeys.auth_continue.tr;
  }
}
