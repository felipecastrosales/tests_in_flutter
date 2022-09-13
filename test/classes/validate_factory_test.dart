import 'package:flutter_test/flutter_test.dart';

import 'package:tests_in_flutter/classes/classes.dart';
import 'package:tests_in_flutter/models/models.dart';

void main() {
  test('Validate when type is Deposity', () {
    final validationFactory = ValidationFactory(
      Operation(
        balance: 100,
        type: OperationType.deposit,
        value: 150,
      ),
    );
    final response = validationFactory.validate();
    expect(response.history.type, OperationType.deposit);
  });

    test('Validate when type is Withdraw', () {
    final validationFactory = ValidationFactory(
      Operation(
        balance: 150,
        type: OperationType.withdraw,
        value: 50,
      ),
    );
    final response = validationFactory.validate();
    expect(response.history.type, OperationType.withdraw);
  });
}
