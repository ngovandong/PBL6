import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/common/constants/env_keys.dart';

enum Flavor {
  PROD,
  DEV,
}

class AppFlavor {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'ReadyBooking';
      case Flavor.DEV:
        return 'ReadyBooking DEV';
      default:
        return 'title';
    }
  }

  static String get apiUrl {
    switch (appFlavor) {
      case Flavor.PROD:
        return dotenv.env[EnvKeys.apiUrlProd]!;
      case Flavor.DEV:
        return dotenv.env[EnvKeys.apiUrlDev]!;
      default:
        return '';
    }
  }

  static String get socketUrl {
    switch (appFlavor) {
      case Flavor.PROD:
        return dotenv.env[EnvKeys.socketUrl]!;
      case Flavor.DEV:
        return dotenv.env[EnvKeys.socketUrl]!;
      default:
        return '';
    }
  }
}
