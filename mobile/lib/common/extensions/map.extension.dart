extension MapExtension on Map {
  Map get removeNullProperty => this
    ..removeWhere(
      (dynamic key, dynamic value) =>
          value == null || (value is String && value == ''),
    );
}
