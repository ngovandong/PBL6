import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/common/utils/dialog.util.dart';
import 'package:mobile/common/utils/google_auth.util.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';
import 'package:mobile/modules/auth/data/repository/auth.repository.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;
  final VerifyAuthController verifyAuthController;

  AuthController({
    required this.authRepository,
    required this.verifyAuthController,
  });

  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final RxString errorText = ''.obs;
  final RxBool isLoading = false.obs;

  Future<void> loginWithGoolge() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleAuthUtil.signIn();

      if (googleSignInAccount != null) {
        DialogUtil.showLoading();

        GoogleSignInAuthentication auth =
            await googleSignInAccount.authentication;

        final UserModel user =
            await authRepository.loginWithGoogle(auth.idToken!);

        await verifyAuthController.setCurrentUser(user);

        DialogUtil.hideLoading();
      }
    } catch (err) {
      SnackbarUtil.showError();
      log('Error in loginWithGoolge');
    }
  }
}
