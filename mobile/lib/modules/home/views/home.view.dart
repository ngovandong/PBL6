import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_date_picker.widget.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/common/widgets/pick_number_tenant_room.widget.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/data/dtos/search_hotels.dto.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Palette.background,
          elevation: 0,
          toolbarHeight: 60,
          titleSpacing: 15,
          title: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Minh Đức',
                style: TextStyles.s17BoldText,
              )
            ],
          ),
          actions: [
            AppIconButton(
              onPressed: () {},
              width: 40,
              height: 40,
              borderColor: Palette.blue400,
              isCircle: true,
              icon: Icon(
                PhosphorIcons.bell_ringing_bold,
                color: Palette.blue400,
                size: 18.sp,
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Palette.blue400),
                ),
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: LocaleKeys.find_hotel_choose_destination.tr,
                        prefixIcon: const Icon(
                          PhosphorIcons.magnifying_glass_bold,
                          color: Palette.blue400,
                        ),
                        borderColor: Colors.white,
                        borderRadius: 0,
                        extendField: false,
                        readOnly: true,
                        enabled: false,
                      ),
                      const Divider(
                        height: 0,
                        thickness: 0.6,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showBarModalBottomSheet(
                            context: context,
                            enableDrag: false,
                            builder: (context) {
                              final SearchHotelsDTO searchHotelsParams =
                                  controller.searchHotelsParams.value;

                              return AppDatePicker(
                                initStartDate: searchHotelsParams.checkinDate,
                                initEndDate: searchHotelsParams.checkinDate,
                                onSubmitRange:
                                    controller.onChangeCheckinCheckoutDate,
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 48,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              const SizedBox.square(
                                dimension: 48,
                                child: Center(
                                  child: Icon(
                                    PhosphorIcons.calendar_blank_bold,
                                    color: Palette.blue400,
                                  ),
                                ),
                              ),
                              Obx(
                                () => RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Ngày nhận phòng\n',
                                        style: TextStyles.s14regularText
                                            .copyWith(color: Palette.gray100),
                                      ),
                                      TextSpan(
                                        text: controller.searchHotelsParams
                                            .value.checkinDate
                                            .toShowUIDate(),
                                        style: TextStyles.s14regularText,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Obx(
                                () => RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Ngày trả phòng\n',
                                        style: TextStyles.s14regularText
                                            .copyWith(color: Palette.gray100),
                                      ),
                                      TextSpan(
                                        text: controller.searchHotelsParams
                                            .value.checkoutDate
                                            .toShowUIDate(),
                                        style: TextStyles.s14regularText,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 70,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 0.6,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showBarModalBottomSheet(
                            context: context,
                            enableDrag: false,
                            builder: (context) {
                              return PickNumberTenantAndRoom(
                                onChangeTenantAndRoom:
                                    controller.onChangeTenantAndRoom,
                                initRoom: controller
                                    .searchHotelsParams.value.numberOfRooms,
                                initTenant: controller
                                    .searchHotelsParams.value.numberOfTenants,
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 48,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              const SizedBox.square(
                                dimension: 48,
                                child: Center(
                                  child: Icon(
                                    PhosphorIcons.user_bold,
                                    color: Palette.blue400,
                                  ),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '${controller.searchHotelsParams.value.numberOfRooms} phòng - ${controller.searchHotelsParams.value.numberOfTenants} người',
                                  style: TextStyles.s14regularText,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      AppRoundedButton(
                        onPressed: () {},
                        content: 'Tìm',
                        showShadow: false,
                        height: 48,
                        borderRadius: 0,
                        backgroundColor: Palette.blue400,
                      )
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: Text(
                    'Khám phá thêm',
                    style: TextStyles.s17BoldText,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 15),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 15);
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://gonatour.vn/vnt_upload/news/04_2020/du_lich_ha_noi.jpg',
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
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
                        style: TextStyles.s14regularText
                            .copyWith(color: Palette.blue400),
                      )
                    ],
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1 / 1.1,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
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
                                      style: TextStyles.boldText
                                          .copyWith(fontSize: 14.sp),
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
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                },
              )
            ],
          ),
        ),
        backgroundColor: Palette.background,
      ),
    );
  }
}
