import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';

abstract class BottomSheetUtil {
  static Future<void> show({required Widget child}) async {
    await Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Container(
              height: 6,
              width: 152,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Palette.gray200,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child,
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
