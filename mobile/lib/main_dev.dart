import 'package:flutter/material.dart';
import 'package:mobile/app.dart';
import 'package:mobile/flavors.dart';

Future<void> main() async {
  await initApp();

  AppFlavor.appFlavor = Flavor.DEV;
  runApp(const MyApp());
}
