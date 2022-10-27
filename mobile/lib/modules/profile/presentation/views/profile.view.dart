import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/profile/controllers/profile.controller.dart';
import 'package:mobile/modules/profile/presentation/view_model/setting_item.viewmodel.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

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
        child: Column(
          children: [
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
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Minh Đức',
                        style: TextStyles.s17BoldText,
                      ),
                      Text(
                        'nguyenminhduc.dev@gmail.com',
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
            ListView.separated(
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
                          final SettingItemViewModel settingItem =
                              controller.settingItems[index][subIndex];

                          return Container(
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
                                    style: TextStyles.s14MediumText.copyWith(
                                      color: settingItem.textColor ??
                                          Palette.zodiacBlue,
                                    ),
                                  ),
                                ),
                                Icon(
                                  settingItem.suffixIcon,
                                  color:
                                      settingItem.textColor ?? Palette.gray300,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      backgroundColor: Palette.background,
    );
  }
}
