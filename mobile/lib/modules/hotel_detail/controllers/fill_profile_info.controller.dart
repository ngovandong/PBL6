import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';

class FillProfileInfoController extends GetxController {
  final VerifyAuthController verifyAuthController;

  FillProfileInfoController({
    required this.verifyAuthController,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late UserModel bookingProfile;

  @override
  void onInit() {
    bookingProfile = verifyAuthController.currentUser!.copyWith();
    super.onInit();
  }

  String? validatePhoneNumber(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return LocaleKeys.validate_phone_required.tr;
      }
      if (value.length != 10) {
        return LocaleKeys.validate_phone_max_length.tr;
      }
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return LocaleKeys.validate_first_name_required.tr;
      }
    }
    return null;
  }

  String? validateSecondName(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return LocaleKeys.validate_second_name_required.tr;
      }
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return LocaleKeys.validate_email_required.tr;
      }
      if (!value.isEmail) {
        return LocaleKeys.validate_invalid_email.tr;
      }
    }
    return null;
  }

  void onChangeFamilyName(String value) {
    bookingProfile.familyName = value;
  }

  void onChangeGivenName(String value) {
    bookingProfile.givenName = value;
  }

  void onChangeEmail(String value) {
    bookingProfile.email = value;
  }

  void onChangePhoneNumber(String value) {
    bookingProfile.phoneNumber = value;
  }

  void submitProfileInfo() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(RouteManager.bookingStep);
    }
  }
}
