// Error Handling Class

class Failure implements Exception {
  Failure({this.message = ''});
  final String message;
}
