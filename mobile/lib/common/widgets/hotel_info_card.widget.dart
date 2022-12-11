import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

class HotelInfoCard extends StatelessWidget {
  final bool showPrice;

  const HotelInfoCard({
    super.key,
    this.showPrice = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        children: [
          Row(
            children: [
              SizedBox(
                height: 150,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://phuot3mien.com/wp-content/uploads/2020/03/cau-rong-da-nang-phuot3mien.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Coco Hotel',
                          style: TextStyles.s17BoldText,
                        ),
                        Spacer(),
                        Icon(
                          PhosphorIcons.heart_light,
                          color: Palette.gray700,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: const [
                        Text(
                          '4.9',
                          style: TextStyles.s17BoldText,
                        ),
                        Icon(
                          PhosphorIcons.star_fill,
                          size: 17,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.bed_rounded,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Phòng Deluxe',
                          style: TextStyles.s14RegularText,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: const [
                        Icon(
                          PhosphorIcons.map_pin,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Hội An, Quảng Nam',
                          style: TextStyles.s14RegularText,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: const [
                        Icon(
                          PhosphorIcons.calendar_check,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '12/10/2022 - 20/10/2022',
                          style: TextStyles.s14RegularText,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: const [
                        Icon(
                          PhosphorIcons.user,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '2 khách',
                          style: TextStyles.s14RegularText,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          if (showPrice)
            const Divider(
              height: 30,
            ),
          if (showPrice)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '916.667 đ',
                style: TextStyles.s17BoldText.copyWith(color: Palette.red400),
              ),
            ),
        ],
      ),
    );
  }
}
