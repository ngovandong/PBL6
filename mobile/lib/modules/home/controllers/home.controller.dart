import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/modules/home/data/models/dtos/search_hotels.dto.dart';
import 'package:mobile/modules/search_hotel/search_hotel.enum.dart';
import 'package:mobile/modules/search_hotel/search_hotel.eventbus.dart';

class HomeController extends GetxController {
  late Rx<SearchHotelsDTO> searchHotelsParams;

  final TextEditingController locationTextController = TextEditingController();

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
    // searchHotelsParams.value.numberOfRooms = numberOfRooms;
    searchHotelsParams.value.quantityPerson = numberOfTenants;
    searchHotelsParams.refresh();
  }

  void findHotels() {
    if (Get.currentRoute == RouteManager.searchHotel) {
      EventBusUtil.fireEvent(
        SearchHotelInternalEvent(
          SearchHotelInternalEventEnum.refreshData,
          null,
        ),
      );
    } else {
      Get.toNamed(RouteManager.searchHotel);
    }
  }
}
