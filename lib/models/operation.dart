import 'package:tests_in_flutter/classes/validate_factory.dart';

import 'operation_result.dart';

// Operation Class

enum OperationType {
  deposit,
  withdraw,
}

class Operation {
  Operation({
    required this.balance,
    required this.value,
    required this.type,
  });

  final double balance;
  final double value;
  final OperationType type;

  // Validate and operate
  OperationResult doOperation() {
    return ValidationFactory(this).validate();
  }
}
