import 'package:get/get.dart';
import 'package:mobile/common/utils/google_api.util.dart';

class PickDestinationController extends GetxController {
  Future<void> onSearchChange(String input) async {
    GoogleApiUtil.queryAutocomplete(input);
  }
}
