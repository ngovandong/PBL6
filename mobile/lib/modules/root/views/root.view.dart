import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/modules/booking_history/views/booking_history.view.dart';
import 'package:mobile/modules/favorite/views/favorite.view.dart';
import 'package:mobile/modules/home/views/home.view.dart';
import 'package:mobile/modules/profile/views/profile.view.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';

class RootScreen extends GetWidget<RootController> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentTabIndex.value,
          children: const [
            HomeScreen(),
            FavoriteScreen(),
            BookingHistoryScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentTabIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTabIndex,
            selectedItemColor: Palette.blue300,
            unselectedItemColor: Palette.gray300,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.magnifying_glass_bold),
                label: 'Tìm kiếm',
              ),
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.notepad_bold),
                label: 'Đơn đặt',
              ),
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.heart_bold),
                label: 'Yêu thích',
              ),
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.user_bold),
                label: 'Hồ sơ',
              )
            ],
          ),
        ),
      ),
      backgroundColor: Palette.background,
    );
  }
}
