import 'package:flutter/material.dart';
import 'package:mobile/common/theme/text_styles.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 12,
          ),
        ],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
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
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Minh Đức',
                style: TextStyles.s17BoldText,
              ),
              Text(
                'nguyenminhduc.dev@gmail.com',
                style: TextStyles.s14MediumText,
              )
            ],
          )
        ],
      ),
    );
  }
}
