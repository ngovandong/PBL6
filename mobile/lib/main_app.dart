import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile/app.dart';
import 'package:mobile/common/utils/dio/my_http_override.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/flavors.dart';
import 'package:mobile/generated/assets.gen.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  configureDependencies();
  await dotenv.load(fileName: Assets.secure.env);
}

Future<void> mainApp(Flavor flavor) async {
  AppFlavor.appFlavor = flavor;
  await initApp();

  runApp(const MyApp());
}
