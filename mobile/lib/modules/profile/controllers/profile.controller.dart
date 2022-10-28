import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/profile/presentation/view_model/setting_item.viewmodel.dart';

class ProfileController extends GetxController {
  final List<List<SettingItemViewModel>> settingItems = [
    [
      // SettingItemViewModel(
      //   prefixIcon: Icons.manage_accounts_rounded,
      //   title: LocaleKeys.profile_setting_account.tr,
      // ),
      SettingItemViewModel(
        prefixIcon: PhosphorIcons.user_circle_plus_bold,
        title: LocaleKeys.profile_login_signup.tr,
        backgroundColor: Palette.blue400,
        textColor: Colors.white,
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
  ];
}
