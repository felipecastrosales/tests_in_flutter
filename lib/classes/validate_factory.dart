import 'package:tests_in_flutter/classes/withdraw_validation.dart';
import 'package:tests_in_flutter/models/operation.dart';
import 'deposit_validation.dart';
import '../models/operation_result.dart';

// Factory created to validate according to operation

class ValidationFactory {
  ValidationFactory(this.operation);

  final Operation operation;

  OperationResult validate() {
    switch (operation.type) {
      case OperationType.deposit:
        return DepositValidation().validate(
          balance: operation.balance,
          value: operation.value,
        );
      case OperationType.withdraw:
        return WithdrawValidation().validate(
          balance: operation.balance,
          value: operation.value,
        );
    }
  }
}
