import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/profile/controllers/profile.controller.dart';
import 'package:mobile/modules/profile/presentation/ui_items/setting_item.ui.dart';
import 'package:mobile/modules/profile/profile.enum.dart';

class ProfileScreen extends GetView<ProfileController> {
  final VerifyAuthController verifyAuthController =
      Get.find<VerifyAuthController>();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          UIConfigs.horizontalPadding,
          MediaQuery.of(context).padding.top,
          UIConfigs.horizontalPadding,
          UIConfigs.horizontalPadding,
        ),
        child: Obx(() {
          return Column(
            children: [
              if (verifyAuthController.currentUser != null)
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 2),
                        blurRadius: 12,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            verifyAuthController.currentUser!.avatarImageUrl ==
                                    null
                                ? 'https://clinicaemident.ro/wp-content/themes/Gungnir/images/Profil_Anonim_Ok.jpg'
                                : verifyAuthController
                                    .currentUser!.avatarImageUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            verifyAuthController.currentUser?.givenName ?? '',
                            style: TextStyles.s17BoldText,
                          ),
                          Text(
                            verifyAuthController.currentUser?.email ?? '',
                            style: TextStyles.s14MediumText,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<ProfileController>(
                id: ProfileGetBuilderEnum.updateProfile,
                builder: (profileController) {
                  return ListView.separated(
                    itemCount: controller.settingItems.length,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 2),
                              blurRadius: 12,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Wrap(
                            children: List.generate(
                              controller.settingItems[index].length,
                              (subIndex) {
                                final SettingItemUI settingItem =
                                    controller.settingItems[index][subIndex];

                                return GestureDetector(
                                  onTap: settingItem.onPressed,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 50,
                                    color: settingItem.backgroundColor,
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Icon(
                                            settingItem.prefixIcon,
                                            color: settingItem.textColor ??
                                                Palette.gray300,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                            settingItem.title,
                                            style: TextStyles.s14MediumText
                                                .copyWith(
                                              color: settingItem.textColor ??
                                                  Palette.zodiacBlue,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          settingItem.suffixIcon,
                                          color: settingItem.textColor ??
                                              Palette.gray300,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const Spacer(),
              if (verifyAuthController.currentUser != null)
                GestureDetector(
                  onTap: () async {
                    await verifyAuthController.signOut();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Palette.red500,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          PhosphorIcons.sign_out_bold,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            LocaleKeys.profile_sign_out.tr,
                            style: TextStyles.s14MediumText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          );
        }),
      ),
      backgroundColor: Palette.background,
    );
  }
}
