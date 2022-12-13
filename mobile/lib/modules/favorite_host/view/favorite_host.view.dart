import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/hotel_info_card.widget.dart';
import 'package:mobile/generated/locales.g.dart';

class FavoriteView extends StatelessWidget {
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
      body: ListView.separated(
        itemCount: 5,
        padding: const EdgeInsets.all(
          UIConfigs.horizontalPadding,
        ),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          // return const HotelInfoCard(
          //   showPrice: false,
          // );
          return const SizedBox();
        },
      ),
      backgroundColor: Palette.background,
    );
  }
}
