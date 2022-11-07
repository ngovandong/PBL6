import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/utils/dialog.util.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/common/utils/google_auth.util.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';
import 'package:mobile/modules/base/data/model/dto/user_auth.dto.dart';
import 'package:mobile/modules/base/data/repository/verify_auth.repository.dart';
import 'package:mobile/modules/profile/profile.eventbus.dart';

class VerifyAuthController extends GetxController {
  final VeriryAuthRepository veriryAuthRepository;

  VerifyAuthController({
    required this.veriryAuthRepository,
  });

  final Rxn<UserModel> _currrentUser = Rxn<UserModel>();
  UserModel? get currentUser => _currrentUser.value;

  @override
  Future<void> onInit() async {
    _currrentUser.listen((p) {
      if (p != null) {
        Get.offNamedUntil(
          RouteManager.root,
          ModalRoute.withName(RouteManager.root),
        );
      }
    });

    await verifyUserAuth();

    super.onInit();
  }

  Future<void> verifyUserAuth() async {
    try {
      final UserAuthDTO? userAuth = await veriryAuthRepository.getUserAuth();

      if (userAuth == null) {
        return;
      }

      _currrentUser.value =
          (await veriryAuthRepository.getUserInfo(userAuth.id));
    } catch (err) {
      log('Error in verifyUserAuth');
      SnackbarUtil.showError(
        message: 'Đã xảy ra lỗi khi lấy thông tin người dùng',
      );
    }
  }

  Future<void> _saveUserAuth(UserAuthDTO? userAuth) async {
    return await veriryAuthRepository.saveUserAuth(userAuth);
  }

  Future<void> setCurrentUser(UserModel? user) async {
    _currrentUser.value = user;

    await _saveUserAuth(user == null ? null : UserAuthDTO.fromUserModel(user));

    EventBusUtil.fireEvent(
      ProfileInternalEvent(
        ProfileInternalEventEnum.updateSettingProfile,
        null,
      ),
    );
  }

  Future<void> signOut() async {
    try {
      DialogUtil.showLoading();

      await setCurrentUser(null);
      await GoogleAuthUtil.signOut();

      EventBusUtil.fireEvent(
        ProfileInternalEvent(
          ProfileInternalEventEnum.updateSettingProfile,
          null,
        ),
      );

      DialogUtil.hideLoading();
    } catch (err) {
      SnackbarUtil.showError();
      log('Error in signOut');
    }
  }
}
