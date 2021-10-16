import 'history.dart';

// Class that results in the operation, the message and the story

class OperationResult {
  OperationResult({
    required this.message,
    required this.result,
    required this.history,
  });

  final String message;
  final double result;
  final History history;
}
