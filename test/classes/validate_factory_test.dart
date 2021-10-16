import 'package:flutter_test/flutter_test.dart';
import 'package:unitary_tests/classes/validate_factory.dart';
import 'package:unitary_tests/models/operation.dart';

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
