import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/utils/bottom_sheet.util.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/common/widgets/app_date_picker.widget.dart';
import 'package:mobile/common/widgets/pick_number_tenant_room.widget.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/favorite_host/favorite_host.enum.dart';
import 'package:mobile/modules/favorite_host/favorite_host.eventbus.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/data/models/dtos/search_hotels.dto.dart';
import 'package:mobile/modules/search_hotel/data/models/dtos/host_detail.dto.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';
import 'package:mobile/modules/search_hotel/data/repositories/host.repository.dart';

class HotelDetailController extends GetxController {
  final HostRepository hostRepository;
  final HomeController homeController;
  final FavoriteLookupController favoriteLookupController;

  HotelDetailController({
    required this.hostRepository,
    required this.homeController,
    required this.favoriteLookupController,
  });

  Rx<HandleStatus> getDataStatus = (HandleStatus.NORMAL).obs;

  late Rx<HostDetailDTO> hostDetailParams;

  late Rx<HostModel> _host;
  HostModel get host => _host.value;

  StreamSubscription? _favoriteEventBusSubscription;

  @override
  void onInit() async {
    await _getData();
    _openEventBus();
    super.onInit();
  }

  @override
  void onClose() {
    _closeEventBus();
    super.onClose();
  }

  void _openEventBus() {
    _favoriteEventBusSubscription =
        EventBusUtil.listenEvent<FavoriteHostInternalEvent>((event) {
      final String action = event.action;

      switch (action) {
        case FavoriteInternalEventEnum.addFavoriteHost:
          _host.value.isFavorite = true;

          update([event.data]);
          break;
        case FavoriteInternalEventEnum.deleteFavoriteHost:
          _host.value.isFavorite = false;

          update([event.data]);
          break;
      }
    });
  }

  Future<void> _closeEventBus() async {
    _favoriteEventBusSubscription?.cancel();
  }

  void _initParams() {
    final SearchHotelsDTO searchHotelsDTO =
        homeController.searchHotelsParams.value;

    hostDetailParams = HostDetailDTO(
      id: Get.arguments,
      dateCheckin: searchHotelsDTO.checkinDate,
      dateCheckout: searchHotelsDTO.checkoutDate,
      quantiyPerson: searchHotelsDTO.quantityPerson,
    ).obs;
  }

  Future<void> _getData({bool isInit = true}) async {
    try {
      getDataStatus.value = HandleStatus.LOADING;
      if (isInit) {
        _initParams();
        _host =
            (await hostRepository.getHostDetail(hostDetailParams.value)).obs;

        _host.value.isFavorite = favoriteLookupController.favoriteHosts
            .where((p0) => p0.hostId == _host.value.id)
            .isNotEmpty;
      } else {
        _host.value =
            await hostRepository.getHostDetail(hostDetailParams.value);
      }

      getDataStatus.value = HandleStatus.HAS_DATA;
    } catch (err, stack) {
      log('Error in _getData from $runtimeType: $stack');
      getDataStatus.value = HandleStatus.HAS_ERROR;
    }
  }

  Future<void> _setBookingDate(
    DateTime checkinDate,
    DateTime checkoutDate,
  ) async {
    hostDetailParams.value.dateCheckin = checkinDate;
    hostDetailParams.value.dateCheckout = checkoutDate;

    await _getData(isInit: false);
  }

  Future<void> showSelectDate() async {
    await BottomSheetUtil.show(
      child: AppDatePicker(
        initStartDate: hostDetailParams.value.dateCheckin,
        initEndDate: hostDetailParams.value.dateCheckout,
        onSubmitRange: _setBookingDate,
      ),
    );
  }

  Future<void> _setTenantAndRoom({
    required int numberOfRooms,
    required int numberOfTenants,
  }) async {
    hostDetailParams.value.quantiyPerson = numberOfTenants;

    await _getData(isInit: false);
  }

  Future<void> showSelectTenantRoom() async {
    await BottomSheetUtil.show(
      child: PickNumberTenantAndRoom(
        onChangeTenantAndRoom: _setTenantAndRoom,
        initTenant: hostDetailParams.value.quantiyPerson,
      ),
    );
  }
}
