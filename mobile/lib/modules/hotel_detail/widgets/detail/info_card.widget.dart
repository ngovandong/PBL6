import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';

class InfoCard extends StatelessWidget {
  final Widget child;

  const InfoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - UIConfigs.horizontalPadding * 2,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: child,
    );
  }
}
