import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';

class BookingStepView extends StatelessWidget {
  const BookingStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: GestureDetector(
          onTap: () {},
          child: Column(
            children: const [
              Text(
                'Đặt phòng',
                style: TextStyles.s17BoldText,
              ),
            ],
          ),
        ),
        hasBackIcon: true,
        elevation: 2,
        leadingBackgroundColor: Palette.background,
        backIconColor: Palette.zodiacBlue,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 240,
                    width: Get.width,
                    padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.network(
                            'https://htluxuryhotel.vn/wp-content/uploads/2022/01/Khach-san-ok-scaled.jpg',
                            height: 240 - 2 * UIConfigs.horizontalPadding,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: UIConfigs.horizontalPadding,
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'H&T Luxury Hotel',
                                style:
                                    TextStyles.boldText.copyWith(fontSize: 18),
                              ),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        PhosphorIcons.map_pin_light,
                                        size: 18,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '59 Lê Duẩn, Trung tâm thành phố Đà Nẵng, Đà Nẵng',
                                      style: TextStyles.s14MediumText,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UIConfigs.horizontalPadding,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Nhận phòng',
                                style: TextStyles.s17BoldText,
                              ),
                              Text(
                                '26/11/2022',
                                style: TextStyles.mediumText.copyWith(
                                  fontSize: 16,
                                  color: Palette.gray300,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          height: UIConfigs.horizontalPadding * 2,
                        ),
                        SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Trả phòng',
                                style: TextStyles.s17BoldText,
                              ),
                              Text(
                                '27/11/2022',
                                style: TextStyles.mediumText.copyWith(
                                  fontSize: 16,
                                  color: Palette.gray300,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          height: UIConfigs.horizontalPadding * 2,
                        ),
                        SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Khách',
                                style: TextStyles.s17BoldText,
                              ),
                              Text(
                                '2 người',
                                style: TextStyles.mediumText.copyWith(
                                  fontSize: 16,
                                  color: Palette.gray300,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UIConfigs.horizontalPadding,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Phòng superior giường đôi',
                                    style: TextStyles.s17BoldText,
                                  ),
                                  Text(
                                    'Số lượng: 2',
                                    style: TextStyles.s14RegularText
                                        .copyWith(color: Palette.gray300),
                                  )
                                ],
                              ),
                              const Icon(Icons.chevron_right_rounded)
                            ],
                          ),
                        ),
                        const Divider(
                          height: UIConfigs.horizontalPadding * 2,
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Phòng view nhìn ra biển',
                                    style: TextStyles.s17BoldText,
                                  ),
                                  Text(
                                    'Số lượng: 2',
                                    style: TextStyles.s14RegularText
                                        .copyWith(color: Palette.gray300),
                                  )
                                ],
                              ),
                              const Icon(Icons.chevron_right_rounded)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UIConfigs.horizontalPadding,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tổng cộng',
                          style: TextStyles.s17BoldText,
                        ),
                        Text(
                          '200,000đ',
                          style: TextStyles.s17BoldText
                              .copyWith(color: Palette.red500),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: UIConfigs.horizontalPadding,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
                    child: Row(
                      children: [
                        const Icon(
                          PhosphorIcons.currency_circle_dollar,
                          color: Palette.red200,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          'Phương thức thanh toán',
                          style: TextStyles.s17BoldText,
                        ),
                        const Spacer(),
                        Text(
                          'VNPay',
                          style: TextStyles.s14MediumText
                              .copyWith(color: Palette.red500),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Icon(Icons.chevron_right_rounded)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Text(
                    '200,000đ',
                    style:
                        TextStyles.s17BoldText.copyWith(color: Palette.red500),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: AppRoundedButton(
                      onPressed: () {
                        // Get.toNamed(RouteManager.bookingStep);
                      },
                      content: 'Đặt phòng',
                      fontSize: 15,
                      showShadow: false,
                      backgroundColor: Palette.red500,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
