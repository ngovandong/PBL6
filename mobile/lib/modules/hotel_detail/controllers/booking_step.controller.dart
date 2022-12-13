import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/utils/dialog.util.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/modules/auth/data/model/user.model.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/fill_profile_info.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/data/models/dtos/booking.dto.dart';
import 'package:mobile/modules/hotel_detail/data/repositories/booking.repository.dart';
import 'package:mobile/modules/search_hotel/data/models/dtos/host_detail.dto.dart';

class BookingStepController extends GetxController {
  final BookingRepository bookingRepository;
  final FillProfileInfoController fillProfileInfoController;
  final HotelDetailController hotelDetailController;
  final ChooseRoomController chooseRoomController;

  BookingStepController({
    required this.bookingRepository,
    required this.fillProfileInfoController,
    required this.hotelDetailController,
    required this.chooseRoomController,
  });

  Future<void> createBooking() async {
    try {
      DialogUtil.showLoading(content: 'Đang xử lý...');

      final HostDetailDTO hostDetailDTO =
          hotelDetailController.hostDetailParams.value;
      final UserModel userModel = fillProfileInfoController.bookingProfile;

      final BookingDTO createBookingDTO = BookingDTO(
        dateCheckin: hostDetailDTO.dateCheckin,
        dateCheckout: hostDetailDTO.dateCheckout,
        hostId: hostDetailDTO.id,
        userEmail: userModel.email,
        userFirstName: userModel.familyName ?? '',
        userLastName: userModel.givenName ?? '',
        userId: userModel.id,
        note: '',
        isPrePayment: false,
        bookingDetails: chooseRoomController.bookingRooms
            .map((e) => e.toBookingDetailDTO())
            .toList(),
      );

      final BookingDTO result =
          await bookingRepository.createBooking(createBookingDTO);

      DialogUtil.hideLoading();
      Get.offNamedUntil(
        RouteManager.confirmBooking,
        ModalRoute.withName(RouteManager.root),
        arguments: result,
      );
    } on DioError catch (dioError) {
      DialogUtil.hideLoading();

      final Map<String, dynamic>? response = dioError.response?.data;

      if (response == null) {
        SnackbarUtil.showError();
      } else {
        SnackbarUtil.showError(
          message: 'Số lượng phòng đặt không khả dụng. Vui lòng thử lại',
        );
      }
    } catch (err) {
      DialogUtil.hideLoading();
      SnackbarUtil.showError();
    }
  }
}
