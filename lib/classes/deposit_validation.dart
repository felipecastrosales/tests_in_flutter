import 'package:tests_in_flutter/models/history.dart';
import 'package:tests_in_flutter/models/operation.dart';
import 'package:tests_in_flutter/models/operation_result.dart';
import '../error/failure.dart';

// Validate the deposit operation

class DepositValidation {
  OperationResult validate({required double balance, required double value}) {
    if (value == 0.0 || value < 0.0) {
      throw Failure(message: 'Não é posssível depositar esse valor.');
    }

    return OperationResult(
      message: 'Depósito realizado com sucesso',
      result: balance + value,
      history: History(
        type: OperationType.deposit,
        dateTime: DateTime.now(),
        value: value,
      ),
    );
  }
}
