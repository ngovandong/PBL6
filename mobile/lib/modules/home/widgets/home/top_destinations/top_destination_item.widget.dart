import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

class TopDestinationItem extends StatelessWidget {
  const TopDestinationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxHeight = constraints.maxHeight;
        final double maxWidth = constraints.maxWidth;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Image.network(
                  'https://phuot3mien.com/wp-content/uploads/2020/03/cau-rong-da-nang-phuot3mien.jpg',
                  height: 0.5 * maxHeight,
                  width: maxWidth,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Đà Nẵng',
                        style: TextStyles.boldText.copyWith(fontSize: 14.sp),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Palette.red500,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Bãi biển',
                            style: TextStyles.regularText
                                .copyWith(fontSize: 11.sp),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Palette.red500,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Tham quan',
                            style: TextStyles.regularText
                                .copyWith(fontSize: 11.sp),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Palette.red500,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Thiên nhiên',
                            style: TextStyles.regularText
                                .copyWith(fontSize: 11.sp),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
