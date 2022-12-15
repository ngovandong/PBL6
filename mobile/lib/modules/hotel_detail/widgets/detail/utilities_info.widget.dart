import 'package:flutter/material.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/utility_content.util.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/info_card.widget.dart';

class UtilitiesInfo extends StatelessWidget {
  final List<String> utilities;
  const UtilitiesInfo({super.key, required this.utilities});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Những tiện ích',
                style: TextStyles.s17BoldText,
              ),
              Text(
                'xem tất cả',
                style: TextStyles.s14RegularText.copyWith(
                  color: Palette.blue300,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Wrap(
            children: List.generate(utilities.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          UtilityContentUtil.getIcon(utilities[index]),
                          size: 17,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 3),
                      ),
                      TextSpan(
                        text: UtilityContentUtil.getLabel(utilities[index]),
                        style: TextStyles.s14RegularText,
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
