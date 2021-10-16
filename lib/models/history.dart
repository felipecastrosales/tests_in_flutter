import 'operation.dart';

// Class that records user operations

class History {
  History({
    required this.type,
    required this.dateTime,
    required this.value,
  });

  final OperationType type;
  final DateTime dateTime;
  final double value;

  // Defines the title of the operation by its type
  String get description =>
      type == OperationType.deposit ? 'Depósito' : 'Saque';
}
