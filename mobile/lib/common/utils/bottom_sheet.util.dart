import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';

abstract class BottomSheetUtil {
  static Future<void> show({
    required Widget child,
    bool isSubmit = false,
    String? title,
    double? height,
  }) async {
    await Get.bottomSheet(
      Container(
        // padding: const EdgeInsets.all(12),
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              isSubmit
                  ? Container(
                      height: 50,
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Palette.gray100, width: 0.5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppIconButton(
                            onPressed: () {
                              Get.back();
                            },
                            hasBorder: false,
                            size: 40,
                            icon: const Icon(
                              Icons.close,
                              size: 20,
                              color: Palette.gray400,
                            ),
                          ),
                          Text(
                            title!,
                            style: TextStyles.s17BoldText,
                          ),
                          AppIconButton(
                            onPressed: () {
                              Get.back();
                            },
                            size: 35,
                            backgroundColor: Palette.blue400,
                            icon: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(color: Palette.gray100, width: 0.5),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          height: 6,
                          width: 152,
                          // margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: Palette.gray200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: child,
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      persistent: false,
    );
  }
}
