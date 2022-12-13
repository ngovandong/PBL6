import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

class BookingPayment extends StatelessWidget {
  const BookingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyles.s14MediumText.copyWith(color: Palette.red500),
          ),
          const SizedBox(
            width: 6,
          ),
          const Icon(Icons.chevron_right_rounded)
        ],
      ),
    );
  }
}
