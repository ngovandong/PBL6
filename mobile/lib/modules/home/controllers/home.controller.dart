import 'package:get/get.dart';
import 'package:mobile/modules/home/data/dtos/search_hotels.dto.dart';
import 'package:mobile/modules/home/data/repositories/user.repository.dart';

class HomeController extends GetxController {
  final UserRepository userRepository;
  HomeController({required this.userRepository});

  late Rx<SearchHotelsDTO> searchHotelsParams;

  @override
  void onInit() {
    _setSearchHotelsParams();
    super.onInit();
  }

  void _setSearchHotelsParams() {
    final DateTime dateNow = DateTime.now();
    final DateTime today = DateTime(dateNow.year, dateNow.month, dateNow.day);
    final DateTime tomorrow =
        DateTime(dateNow.year, dateNow.month, dateNow.day + 1);

    searchHotelsParams = SearchHotelsDTO(
      checkinDate: today,
      checkoutDate: tomorrow,
      numberOfRooms: 1,
      numberOfTenants: 2,
    ).obs;
  }

  void onChangeCheckinCheckoutDate(
    DateTime checkinDate,
    DateTime checkoutDate,
  ) {
    searchHotelsParams.value.checkinDate = checkinDate;
    searchHotelsParams.value.checkoutDate = checkoutDate;
    searchHotelsParams.refresh();
  }

  void onChangeTenantAndRoom({
    required int numberOfRooms,
    required int numberOfTenants,
  }) {
    searchHotelsParams.value.numberOfRooms = numberOfRooms;
    searchHotelsParams.value.numberOfTenants = numberOfTenants;
    searchHotelsParams.refresh();
  }
}
