class MkException implements Exception {
  MkException([this.message]);

  final String message;

  @override
  String toString() {
    if (message == null) {
      return "$runtimeType";
    }
    return "$runtimeType($message)";
  }
}
