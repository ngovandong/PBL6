import 'package:hive/hive.dart';

abstract class HiveHelper {
  static Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  static Future<void> set({
    required String boxName,
    required String keyValue,
    required dynamic value,
  }) async {
    final Box box = await openBox(boxName);
    return await box.put(keyValue, value);
  }

  static Future<dynamic> get({
    required String boxName,
    required String keyValue,
  }) async {
    final Box box = await openBox(boxName);
    return box.get(keyValue);
  }

  static Future<List<dynamic>> getAll({required String boxName}) async {
    final Box box = await openBox(boxName);
    return box.values.toList();
  }
}
