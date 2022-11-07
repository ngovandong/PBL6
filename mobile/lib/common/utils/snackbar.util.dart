import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/generated/locales.g.dart';

abstract class SnackbarUtil {
  static Future<void> showSuccess({
    String? message,
    SnackPosition position = SnackPosition.TOP,
    Duration duration = const Duration(seconds: 2),
  }) async {
    await Get.closeCurrentSnackbar();
    Get.snackbar(
      '',
      '',
      onTap: (snack) async {
        await Get.closeCurrentSnackbar();
      },
      duration: duration,
      barBlur: 0,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(0),
      snackPosition: position,
      messageText: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.green700,
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                message ?? LocaleKeys.share_success_message.tr,
                style: TextStyles.s14BoldText.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  static Future<void> showError({
    String? message,
    SnackPosition position = SnackPosition.TOP,
    Duration duration = const Duration(seconds: 2),
  }) async {
    await Get.closeCurrentSnackbar();
    Get.snackbar(
      '',
      '',
      onTap: (snack) async {
        await Get.closeCurrentSnackbar();
      },
      duration: duration,
      barBlur: 0,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(0),
      snackPosition: position,
      messageText: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palette.red500,
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                message ?? LocaleKeys.share_error_message.tr,
                style: TextStyles.s14BoldText.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
