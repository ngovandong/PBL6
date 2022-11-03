import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/generated/fonts.gen.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/base/bindings/base.binding.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  initDependencies();
  await dotenv.load(fileName: Assets.secure.env);
}

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
          theme: ThemeData(
            fontFamily: FontFamily.mulish,
            splashFactory: NoSplash.splashFactory,
          ),
          debugShowCheckedModeBanner: false,
          title: 'TravelBooking',
          getPages: RouteManager.pages,
          initialRoute: RouteManager.splash,
          initialBinding: BaseBinding(),
          defaultTransition: Transition.noTransition,
          translationsKeys: AppTranslation.translations,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [Locale('vi', 'VN'), Locale('en', 'US')],
          fallbackLocale: const Locale('vi', 'VN'),
          locale: const Locale('vi', 'VN'),
        );
      },
    );
  }
}
