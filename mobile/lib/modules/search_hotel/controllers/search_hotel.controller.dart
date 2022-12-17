import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/favorite_host/favorite_host.enum.dart';
import 'package:mobile/modules/favorite_host/favorite_host.eventbus.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';
import 'package:mobile/modules/search_hotel/data/repositories/host.repository.dart';
import 'package:mobile/modules/search_hotel/search_hotel.enum.dart';
import 'package:mobile/modules/search_hotel/search_hotel.eventbus.dart';
import 'package:mobile/modules/search_hotel/widgets/search/filter_options_sheet.widget.dart';

class SearchHotelController extends GetxController {
  final HostRepository hostRepository;
  final HomeController homeController;
  final FavoriteLookupController favoriteLookupController;

  SearchHotelController({
    required this.hostRepository,
    required this.homeController,
    required this.favoriteLookupController,
  });

  RxBool showSearchBox = false.obs;
  Rx<HandleStatus> getDataStatus = (HandleStatus.NORMAL).obs;

  RxList<HostModel> searchedHosts = <HostModel>[].obs;

  StreamSubscription? _searchEventBusSubscription;
  StreamSubscription? _favoriteEventBusSubscription;

  final GlobalKey<FilterOptionsSheetState> filterOptionKey =
      GlobalKey<FilterOptionsSheetState>();

  @override
  void onInit() async {
    await _getData();
    _openEventBus();
    super.onInit();
  }

  @override
  void onClose() async {
    await _closeEventBus();
  }

  void _openEventBus() {
    _searchEventBusSubscription =
        EventBusUtil.listenEvent<SearchHotelInternalEvent>((event) async {
      final String action = event.action;

      switch (action) {
        case SearchHotelInternalEventEnum.refreshData:
          onTapSearchBox();
          await _getData();
          break;
      }
    });

    _favoriteEventBusSubscription =
        EventBusUtil.listenEvent<FavoriteHostInternalEvent>((event) {
      final String action = event.action;

      switch (action) {
        case FavoriteInternalEventEnum.addFavoriteHost:
          searchedHosts
              .firstWhereOrNull((element) => element.id == event.data)
              ?.isFavorite = true;

          update([event.data]);
          break;
        case FavoriteInternalEventEnum.deleteFavoriteHost:
          searchedHosts
              .firstWhereOrNull((element) => element.id == event.data)
              ?.isFavorite = false;

          update([event.data]);
          break;
      }
    });
  }

  Future<void> _closeEventBus() async {
    _searchEventBusSubscription?.cancel();
    _favoriteEventBusSubscription?.cancel();
  }

  Future<void> _getData() async {
    try {
      getDataStatus.value = HandleStatus.LOADING;

      searchedHosts.value = await hostRepository
          .searchHosts(homeController.searchHotelsParams.value);

      for (var favoriteHost in favoriteLookupController.favoriteHosts) {
        HostModel? hostModel = searchedHosts
            .firstWhereOrNull((element) => element.id == favoriteHost.hostId);
        if (hostModel != null) {
          hostModel.isFavorite = true;
        }
      }
      getDataStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      log('Error in _getData from $runtimeType: $err');
      getDataStatus.value = HandleStatus.HAS_ERROR;
    }
  }

  void onTapSearchBox() {
    showSearchBox.toggle();
  }

  Future<void> submitFilter() async {
    homeController.searchHotelsParams.value =
        homeController.searchHotelsParams.value.copyWith(
      ratingStar: filterOptionKey.currentState!.selectedStar == -1
          ? null
          : filterOptionKey.currentState!.selectedStar,
      utilities: filterOptionKey.currentState!.selectedUtilities,
    );

    await _getData();
  }

  // Future<void> addFavoriteHost(int searchIndex) async {
  //   final bool isAdded = await favoriteLookupController
  //       .addFavoriteHost(searchedHosts[searchIndex]);

  //   if (isAdded) {
  //     searchedHosts[searchIndex].isFavorite = true;
  //     searchedHosts.refresh();
  //   }
  // }

  // Future<void> deleteFavoriteHost(int searchIndex) async {
  //   final bool isDeleted = await favoriteLookupController
  //       .deleteFavoriteHost(searchedHosts[searchIndex].id);

  //   if (isDeleted) {
  //     searchedHosts[searchIndex].isFavorite = false;
  //     searchedHosts.refresh();
  //   }
  // }
}
