import 'package:flutter/material.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/home/widgets/top_destinations/top_destination_item.widget.dart';

class ListTopDestinations extends StatelessWidget {
  const ListTopDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Các điểm đến hàng đầu',
                  style: TextStyles.s17BoldText,
                ),
                Text(
                  'xem tất cả',
                  style: TextStyles.s14RegularText
                      .copyWith(color: Palette.blue400),
                )
              ],
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: UIConfigs.horizontalPadding,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: UIConfigs.horizontalPadding,
            crossAxisSpacing: UIConfigs.horizontalPadding,
            childAspectRatio: 1 / 1.1,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const TopDestinationItem();
          },
        )
      ],
    );
  }
}
