import 'package:flutter_test/flutter_test.dart';

import 'package:tests_in_flutter/classes/classes.dart';
import 'package:tests_in_flutter/models/models.dart';

void main() {
  test('Validate when type is Deposity', () {
    final validationFactory = ValidationFactory(
      Operation(
        balance: 100.0,
        value: 150.0,
        type: OperationType.deposit,
      ),
    );
    final response = validationFactory.validate();
    expect(response.history.type, OperationType.deposit);
  });

  test('Validate when type is Withdraw', () {
    final validationFactory = ValidationFactory(
      Operation(
        balance: 150.0,
        value: 50.0,
        type: OperationType.withdraw,
      ),
    );
    final response = validationFactory.validate();
    expect(
      response.history.type,
      OperationType.withdraw,
    );
  });
}
