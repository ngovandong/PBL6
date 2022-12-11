import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';
import 'package:mobile/modules/home/controllers/search_location.controller.dart';
import 'package:mobile/modules/home/data/models/location.model.dart';

class SearchDestinationView extends GetView<SearchLocationController> {
  const SearchDestinationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Chọn điểm đến',
          style: TextStyles.s17BoldText.copyWith(color: Colors.white),
        ),
        backgroundColor: Palette.blue400,
        toolbarHeight: 50,
        hasBackIcon: true,
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
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: LoadingDot(
                          dotColor: Palette.blue400,
                        ),
                      )
                    : ListView.separated(
                        itemCount: controller.locationSuggestions.length,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 12,
                          );
                        },
                        itemBuilder: (context, index) {
                          final LocationModel currentLocationSearch =
                              controller.locationSuggestions[index];
                          return GestureDetector(
                            onTap: () {
                              controller.chooseLocation(index);
                            },
                            behavior: HitTestBehavior.opaque,
                            child: SizedBox(
                              width: Get.width - 24,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentLocationSearch.placeName,
                                    style: TextStyles.s14BoldText,
                                  ),
                                  Text(
                                    currentLocationSearch.address,
                                    style: TextStyles.s14MediumText,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
