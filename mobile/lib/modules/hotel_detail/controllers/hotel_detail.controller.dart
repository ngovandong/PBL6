import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/data/models/dtos/search_hotels.dto.dart';
import 'package:mobile/modules/search_hotel/data/models/dtos/host_detail.dto.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';
import 'package:mobile/modules/search_hotel/data/repositories/host.repository.dart';

class HotelDetailController extends GetxController {
  final HostRepository hostRepository;
  final HomeController homeController;

  HotelDetailController({
    required this.hostRepository,
    required this.homeController,
  });

  Rx<HandleStatus> getDataStatus = (HandleStatus.NORMAL).obs;

  late Rx<HostDetailDTO> hostDetailParams;

  late Rx<HostModel> _host;
  HostModel get host => _host.value;

  @override
  void onInit() async {
    await _getData();
    super.onInit();
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

  Future<void> _getData() async {
    try {
      _initParams();

      getDataStatus.value = HandleStatus.LOADING;
      _host = (await hostRepository.getHostDetail(hostDetailParams.value)).obs;

      getDataStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      log('Error in _getData from $runtimeType: $err');
      getDataStatus.value = HandleStatus.HAS_ERROR;
    }
  }
}
