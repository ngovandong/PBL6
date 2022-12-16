import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/error_view.widget.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';
import 'package:mobile/common/widgets/login_view_data.widget.dart';
import 'package:mobile/common/widgets/search_empty.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/favorite_host/widgets/favorite_host_item.widget.dart';

class FavoriteView extends GetView<FavoriteLookupController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        title: Text(
          LocaleKeys.favorite_hotel.tr,
          style: TextStyles.s17BoldText,
        ),
        toolbarHeight: 45,
        titleSpacing: 0,
        bottom: Container(
          color: Colors.white,
          height: 10,
        ),
        bottomSize: 10,
      ),
      body: Obx(() {
        switch (controller.getDataStatus.value) {
          case HandleStatus.HAS_DATA:
            if (controller.favoriteHosts.isEmpty) {
              return SearchEmpty(
                width: Get.width * 0.8,
                content: 'Danh sách khách sạn yêu thích trống',
              );
            } else {
              return ListView.separated(
                itemCount: controller.favoriteHosts.length,
                padding: const EdgeInsets.all(
                  UIConfigs.horizontalPadding,
                ),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return FavoriteHostItem(
                    favoriteHost: controller.favoriteHosts[index],
                  );
                },
              );
            }

          case HandleStatus.LOADING:
            return const Center(
              child: LoadingDot(
                dotColor: Palette.blue400,
              ),
            );
          case HandleStatus.HAS_ERROR:
            return ErrorBanner(
              title: 'Thử lại',
              action: () async {
                await controller.getFavoriteHosts();
              },
            );
          case HandleStatus.NORMAL:
            return LoginViewData(
              lottiePath: Assets.lotties.favoriteHost,
              title: 'Lưu giữ các chỗ nghỉ yêu thích của bạn',
              content:
                  'Đăng nhập để xem tất cả chỗ nghỉ yêu thích mà bạn đang có',
            );
        }
      }),
      backgroundColor: Palette.background,
    );
  }
}
