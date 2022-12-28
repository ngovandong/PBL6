import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherUtil {
  static Future<void> loadUrl(String url) async {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    );
  }
}
