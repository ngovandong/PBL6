import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/utils/dialog.util.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/choose_room/pick_room_sheet.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/choose_room/pick_room_bed_sheet.widget.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';
import 'package:mobile/modules/search_hotel/data/models/host.model.dart';

class ChooseRoomController extends GetxController {
  final HotelDetailController hotelDetailController;
  final VerifyAuthController verifyAuthController;

  ChooseRoomController({
    required this.hotelDetailController,
    required this.verifyAuthController,
  });

  final HostModel host = Get.arguments;

  late RxList<AccommodationModel> rooms;
  List<AccommodationModel> get bookingRooms =>
      rooms.where((element) => element.isSelected).toList();
  // final RxList<RoomModel> bookingRooms = <RoomModel>[].obs;

  final RxDouble totalMoneny = (0.0).obs;

  @override
  void onInit() {
    _getRoomData();
    rooms.listen((p0) {
      totalMoneny.value = p0
          .map((e) => e.totalPrice * e.bookingQuantity)
          .fold(0, (previousValue, element) => previousValue + element);
    });
    super.onInit();
  }

  void _getRoomData() {
    rooms = (host.accommodationSearches.map((e) => e.copyWith()).toList()).obs;
  }

  void addRoom(String selectedRoomId) {
    final AccommodationModel currentRoom =
        rooms.firstWhere((p0) => p0.id == selectedRoomId);

    if (currentRoom.isSelected) {
      if (currentRoom.bedTypes.length == 1) {
        Get.bottomSheet(
          PickNumberRoomSheet(
            bookingQuantity: currentRoom.bookingQuantity,
            quantityAvailable: currentRoom.quantityAvailable,
            chooseRoom: (numberOfRooms) {
              if (numberOfRooms == 0) {
                refreshData(
                  currentRoom,
                  isSelected: false,
                  bookingQuantity: 0,
                  bedInfo: currentRoom.bedTypes.first,
                );
              } else {
                currentRoom.bookingQuantity = numberOfRooms;
                refreshData(
                  currentRoom,
                  bookingQuantity: numberOfRooms,
                  bedInfo: currentRoom.bedTypes.first,
                );
              }
            },
          ),
        );
      } else {
        showPickRoomAndBedSheet(currentRoom);
      }
    } else {
      if (currentRoom.bedTypes.length == 1) {
        refreshData(
          currentRoom,
          bookingQuantity: 1,
          bedInfo: currentRoom.bedTypes.first,
        );
      } else {
        showPickRoomAndBedSheet(currentRoom);
      }
    }
  }

  void showPickRoomAndBedSheet(AccommodationModel currentRoom) {
    Get.bottomSheet(
      PickRoomAndBedSheet(
        quantityAvailable: currentRoom.quantityAvailable,
        bedTypes: currentRoom.bedTypes,
        initNumberRoom:
            currentRoom.isSelected ? currentRoom.bookingQuantity : 1,
        initBedType: currentRoom.isSelected
            ? currentRoom.bedInfo
            : currentRoom.bedTypes.first,
        chooseRoom: (int numberOfRooms, String selectedBedType) {
          refreshData(
            currentRoom,
            bookingQuantity: numberOfRooms,
            isSelected: !(numberOfRooms == 0),
            bedInfo: selectedBedType,
          );
        },
      ),
    );
  }

  void refreshData(
    AccommodationModel currentRoom, {
    bool isSelected = true,
    required int bookingQuantity,
    required String bedInfo,
  }) {
    currentRoom.isSelected = isSelected;
    currentRoom.bookingQuantity = bookingQuantity;
    currentRoom.bedInfo = bedInfo;

    rooms.refresh();
    update([currentRoom.id]);
  }

  Future<void> bookingRoom() async {
    if (verifyAuthController.currentUser == null) {
      await DialogUtil.showGeneral(
        title: LocaleKeys.profile_notication.tr,
        content: LocaleKeys.hotel_detail_required_login.tr,
        isConfirmDialog: true,
        cancelButtonText: LocaleKeys.dialog_cancel.tr,
        confirmButtonText: LocaleKeys.dialog_continue.tr,
        onConfirm: () async {
          await Get.toNamed(RouteManager.auth);
        },
      );

      await Future.delayed(const Duration(milliseconds: 200));
      DialogUtil.showLoading(
        content: 'Đang cập nhập thông tin cá nhân...',
      );
      await Future.delayed(const Duration(milliseconds: 1200));
      DialogUtil.hideLoading();
    }

    Get.toNamed(RouteManager.fillProfileInfo);
  }
}
