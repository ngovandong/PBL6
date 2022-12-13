import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/generated/locales.g.dart';

abstract class DialogUtil {
  // static void showConfirm({
  //   required String title,
  //   required String content,
  //   String? confirmButtonText,
  //   String? cancelButtonText,
  //   Function? onClose,
  //   Function? onConfirm,
  // }) {
  //   showGeneral(
  //     title: title,
  //     content: content,
  //     confirmButtonText: confirmButtonText,
  //     cancelButtonText: cancelButtonText,
  //     onClose: onClose,
  //     onConfirm: onConfirm,
  //     isConfirmDialog: true,
  //   );
  // }

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

  static Future<void> showGeneral({
    required String title,
    required String content,
    String? confirmButtonText,
    String? cancelButtonText,
    Function? onClose,
    Function? onConfirm,
    bool isConfirmDialog = false,
  }) async {
    await Get.dialog(
      AlertDialog(
        title: Text(
          title,
          style: TextStyles.boldText.copyWith(fontSize: 22),
          textAlign: TextAlign.center,
        ),
        content: Text(
          content,
          style: TextStyles.s14MediumText,
          textAlign: TextAlign.center,
        ),
        actions: [
          if (isConfirmDialog)
            AppRoundedButton(
              width: 100.w,
              height: 40,
              borderRadius: 6,
              onPressed: () async {
                if (onClose != null) {
                  await onClose();
                }
                Get.back();
              },
              content: cancelButtonText ?? LocaleKeys.dialog_no.tr,
              fontSize: 13,
              backgroundColor: Colors.white,
              textColor: Palette.zodiacBlue,
              showShadow: false,
              showBorder: true,
            ),
          AppRoundedButton(
            width: isConfirmDialog ? 100.w : double.infinity,
            height: 40,
            borderRadius: 6,
            onPressed: () async {
              if (onConfirm != null) {
                await onConfirm();
              }
              Get.back();
            },
            content: confirmButtonText ?? LocaleKeys.dialog_yes.tr,
            fontSize: 13,
            showShadow: false,
          )
        ],
        actionsAlignment: MainAxisAlignment.spaceBetween,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        actionsPadding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        titlePadding: const EdgeInsets.only(top: 10),
        buttonPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static void showLoading({String? content}) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: Container(
            padding: EdgeInsets.all(content == null ? 30 : 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const CupertinoActivityIndicator(),
                  if (content != null)
                    const SizedBox(
                      height: 14,
                    ),
                  if (content != null)
                    Text(
                      content,
                      style: TextStyles.s14MediumText,
                      textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
