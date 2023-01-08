import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/widgets/refresh_indicator.widget.dart';
import 'package:mobile/generated/fonts.gen.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/base/bindings/base.binding.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => const RefreshHeaderIndicator(),
      footerBuilder: () => const RefreshFooterIndicator(),
      child: GetMaterialApp(
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
      ),
    );
  }
}
