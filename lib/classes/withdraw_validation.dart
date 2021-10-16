import 'package:unitary_tests/models/history.dart';
import 'package:unitary_tests/models/operation.dart';
import '../error/failure.dart';
import '../models/operation_result.dart';

// Validate the withdrawal operation

class WithdrawValidation {
  OperationResult validate({required double balance, required double value}) {
    if (value == 0.0 || value < 0.0) {
      throw Failure(message: 'Não é posssível sacar esse valor.');
    }

    if (value > balance) {
      throw Failure(message: 'Saldo insuficiente.');
    }

    return OperationResult(
      message: 'Saque realizado com sucesso',
      result: balance - value,
      history: History(
        type: OperationType.withdraw,
        dateTime: DateTime.now(),
        value: value,
      ),
    );
  }
}
