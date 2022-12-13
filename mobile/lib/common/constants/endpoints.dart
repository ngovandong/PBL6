import 'package:mobile/flavors.dart';

abstract class Endpoints {
  // Auth
  static final String auth = '${AppFlavor.apiUrl}/customer/auth';
  static final String authWithGoogle = '$auth/login-with-google';
  static final String authWithEmail = '$auth/login-with-email';

  // User
  static final String user = '${AppFlavor.apiUrl}/customer/user';
  static final String changeUserInfo =
      '${AppFlavor.apiUrl}/customer/user/change-user-info';

  // Favorite host
  static final String favoriteHost =
      '${AppFlavor.apiUrl}/customer/favorite-host';

  // Search
  static final String locationSuggestions =
      '${AppFlavor.apiUrl}/customer/search/suggest-location-search';
  static final String searchHosts =
      '${AppFlavor.apiUrl}/customer/search/host-search';

  // Host detail
  static final String hostDetail =
      '${AppFlavor.apiUrl}/customer/search/host-search/detail';

  // Booking
  static final String createBooking =
      '${AppFlavor.apiUrl}/customer/booking/create-booking';
  static final String getCurrentBooking =
      '${AppFlavor.apiUrl}/customer/booking/current-booking';
  static final String getCompletedBooking =
      '${AppFlavor.apiUrl}/customer/booking/history-booking';
  static final String getCancelBooking =
      '${AppFlavor.apiUrl}/customer/booking/cancel-booking';
}
