import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/login/widgets/rounded_button.widget.dart';

abstract class DialogUtil {
  static void showConfirm({
    required String title,
    required String content,
    String? confirmButtonText,
    String? cancelButtonText,
    Function? onClose,
    Function? onConfirm,
  }) {
    showGeneral(
      title: title,
      content: content,
      confirmButtonText: confirmButtonText,
      cancelButtonText: cancelButtonText,
      onClose: onClose,
      onConfirm: onConfirm,
      isConfirmDialog: true,
    );
  }

  static void showAlert({required String title, required String content}) {
    showGeneral(title: title, content: content);
  }

  static void showConfirmIOS({required String title, required String content}) {
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(
          title,
          style: TextStyles.s17BoldText,
        ),
        content: Text(
          content,
          style: TextStyles.s14MediumText,
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Không'),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoDialogAction(
            child: const Text('Có'),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }

  static void showGeneral({
    required String title,
    required String content,
    String? confirmButtonText,
    String? cancelButtonText,
    Function? onClose,
    Function? onConfirm,
    bool isConfirmDialog = false,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(
          title,
          style: TextStyles.boldText.copyWith(fontSize: 22.sp),
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          style: TextStyles.s14MediumText,
          textAlign: TextAlign.center,
        ),
        actions: [
          if (isConfirmDialog)
            RoundedButton(
              width: 100.w,
              height: 40,
              borderRadius: 6,
              onPressed: () {
                Get.back();
                if (onClose != null) {
                  onClose();
                }
              },
              content: cancelButtonText ?? LocaleKeys.dialog_no.tr,
              fontSize: 13.sp,
              backgroundColor: Palette.red400,
            ),
          RoundedButton(
            width: 100.w,
            height: 40,
            borderRadius: 6,
            onPressed: () {
              Get.back();
              if (onConfirm != null) {
                onConfirm();
              }
            },
            content: confirmButtonText ?? LocaleKeys.dialog_yes.tr,
            fontSize: 13.sp,
            backgroundColor: Palette.green600,
          )
        ],
        actionsAlignment: MainAxisAlignment.spaceBetween,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        actionsPadding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        titlePadding: const EdgeInsets.only(top: 10),
        buttonPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
