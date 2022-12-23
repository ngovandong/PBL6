import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/utils/event_bus/event_bus.util.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/favorite_host/data/model/favorite_host.model.dart';
import 'package:mobile/modules/favorite_host/data/repository/favorite_host.repository.dart';
import 'package:mobile/modules/favorite_host/favorite_host.enum.dart';
import 'package:mobile/modules/favorite_host/favorite_host.eventbus.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';

class FavoriteLookupController extends GetxController {
  final FavoriteHostRepository favoriteHostRepository;
  final VerifyAuthController verifyAuthController;

  FavoriteLookupController({
    required this.favoriteHostRepository,
    required this.verifyAuthController,
  });

  RxList<FavoriteHostModel> favoriteHosts = <FavoriteHostModel>[].obs;
  Rx<HandleStatus> getDataStatus = (HandleStatus.LOADING).obs;

  StreamSubscription? _eventBusSubscription;

  bool isProcessing = false;

  @override
  void onInit() async {
    _openEventBus();

    super.onInit();
  }

  void _openEventBus() {
    _eventBusSubscription =
        EventBusUtil.listenEvent<FavoriteHostInternalEvent>((event) async {
      switch (event.action) {
        case FavoriteInternalEventEnum.refreshData:
          await getFavoriteHosts();
          break;
      }
    });
  }

  @override
  Future<void> onClose() async {
    _cancelEventBus();
    super.onClose();
  }

  Future<void> _cancelEventBus() async {
    await _eventBusSubscription?.cancel();
  }

  Future<void> getFavoriteHosts() async {
    if (verifyAuthController.currentUser == null) {
      getDataStatus.value = HandleStatus.NOT_YET_LOGIN;
      favoriteHosts.value = [];
      return;
    }

    try {
      getDataStatus.value = HandleStatus.LOADING;

      favoriteHosts.value = await favoriteHostRepository
          .getFavoriteHosts(verifyAuthController.currentUser!.id);

      getDataStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      favoriteHosts.value = [];
      getDataStatus.value = HandleStatus.HAS_ERROR;
      log('Error in getFavoriteHosts: $err');
    }
  }

  Future<void> addFavoriteHost(HostModel host) async {
    if (isProcessing) {
      return;
    }

    isProcessing = true;
    try {
      final String favoriteId = await favoriteHostRepository.addFavoriteHost(
        userId: verifyAuthController.currentUser!.id,
        hostId: host.id,
      );

      favoriteHosts.add(host.toFavoriteHost(favoriteId));

      EventBusUtil.fireEvent(
        FavoriteHostInternalEvent(
          FavoriteInternalEventEnum.addFavoriteHost,
          host.id,
        ),
      );
    } catch (err) {
      log('Error in addFavoriteHost from $runtimeType');
      SnackbarUtil.showError();
    } finally {
      isProcessing = false;
    }
  }

  Future<void> deleteFavoriteHost(String hostId) async {
    if (isProcessing) {
      return;
    }

    isProcessing = true;
    try {
      final String favoriteId =
          favoriteHosts.firstWhere((element) => element.hostId == hostId).id;

      await favoriteHostRepository.deleteFavoriteHost(favoriteId: favoriteId);

      favoriteHosts.removeWhere((element) => element.id == favoriteId);

      EventBusUtil.fireEvent(
        FavoriteHostInternalEvent(
          FavoriteInternalEventEnum.deleteFavoriteHost,
          hostId,
        ),
      );
    } catch (err) {
      log('Error in deleteFavoriteHost from $runtimeType');
      SnackbarUtil.showError();
    } finally {
      isProcessing = false;
    }
  }
}
