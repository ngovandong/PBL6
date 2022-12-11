import 'package:json_annotation/json_annotation.dart';

class JsonSerializableDateTime implements JsonConverter<DateTime, String> {
  const JsonSerializableDateTime();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime date) => date.toUtc().toIso8601String();
}
