import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/hive_keys.dart';
import 'package:mobile/common/utils/hive/hive_helper.dart';
import 'package:mobile/modules/base/data/model/dto/user_auth.dto.dart';

@lazySingleton
class VerifyAuthLocalDataSource {
  Future<UserAuthDTO?> getUserAuth() async {
    final String? rawUserAuth = await HiveHelper.get(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.userProfileKey,
    );

    return rawUserAuth == null
        ? null
        : UserAuthDTO.fromJson(jsonDecode(rawUserAuth));
  }

  Future<void> saveUserAuth(UserAuthDTO? userAuth) {
    if (userAuth == null) {
      return HiveHelper.delete(
        boxName: HiveKeys.userBox,
        keyValue: HiveKeys.userProfileKey,
      );
    }

    return HiveHelper.put(
      boxName: HiveKeys.userBox,
      keyValue: HiveKeys.userProfileKey,
      value: jsonEncode(userAuth),
    );
  }
}
