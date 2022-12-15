import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/common/utils/dialog.util.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/profile/data/repositories/profile.repository.dart';

class UserSettingController extends GetxController {
  final VerifyAuthController verifyAuthController;
  final ProfileRepository profileRepository;

  UserSettingController({
    required this.verifyAuthController,
    required this.profileRepository,
  });

  late Rx<UserModel> _updatedUser;
  UserModel get updatedUser => _updatedUser.value;

  RxBool haveUpdated = false.obs;

  late TextEditingController birthDayTextController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    _updatedUser = (verifyAuthController.currentUser!.copyWith()).obs;
    birthDayTextController =
        TextEditingController(text: updatedUser.birthDay?.toDisplayDate);

    _updatedUser.listen((p0) {
      log(verifyAuthController.currentUser!.toJson().toString());

      if (p0 != verifyAuthController.currentUser) {
        haveUpdated.value = true;
      } else {
        haveUpdated.value = false;
      }
    });
    super.onInit();
  }

  String? validatePhoneNumber(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return LocaleKeys.validate_phone_required.tr;
      }
      if (value.length != 10) {
        return LocaleKeys.validate_phone_max_length.tr;
      }
    }
    return null;
  }

  void onChangeFamilyName(String value) {
    updatedUser.familyName = value;
    _updatedUser.refresh();
  }

  void onChangeGivenName(String value) {
    updatedUser.givenName = value;
    _updatedUser.refresh();
  }

  void onChangePhoneNumber(String value) {
    updatedUser.phoneNumber = value;
    _updatedUser.refresh();
  }

  void onChangeGender(String value) {
    updatedUser.gender = value;
    _updatedUser.refresh();
  }

  void onChangeAddress(String value) {
    updatedUser.address = value;
    _updatedUser.refresh();
  }

  void onChangeBirthDay(DateTime newDate) {
    updatedUser.birthDay = newDate;
    _updatedUser.refresh();
    birthDayTextController.text = newDate.toDisplayDate;
  }

  Future<void> updateUserInfo() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      DialogUtil.showLoading();

      await profileRepository.changeUserInfo(updatedUser);
      verifyAuthController.setCurrentUser(updatedUser.copyWith());
      haveUpdated.value = false;

      DialogUtil.hideLoading();
      SnackbarUtil.showSuccess(position: SnackPosition.BOTTOM);
    } catch (err) {
      DialogUtil.hideLoading();
      SnackbarUtil.showError();
    }
  }
}
