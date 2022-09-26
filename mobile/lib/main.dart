import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/app.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/injector.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await initApp();
  runApp(const MyApp());
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  initDependencies();
  await dotenv.load(fileName: Assets.secure.env);
}
