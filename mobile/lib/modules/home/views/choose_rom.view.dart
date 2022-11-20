import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/pick_number_tenant_room.widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ChooseRoomScreen extends StatelessWidget {
  const ChooseRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: GestureDetector(
          onTap: () {},
          child: Column(
            children: const [
              Text(
                'Coco hotel',
                style: TextStyles.s17BoldText,
              ),
              Text(
                '2 khách, 23/10/2022 - 24/10/2022',
                style: TextStyles.s14MediumText,
              )
            ],
          ),
        ),
        hasBackIcon: true,
        elevation: 2,
        leadingBackgroundColor: Palette.background,
        backIconColor: Palette.blue400,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
        itemCount: 3,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phòng superior',
                            style: TextStyles.s17BoldText,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: SizedBox(
                              height: 20,
                              child: Row(
                                children: const [
                                  Text(
                                    '17 m\u00B2',
                                    style: TextStyles.s14MediumText,
                                  ),
                                  VerticalDivider(
                                    width: 12,
                                    color: Palette.gray300,
                                  ),
                                  Text(
                                    'Tối đa 2 người lớn',
                                    style: TextStyles.s14MediumText,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Text(
                            '1 giường đôi lớn',
                            style: TextStyles.s14MediumText,
                          ),
                        ],
                      ),
                      Text(
                        '916.667 đ',
                        style: TextStyles.boldText.copyWith(
                          color: Palette.red400,
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.check,
                          color: Palette.green400,
                          size: 18,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 4,
                        ),
                      ),
                      TextSpan(
                        text: 'View nhìn ra biển',
                        style: TextStyles.s14RegularText,
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.check,
                          color: Palette.green400,
                          size: 18,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 4,
                        ),
                      ),
                      TextSpan(
                        text: 'View nhìn ra biển',
                        style: TextStyles.s14RegularText,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppRoundedButton(
                      width: (Get.width -
                              UIConfigs.horizontalPadding * 2 -
                              10 * 2 -
                              60) /
                          2,
                      height: 45,
                      onPressed: () async {
                        await showBarModalBottomSheet(
                          context: context,
                          enableDrag: false,
                          builder: (context) {
                            return PickNumberTenantAndRoom(
                              onChangeTenantAndRoom: ({
                                required int numberOfRooms,
                                required int numberOfTenants,
                              }) {},
                              hasShowTenant: false,
                            );
                          },
                        );
                      },
                      content: 'Số phòng: 1',
                      showShadow: false,
                      showBorder: true,
                      backgroundColor: Colors.white,
                      textColor: Palette.blue300,
                      fontSize: 14,
                    ),
                    AppRoundedButton(
                      width: (Get.width -
                              UIConfigs.horizontalPadding * 2 -
                              10 * 2 -
                              60) /
                          2,
                      height: 45,
                      onPressed: () {},
                      content: 'Đặt ngay',
                      showShadow: false,
                      fontSize: 14,
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// 