import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/common/utils/google_auth.util.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';
import 'package:mobile/modules/base/base.enum.dart';
import 'package:mobile/modules/base/base.eventbus.dart';
import 'package:mobile/modules/base/data/model/user_auth.model.dart';
import 'package:mobile/modules/base/data/repository/verify_auth.repository.dart';
import 'package:mobile/modules/booking_history/booking_history.enum.dart';
import 'package:mobile/modules/booking_history/booking_history.eventbus.dart';
import 'package:mobile/modules/favorite_host/favorite_host.enum.dart';
import 'package:mobile/modules/favorite_host/favorite_host.eventbus.dart';
import 'package:mobile/modules/profile/profile.enum.dart';
import 'package:mobile/modules/profile/profile.eventbus.dart';

class VerifyAuthController extends GetxController {
  final VeriryAuthRepository veriryAuthRepository;

  VerifyAuthController({
    required this.veriryAuthRepository,
  });

  final Rxn<UserModel> _currrentUser = Rxn<UserModel>();
  UserModel? get currentUser => _currrentUser.value;

  // @override
  // Future<void> onInit() async {
  //   // _currrentUser.listen((p) {
  //   //   if (p != null) {
  //   //     Get.offNamedUntil(
  //   //       RouteManager.root,
  //   //       ModalRoute.withName(RouteManager.root),
  //   //     );
  //   //   }
  //   // });

  //   await _verifyUserAuth();

  //   super.onInit();
  // }

  Future<void> verifyUserAuth() async {
    try {
      final UserAuthModel? userAuth = await veriryAuthRepository.getUserAuth();

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

  Future<void> _saveUserAuth(UserAuthModel? userAuth) async {
    return await veriryAuthRepository.saveUserAuth(userAuth);
  }

  void setCurrentUser(UserModel? user) {
    _currrentUser.value = user;
    _currrentUser.refresh();
  }

  Future<void> proccessUpdateCurrentUser(UserModel? user) async {
    setCurrentUser(user);

    await _saveUserAuth(
      user == null ? null : UserAuthModel.fromUserModel(user),
    );

    _fireEventBus();
  }

  void _fireEventBus() {
    EventBusUtil.fireEvent(
      ProfileInternalEvent(
        ProfileInternalEventEnum.updateSettingProfile,
        null,
      ),
    );

    EventBusUtil.fireEvent(
      BookingHistoryInternalEvent(
        BookingHistoryInternalEventEnum.refreshBookingHistory,
        null,
      ),
    );

    EventBusUtil.fireEvent(
      FavoriteHostInternalEvent(
        FavoriteInternalEventEnum.refreshData,
        null,
      ),
    );

    if (currentUser != null) {
      EventBusUtil.fireEvent(
        BaseInternalEvent(BaseInternalEventEnum.connectToSocket, null),
      );
    }
  }

  Future<void> signOut() async {
    try {
      await proccessUpdateCurrentUser(null);
      await GoogleAuthUtil.signOut();
    } catch (err) {
      SnackbarUtil.showError();
      log('Error in signOut');
    }
  }
}
