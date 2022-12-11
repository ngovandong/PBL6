import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';

@lazySingleton
class ProfileDataSource {
  Future<void> changeUserInfo(UserModel updatedUser) async {
    await DioProvider.put(
      Endpoints.changeUserInfo,
      body: updatedUser.toHttpJson(),
    );
  }
}
