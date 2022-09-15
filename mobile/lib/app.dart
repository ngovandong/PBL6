import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/base/bindings/base.binding.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PBL6 Booking',
          getPages: RouteManager.pages,
          initialRoute: RouteManager.login,
          initialBinding: BaseBinding(),
          translationsKeys: AppTranslation.translations,
          fallbackLocale: const Locale('vi', 'VN'),
          locale: Get.deviceLocale,
        );
      },
    );
  }
}
