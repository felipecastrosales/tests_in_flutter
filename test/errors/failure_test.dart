import 'package:flutter_test/flutter_test.dart';

import 'package:tests_in_flutter/error/failure.dart';

void main() {
  test('Test throw Exception Failure with message', () {
    void function() {
      throw Failure(message: 'Falha executada');
    }
    expect(
      function,
      throwsA(
        isA<Failure>(),
      ),
    );
  });

  test('Test throw Exception Failure without message', () {
    void function() {
      throw Failure();
    }
    expect(
      function,
      throwsA(
        isA<Failure>(),
      ),
    );
  });

  test('Test Failure message', () {
    final failure = Failure(message: 'Falha Executada');
    expect(
      failure.message,
      'Falha Executada',
    );
  });

  test('Test Failure without message', () {
    final failure = Failure();
    expect(failure.message, '');
  });
}
