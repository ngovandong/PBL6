import 'dart:convert';

import 'package:mobile/common/constants/hive_keys.dart';
import 'package:mobile/common/utils/hive/hive_helper.dart';
import 'package:mobile/modules/base/data/models/user.model.dart';

class AuthLocalDataSource {
  Future<UserModel?> getUserProfile() async {
    final String? rawUserProfile = await HiveHelper.get(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.userProfileKey,
    );

    return rawUserProfile == null
        ? null
        : UserModel.fromJson(jsonDecode(rawUserProfile));
  }

  Future<void> setUserProfile(UserModel newUser) async {
    return await HiveHelper.set(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.userProfileKey,
      value: jsonEncode(newUser),
    );
  }

  Future<String> getAccessToken() async {
    return await HiveHelper.get(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.accessTokenKey,
    );
  }

  Future<void> setAccessToken(String accessToken) async {
    return await HiveHelper.set(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.accessTokenKey,
      value: accessToken,
    );
  }

  Future<String> getRefreshToken() async {
    return await HiveHelper.get(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.refreshTokenKey,
    );
  }

  Future<void> setRefreshToken(String refreshToken) async {
    return await HiveHelper.set(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.refreshTokenKey,
      value: refreshToken,
    );
  }

  Future<bool> checkNewUser() async {
    final bool? isNewUser = await HiveHelper.get(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.newUserKey,
    );

    if (isNewUser == null || !isNewUser) {
      return true;
    }
    return false;
  }
}
