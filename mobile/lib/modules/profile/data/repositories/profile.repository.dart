import 'package:injectable/injectable.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';
import 'package:mobile/modules/profile/data/datasources/profile.datasource.dart';

@lazySingleton
class ProfileRepository {
  final ProfileDataSource profileDataSource;

  ProfileRepository({required this.profileDataSource});

  Future<void> changeUserInfo(UserModel updatedUser) {
    return profileDataSource.changeUserInfo(updatedUser);
  }
}
