import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/home/widgets/search_hotels/search_hotels_box.widget.dart';

class SearchHotelScreen extends StatelessWidget {
  const SearchHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SearchHotelsBox(),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 10,
                );
              }),
              itemBuilder: (context, index) {
                return Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Palette.gray100),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: PageView.builder(
                          itemCount: 4,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://phuot3mien.com/wp-content/uploads/2020/03/cau-rong-da-nang-phuot3mien.jpg',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          'Coco Hotel',
                          style: TextStyles.s17BoldText,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            PhosphorIcons.map_pin_light,
                            size: 18,
                          ),
                          Text(
                            'Hội An, Quảng Nam',
                            style: TextStyles.s14regularText,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            const Text(
                              '4.9',
                              style: TextStyles.s17BoldText,
                            ),
                            const Icon(
                              PhosphorIcons.star_fill,
                              size: 17,
                              color: Colors.yellow,
                            ),
                            Text(
                              ' - 1,127 đánh giá',
                              style: TextStyles.s14regularText
                                  .copyWith(color: Palette.gray300),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(
                                        color: Palette.green500,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const Text(
                                      '2 phòng ngủ',
                                      style: TextStyles.s14regularText,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(
                                        color: Palette.green500,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const Text(
                                      'View nhìn ra biển',
                                      style: TextStyles.s14regularText,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      margin: const EdgeInsets.only(right: 5),
                                      decoration: const BoxDecoration(
                                        color: Palette.green500,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const Text(
                                      'Hồ bơi',
                                      style: TextStyles.s14regularText,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 150,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 2),
                                    blurRadius: 12,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Palette.red400,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '3 ngày, 2 người',
                                        style: TextStyles.s14regularText
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        '916.667 đ',
                                        style: TextStyles.boldText.copyWith(
                                          color: Palette.red400,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      backgroundColor: Palette.background,
    );
  }
}
