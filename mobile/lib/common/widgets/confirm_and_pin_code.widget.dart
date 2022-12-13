import 'package:flutter/material.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

class ConfirmAndPinCode extends StatelessWidget {
  final String confirmCode;
  final String pinCode;

  const ConfirmAndPinCode({
    super.key,
    required this.confirmCode,
    required this.pinCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Palette.blue400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mã xác nhận: ',
            style: TextStyles.s14MediumText,
          ),
          Text(
            confirmCode,
            style: TextStyles.s14BoldText,
          ),
          // Row(
          //   children: [
          //     const ,

          //   ],
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   children: [
          //     const Text(
          //       'Mã PIN: ',
          //       style: TextStyles.s14MediumText,
          //     ),
          //     Text(
          //       pinCode,
          //       style: TextStyles.s14BoldText,
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
