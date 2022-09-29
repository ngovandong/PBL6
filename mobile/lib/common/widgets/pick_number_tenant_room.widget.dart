import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';

class PickNumberTenantAndRoom extends StatefulWidget {
  final int initRoom;
  final int initTenant;

  final void Function({
    required int numberOfRooms,
    required int numberOfTenants,
  }) onChangeTenantAndRoom;

  const PickNumberTenantAndRoom({
    super.key,
    required this.onChangeTenantAndRoom,
    this.initRoom = 1,
    this.initTenant = 2,
  });

  @override
  State<PickNumberTenantAndRoom> createState() =>
      _PickNumberTenantAndRoomState();
}

class _PickNumberTenantAndRoomState extends State<PickNumberTenantAndRoom> {
  final TextEditingController tenantEditingController = TextEditingController();
  final TextEditingController roomEditingControlller = TextEditingController();

  @override
  void initState() {
    roomEditingControlller.text = widget.initRoom.toString();
    tenantEditingController.text = widget.initTenant.toString();
    super.initState();
  }

  void onMinus(bool isTenant) {
    setState(() {
      if (isTenant) {
        tenantEditingController.text =
            (int.parse(tenantEditingController.text) - 1).toString();
      } else {
        roomEditingControlller.text =
            (int.parse(roomEditingControlller.text) - 1).toString();
      }
    });
  }

  void onPlus(bool isTenant) {
    setState(() {
      if (isTenant) {
        tenantEditingController.text =
            (int.parse(tenantEditingController.text) + 1).toString();
      } else {
        roomEditingControlller.text =
            (int.parse(roomEditingControlller.text) + 1).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: Get.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      child: Column(
        children: [
          RowPickTenantOrRoom(
            number: roomEditingControlller.text,
            title: 'Phòng',
            onMinus: () => onMinus(false),
            onPlus: () => onPlus(false),
          ),
          RowPickTenantOrRoom(
            number: tenantEditingController.text,
            title: 'Người',
            onMinus: () => onMinus(true),
            onPlus: () => onPlus(true),
          ),
          const Spacer(),
          AppRoundedButton(
            onPressed: () {
              widget.onChangeTenantAndRoom(
                numberOfRooms: int.parse(roomEditingControlller.text),
                numberOfTenants: int.parse(tenantEditingController.text),
              );
              Get.back();
            },
            content: 'Chọn',
            fontSize: 15,
            height: 40,
            showShadow: false,
            backgroundColor: Palette.blue400,
            // isDisable: !isValidate,
          )
        ],
      ),
    );
  }
}

class RowPickTenantOrRoom extends StatelessWidget {
  final String number;
  final String title;
  final void Function() onMinus;
  final void Function() onPlus;

  const RowPickTenantOrRoom({
    super.key,
    required this.number,
    required this.title,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          SizedBox.square(
            dimension: 50,
            child: Center(
              child: Text(
                number,
                style: TextStyles.s17MediumText,
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyles.s17MediumText,
            ),
          ),
          AppIconButton(
            onPressed: onMinus,
            width: 50,
            height: 50,
            hasBorder: false,
            isDisable: number.compareTo('1') == 0,
            icon: Icon(
              PhosphorIcons.minus_circle_light,
              color: number.compareTo('1') == 0
                  ? Palette.gray300
                  : Palette.blue400,
              size: 28,
            ),
          ),
          AppIconButton(
            onPressed: onPlus,
            width: 50,
            height: 50,
            hasBorder: false,
            icon: const Icon(
              PhosphorIcons.plus_circle_light,
              color: Palette.blue400,
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
