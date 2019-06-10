import 'dart:convert';

abstract class ModelInterface {
  Model clone() => null;

  Map<String, dynamic> toMap();

  Map<String, dynamic> toJson() => toMap();

  @override
  String toString() => Model.mapToString(toMap());

  dynamic operator [](String key) => toMap()[key];
}

abstract class Model with ModelInterface {
  static DateTime parseTimestamp(String timestamp) {
    try {
      return DateTime.fromMillisecondsSinceEpoch(
        int.parse(timestamp),
      );
    } catch (e) {
      return DateTime.now();
    }
  }

  static List<T> generator<T>(dynamic items, Function(dynamic) cb) {
    return List<T>.generate(
      items != null ? items.length : 0,
      (int index) => cb(items[index]),
    );
  }

  static String mapToString(Map<String, dynamic> map) {
    return json.encode(map);
  }

  static Map<String, dynamic> stringToMap(String string) {
    if (string == null || string.isEmpty) {
      return null;
    }
    try {
      return json.decode(string);
    } catch (e) {
      return null;
    }
  }
}
