import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/icon_title.widget.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/favorite_host/data/model/favorite_host.model.dart';

class FavoriteHostItem extends GetView<FavoriteLookupController> {
  final FavoriteHostModel favoriteHost;

  const FavoriteHostItem({
    super.key,
    required this.favoriteHost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              favoriteHost.avatarImage,
              fit: BoxFit.cover,
              height: double.infinity,
              width: 100,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  favoriteHost.hostName,
                  style: TextStyles.s17BoldText,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: List.generate(
                    favoriteHost.ratingStar,
                    (index) => const Icon(
                      PhosphorIcons.star_fill,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                IconTitle(
                  icon: PhosphorIcons.map_pin,
                  title: favoriteHost.address,
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
          AppIconButton(
            onPressed: () async {
              controller.deleteFavoriteHost(favoriteHost.hostId);
            },
            width: 40,
            height: 40,
            hasBorder: false,
            icon: const Icon(
              Icons.favorite_rounded,
              size: 28,
              color: Palette.red500,
            ),
          ),
        ],
      ),
    );
  }
}
