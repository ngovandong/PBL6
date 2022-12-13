import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/confirm_and_pin_code.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/icon_title.widget.dart';

class DetailBookingHistoryView extends StatelessWidget {
  const DetailBookingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackIcon: true,
        title: Text(
          'Thông tin đặt phòng',
          style: TextStyles.s14BoldText.copyWith(color: Colors.white),
        ),
        backgroundColor: Palette.blue400,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đặt chỗ của bạn đã được xác nhận!',
                style: TextStyles.s17BoldText.copyWith(color: Palette.green700),
              ),
              const SizedBox(
                height: 10,
              ),
              const ConfirmAndPinCode(
                confirmCode: '123123123123',
                pinCode: '2181',
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Luxury Hotel',
                style: TextStyles.s17BoldText,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: List.generate(
                  4,
                  (index) => const Icon(
                    PhosphorIcons.star_fill,
                    color: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const IconTitle(
                icon: PhosphorIcons.calendar_check,
                title: '10/12/2022 - 12/12/2022',
              ),
              const SizedBox(
                height: 10,
              ),
              const IconTitle(
                icon: PhosphorIcons.map_pin,
                title:
                    '62 An Thượng 26, Mỹ An Ward, Ngũ Hành Sơn District, Đà Nẵng',
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 0,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Bạn đã đặt 1 phòng',
                style: TextStyles.s17BoldText,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 6,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.blue400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Phòng Deluxe giường đôi',
                                style: TextStyles.s14BoldText,
                              ),
                              IconTitle(
                                icon: Icons.bed_rounded,
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(2, (index) {
                                      return const Text('Giường đôi');
                                    }),
                                  ),
                                ),
                              ),
                              const IconTitle(
                                icon: Icons.confirmation_number_outlined,
                                title: 'Số lượng: 2',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          200000.toMoneyFormat,
                          style: TextStyles.s17BoldText
                              .copyWith(color: Palette.red400),
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 0,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tổng cộng',
                    style: TextStyles.s17BoldText,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        123123.toMoneyFormat,
                        style: TextStyles.s17BoldText
                            .copyWith(color: Palette.red400),
                      ),
                      const Text('Đã bao gồm thuế và phí')
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
