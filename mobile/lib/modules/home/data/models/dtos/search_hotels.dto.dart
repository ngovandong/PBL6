class SearchHotelsDTO {
  DateTime checkinDate;
  DateTime checkoutDate;
  int numberOfTenants;
  int numberOfRooms;

  SearchHotelsDTO({
    required this.checkinDate,
    required this.checkoutDate,
    required this.numberOfTenants,
    required this.numberOfRooms,
  });
}
