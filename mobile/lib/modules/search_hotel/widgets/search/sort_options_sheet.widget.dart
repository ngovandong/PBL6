import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';

class SortOptionsSheet extends StatefulWidget {
  const SortOptionsSheet({super.key});

  @override
  State<SortOptionsSheet> createState() => _SortOptionsSheetState();
}

class _SortOptionsSheetState extends State<SortOptionsSheet> {
  final List<String> sortOptions = [
    'Mức phổ bién',
    'Đánh giá tốt nhất và giá thấp nhất',
    'Thứ hạng sao (ưu tiên cao nhất)',
    'Thứ hạng sao (ưu tiên thấp nhất)',
    'Ưu tiên khách sạn được đánh giá tốt nhất',
    'Giá (ưu tiên thấp nhất)'
  ];

  late String selectedOption;

  @override
  void initState() {
    selectedOption = sortOptions[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sắp xếp theo',
              style: TextStyles.s17BoldText,
            ),
            AppIconButton(
              onPressed: () {
                Get.back();
              },
              size: 35,
              backgroundColor: Palette.blue400,
              icon: const Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ...sortOptions.map((e) {
          return RadioListTile(
            value: e,
            title: Text(
              e,
              style: TextStyles.s14MediumText,
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          );
        }).toList()
      ],
    );
  }
}
