import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/common/constants/env_keys.dart';

abstract class GoogleAuthUtil {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: Platform.isIOS
        ? dotenv.env[EnvKeys.clientIdIos]
        : '929048173695-b6s5ah4lddubqd1los4611itmbo1d6g2.apps.googleusercontent.com',
    serverClientId: Platform.isIOS
        ? null
        : '929048173695-b6s5ah4lddubqd1los4611itmbo1d6g2.apps.googleusercontent.com',
  );

  static Future<GoogleSignInAccount?> signIn() {
    return _googleSignIn.signIn();
  }

  static Future<GoogleSignInAccount?> signOut() {
    return _googleSignIn.signOut();
  }
}
