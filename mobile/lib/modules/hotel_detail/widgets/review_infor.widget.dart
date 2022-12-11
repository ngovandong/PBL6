import 'package:flutter/material.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/hotel_detail/widgets/info_card.widget.dart';

class ReviewInfo extends StatelessWidget {
  const ReviewInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Đánh giá và nhận xét',
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
    );
  }
}
