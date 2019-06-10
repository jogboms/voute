// Group List by group name
import 'package:voute/models/main.dart';

Map<String, List<T>> groupModelBy<T extends Model>(
  List<T> list,
  String Function(T) fn,
) {
  return list.fold(
    <String, List<T>>{},
    (rv, T x) {
      final key = fn(x);
      (rv[key] = rv[key] ?? <T>[]).add(x);
      return rv;
    },
  );
}
