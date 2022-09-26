import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/modules/base/data/models/user.model.dart';
import 'package:mobile/modules/base/data/repositories/auth.repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  late Rx<UserModel> _currentUser;
  UserModel get currentUSer => _currentUser.value;

  void _setLoggedUser(UserModel loggedUser) {
    _currentUser = loggedUser.obs;
  }

  Future<void> setUserInfo(
    UserModel loggedUser,
    String accessToken,
    String refreshToken,
  ) async {
    try {
      _setLoggedUser(loggedUser);
      await authRepository.setUserProfile(loggedUser);
      await authRepository.setToken(accessToken, refreshToken);

      Get.offAllNamed(RouteManager.root);
    } catch (err) {
      log('Error in setLoggedUser() from AuthController: $err');
    }
  }

  Future<void> verifyUser() async {
    // final bool isNewUser = await authRepository.checkNewUser();
    // if (isNewUser) {
    //   Get.offAllNamed(RouteManager.onboard);
    // } else {
    //   final UserModel? user = await authRepository.getUserProfile();
    //   if (user == null) {
    //     Get.offAllNamed(RouteManager.login);
    //   } else {
    //     _setLoggedUser(user);
    //     Get.offAllNamed(RouteManager.home);
    //   }
    // }
    final UserModel? user = await authRepository.getUserProfile();
    if (user == null) {
      Get.offAllNamed(RouteManager.login);
    } else {
      _setLoggedUser(user);
      Get.offAllNamed(RouteManager.root);
    }
  }

  Future<void> loginWithGoolge() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        clientId:
            '260336785458-30q8avlobachemfi16kqs6329pm3rat4.apps.googleusercontent.com',
      );

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
    } catch (err) {
      log(err.toString());
    }
  }
}
