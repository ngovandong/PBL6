import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/modules/welcome/controllers/welcome.controller.dart';

class SplashView extends GetView<WelcomeController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.icons.app.appIconSvg.svg(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
