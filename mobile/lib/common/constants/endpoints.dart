import 'package:mobile/flavors.dart';

abstract class Endpoints {
  // Auth
  static final String auth = '${AppFlavor.apiUrl}/customer/auth';
  static final String authWithGoogle = '$auth/login-with-google';
  static final String authWithEmail = '$auth/login-with-email';

  // User
  static final String user = '${AppFlavor.apiUrl}/customer/user';
}
