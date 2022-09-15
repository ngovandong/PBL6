import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/common/constants/asset_paths.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

abstract class SnackbarUtil {
  static void showSuccess(String message, BuildContext context) {
    return showGeneral(
      message,
      context,
      backgroundColor: Palette.green300,
      prefixIcon: Icons.check_circle_rounded,
    );
  }

  static void showError(String message, BuildContext context) {
    return showGeneral(
      message,
      context,
      backgroundColor: Palette.red300,
      prefixIcon: Icons.highlight_off_rounded,
    );
  }

  static void showGeneral(
    String message,
    BuildContext context, {
    Color? backgroundColor,
    IconData? prefixIcon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (prefixIcon != null)
              Icon(
                prefixIcon,
                size: 24,
                color: Colors.white,
              ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.regularText
                    .copyWith(color: Colors.white, fontSize: 16.sp),
              ),
            )
          ],
        ),
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.5,
      ),
    );
  }

  static void showAnimated(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 45,
              padding: const EdgeInsets.only(left: 60, top: 6, bottom: 6),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đăng nhập không thành công',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.regularText
                      .copyWith(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  AssetPaths.bubblesImage,
                  height: 30,
                  width: 25,
                  color: Palette.red600,
                ),
              ),
            ),
            Positioned(
              top: -25,
              left: 25,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AssetPaths.backImage,
                    height: 40,
                    width: 40,
                    color: Palette.red600,
                  ),
                  Positioned(
                    top: 9,
                    child: SvgPicture.asset(
                      AssetPaths.failureIcon,
                      height: 18,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.fromLTRB(12, 40, 12, 0),
        padding: EdgeInsets.zero,
        // padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Palette.red400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.5,
      ),
    );
  }
}
