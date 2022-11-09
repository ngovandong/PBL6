import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/common/constants/env_keys.dart';

abstract class GoogleAuthUtil {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: dotenv.env[EnvKeys.clientIdIos],
  );

  static Future<GoogleSignInAccount?> signIn() {
    return _googleSignIn.signIn();
  }

  static Future<GoogleSignInAccount?> signOut() {
    return _googleSignIn.signOut();
  }
}
