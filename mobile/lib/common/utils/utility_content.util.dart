import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

abstract class UtilityCode {
  static const String wifi = 'wifi';
  static const String restaurant = 'restaurant';
  static const String bar = 'bar';
  static const String roomService = 'room_service';
  static const String reception24h = 'reception24h';
  static const String sauna = 'sauna';
  static const String gym = 'gym';
  static const String garden = 'garden';
  static const String terrace = 'terrace';
  static const String nonSmokingRoom = 'non_smoking_room';
  static const String airportShuttle = 'airport_shuttle';
  static const String familyRoom = 'family_room';
  static const String spa = 'spa';
  static const String jacuzzi = 'jacuzzi';
  static const String ac = 'ac';
  static const String swimmingPool = 'swimming_pool';
  static const String beach = 'beach';
}

abstract class UtilityContentUtil {
  static IconData getIcon(String code) {
    switch (code) {
      case UtilityCode.wifi:
        return PhosphorIcons.wifi_high;
      case UtilityCode.restaurant:
        return PhosphorIcons.fork_knife;
      case UtilityCode.bar:
        return PhosphorIcons.martini;
      case UtilityCode.roomService:
        return Icons.room_service_outlined;
      case UtilityCode.reception24h:
        return Icons.bedtime_outlined;
      case UtilityCode.sauna:
        return Icons.hot_tub_outlined;
      case UtilityCode.gym:
        return PhosphorIcons.barbell;
      case UtilityCode.garden:
        return Icons.yard_outlined;
      case UtilityCode.terrace:
        return Icons.balcony_outlined;
      case UtilityCode.nonSmokingRoom:
        return Icons.smoke_free_outlined;
      case UtilityCode.airportShuttle:
        return Icons.airport_shuttle_outlined;
      case UtilityCode.familyRoom:
        return Icons.family_restroom_outlined;
      case UtilityCode.spa:
        return Icons.spa_outlined;
      case UtilityCode.jacuzzi:
        return PhosphorIcons.bathtub;
      case UtilityCode.ac:
        return Icons.ac_unit_outlined;
      case UtilityCode.swimmingPool:
        return Icons.pool_outlined;
      default:
        return Icons.beach_access_outlined;
    }
  }

  static String getLabel(String code) {
    switch (code) {
      case UtilityCode.wifi:
        return 'Wi-Fi miễn phí';
      case UtilityCode.restaurant:
        return 'Nhà hàng';
      case UtilityCode.bar:
        return 'Quầy bar';
      case UtilityCode.roomService:
        return 'Dịch vụ phòng';
      case UtilityCode.reception24h:
        return 'Lễ tân 24 giờ';
      case UtilityCode.sauna:
        return 'Phòng xông hơi';
      case UtilityCode.gym:
        return 'Trung tâm thể dục';
      case UtilityCode.garden:
        return 'Sân vườn';
      case UtilityCode.terrace:
        return 'Sân thượng/hiên';
      case UtilityCode.nonSmokingRoom:
        return 'Phòng không hút thuốc';
      case UtilityCode.airportShuttle:
        return 'Xe đưa đón sân bay';
      case UtilityCode.familyRoom:
        return 'Phòng gia đình';
      case UtilityCode.spa:
        return 'Trung tâm Spa & chăm sóc sức khoẻ';
      case UtilityCode.jacuzzi:
        return 'Bồn tắm nóng';
      case UtilityCode.ac:
        return 'Điều hoà nhiệt độ';
      case UtilityCode.swimmingPool:
        return 'Hồ bơi';
      default:
        return 'Bãi biển';
    }
  }
}

// export const AMENITIES = [
//   { label: "Wi-Fi miễn phí", code: "wifi" },
//   { label: "Nhà hàng", code: "restaurant" },
//   { label: "Quầy bar", code: "bar" },
//   { label: "Dịch vụ phòng", code: "room_service" },
//   { label: "Lễ tân 24 giờ", code: "reception24h" },
//   { label: "Phòng xông hơi", code: "sauna" },
//   { label: "Trung tâm thể dục", code: "gym" },
//   { label: "Sân vườn", code: "garden" },
//   { label: "Sân thượng/ hiên", code: "terrace" },
//   { label: "Phòng không hút thuốc", code: "non_smoking_room" },
//   { label: "Xe đưa đón sân bay", code: "airport_shuttle" },
//   { label: "Phòng gia đình", code: "family_room" },
//   { label: "Trung tâm Spa & chăm sóc sức khoe", code: "spa" },
//   { label: "Bồn tắm nóng/bể sục (jacuzzi)", code: "jacuzzi" },
//   { label: "Điều hòa nhiệt độ", code: "ac" },
//   { label: "Hồ bơi", code: "swimming_pool" },
//   { label: "Bãi biển", code: "beach" },
// ];

// export const BED_TYPE = [
//   { label: "1 giường đơn", code: "1s" },
//   { label: "1 
