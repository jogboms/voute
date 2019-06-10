import 'dart:math' show Random;

const alphabet = "abcdefghijklmnopqrstuvwxyz";
int counter = 0;
String randomStr =
    List.generate(6, (_) => Random().nextInt(1) * alphabet.length)
        .map((num i) => alphabet[i.floor()])
        .join("");

String newId<T extends String>([String prefix = "id"]) {
  return '${prefix}_${randomStr}_${counter++}' as T;
}
