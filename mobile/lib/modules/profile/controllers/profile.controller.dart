import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/profile/presentation/view_model/setting_item.viewmodel.dart';
import 'package:mobile/modules/profile/profile.eventbus.dart';

class ProfileController extends GetxController {
  final VerifyAuthController verifyAuthController;

  ProfileController({
    required this.verifyAuthController,
  });

  StreamSubscription? _profileEventBusSubscription;

  @override
  void onInit() {
    _setSettingItems();
    _openProfileEventBus();
    super.onInit();
  }

  @override
  void onClose() async {
    _closeProfileEventBus();
  }

  late RxList<List<SettingItemViewModel>> settingItems;

  void _setSettingItems() {
    settingItems = [
      [
        verifyAuthController.currentUser == null
            ? SettingItemViewModel(
                prefixIcon: PhosphorIcons.user_circle_plus_bold,
                title: LocaleKeys.profile_login_signup.tr,
                backgroundColor: Palette.blue400,
                textColor: Colors.white,
                onPressed: () async {
                  await Get.toNamed(RouteManager.auth);
                },
              )
            : SettingItemViewModel(
                prefixIcon: Icons.manage_accounts_rounded,
                title: LocaleKeys.profile_setting_account.tr,
              )
      ],
      [
        SettingItemViewModel(
          prefixIcon: PhosphorIcons.globe_bold,
          title: LocaleKeys.profile_language.tr,
        ),
        SettingItemViewModel(
          prefixIcon: PhosphorIcons.bell_ringing_bold,
          title: LocaleKeys.profile_notication.tr,
        )
      ],
      [
        SettingItemViewModel(
          prefixIcon: PhosphorIcons.info_bold,
          title: LocaleKeys.profile_help_center.tr,
        ),
        SettingItemViewModel(
          prefixIcon: PhosphorIcons.users_four_bold,
          title: LocaleKeys.profile_about_us.tr,
        )
      ]
    ].obs;
  }

  void _updateSettingItems() {
    settingItems[0] = [
      verifyAuthController.currentUser == null
          ? SettingItemViewModel(
              prefixIcon: PhosphorIcons.user_circle_plus_bold,
              title: LocaleKeys.profile_login_signup.tr,
              backgroundColor: Palette.blue400,
              textColor: Colors.white,
              onPressed: () async {
                await Get.toNamed(RouteManager.auth);
                _updateSettingItems();
              },
            )
          : SettingItemViewModel(
              prefixIcon: Icons.manage_accounts_rounded,
              title: LocaleKeys.profile_setting_account.tr,
            )
    ];
    update(['update_profile']);
  }

  void _openProfileEventBus() {
    _profileEventBusSubscription =
        EventBusUtil.listenEvent<ProfileInternalEvent>((event) {
      final String action = event.action;

      switch (action) {
        case ProfileInternalEventEnum.updateSettingProfile:
          _updateSettingItems();
          break;
      }
    });
  }

  Future<void> _closeProfileEventBus() async {
    _profileEventBusSubscription?.cancel();
  }
}
