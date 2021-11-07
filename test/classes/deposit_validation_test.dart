import 'package:flutter_test/flutter_test.dart';

import 'package:tests_in_flutter/classes/deposit_validation.dart';
import 'package:tests_in_flutter/error/failure.dart';
import 'package:tests_in_flutter/models/operation.dart';
import 'package:tests_in_flutter/models/operation_result.dart';

void main() {
  test('Test validation with value zero', () {
    final depositValidation = DepositValidation();
    expect(
      () => depositValidation.validate(
        balance: 0.0,
        value: 0.0,
      ),
      throwsA(
        isA<Failure>(),
      ),
    );
  });

  test('Test validation with value is Negative', () {
    final depositValidation = DepositValidation();
    expect(
      () => depositValidation.validate(
        balance: 0.0,
        value: -100.0,
      ),
      throwsA(
        isA<Failure>(),
      ),
    );
  });

  test('Test when result is ok', () {
    final depositValidation = DepositValidation();
    OperationResult response = depositValidation.validate(
      balance: 0.0,
      value: 100.0,
    );
    expect(response.result, 100);
    expect(response.history.type, OperationType.deposit);
    expect(response.message, 'Depósito realizado com sucesso');
  });
}
