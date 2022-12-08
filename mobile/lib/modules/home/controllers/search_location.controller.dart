import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/data/models/location.model.dart';
import 'package:mobile/modules/home/data/repositories/location.repository.dart';

class SearchLocationController extends GetxController {
  final LocationRepository searchDestinationRepository;
  final HomeController homeController;

  SearchLocationController({
    required this.searchDestinationRepository,
    required this.homeController,
  });

  RxList<LocationModel> locationSuggestions = <LocationModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> onSearchChange(String input) async {
    try {
      isLoading.value = true;

      locationSuggestions.value =
          await searchDestinationRepository.getLocationSuggestions(input);
    } catch (err) {
      log('Error in onSearchChange');
      locationSuggestions.value = [];
    } finally {
      isLoading.value = false;
    }
  }

  void chooseLocation(int selectedIndex) {
    final LocationModel selectedLocation = locationSuggestions[selectedIndex];

    homeController.searchHotelsParams.value.searchText =
        selectedLocation.placeName;
    homeController.searchHotelsParams.value.searchType =
        selectedLocation.placeType;
    homeController.locationTextController.text = selectedLocation.placeName;
    homeController.searchHotelsParams.refresh();

    Get.back();
  }
}
