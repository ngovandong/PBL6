import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/modules/home/controllers/pick_destination.controller.dart';

class PickDestinationScreen extends GetView<PickDestinationController> {
  const PickDestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          title: Text(
            'Chọn điểm đến',
            style: TextStyles.regularText
                .copyWith(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Palette.blue400,
          toolbarHeight: 50,
          hasBackIcon: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Bạn muốn đi đâu?',
              borderColor: Palette.blue400,
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Palette.blue400,
              ),
              extendField: false,
              onChanged: controller.onSearchChange,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
