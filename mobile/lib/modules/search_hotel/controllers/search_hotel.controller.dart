import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';
import 'package:mobile/modules/search_hotel/data/repositories/host.repository.dart';
import 'package:mobile/modules/search_hotel/search_hotel.enum.dart';
import 'package:mobile/modules/search_hotel/search_hotel.eventbus.dart';

class SearchHotelController extends GetxController {
  final HostRepository hostRepository;
  final HomeController homeController;

  SearchHotelController({
    required this.hostRepository,
    required this.homeController,
  });

  RxBool showSearchBox = false.obs;
  Rx<HandleStatus> getDataStatus = (HandleStatus.NORMAL).obs;

  List<HostModel> searchedHosts = [];

  StreamSubscription? _eventBusSubscription;

  @override
  void onInit() async {
    await _getData();
    _initEventBus();
    super.onInit();
  }

  @override
  void onClose() async {
    await _closeEventBus();
  }

  void _initEventBus() {
    _eventBusSubscription =
        EventBusUtil.listenEvent<SearchHotelInternalEvent>((event) async {
      final String action = event.action;

      switch (action) {
        case SearchHotelInternalEventEnum.refreshData:
          onTapSearchBox();
          await _getData();
          break;
      }
    });
  }

  Future<void> _closeEventBus() async {
    _eventBusSubscription?.cancel();
  }

  Future<void> _getData() async {
    try {
      getDataStatus.value = HandleStatus.LOADING;
      searchedHosts = await hostRepository
          .searchHosts(homeController.searchHotelsParams.value);

      getDataStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      log('Error in _getData from $runtimeType: $err');
      getDataStatus.value = HandleStatus.HAS_ERROR;
    }
  }

  void onTapSearchBox() {
    showSearchBox.toggle();
  }

  void onTapFilter() {
    Get.bottomSheet(
      Container(),
    );
  }
}
