import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/bottom_sheet.util.dart';
import 'package:mobile/common/widgets/pick_number_tenant_room.widget.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';

class TenantRoomFrame extends GetView<HomeController> {
  const TenantRoomFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await BottomSheetUtil.show(
          child: PickNumberTenantAndRoom(
            onChangeTenantAndRoom: controller.onChangeTenantAndRoom,
            initTenant: controller.searchHotelsParams.value.quantityPerson,
          ),
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
                '1 phòng - ${controller.searchHotelsParams.value.quantityPerson} người',
                style: TextStyles.s14RegularText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
