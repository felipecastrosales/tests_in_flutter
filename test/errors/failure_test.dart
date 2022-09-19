import 'package:flutter_test/flutter_test.dart';

import 'package:tests_in_flutter/error/failure.dart';

void main() {
  group('Test throw', () {
    test('Exception Failure with message', () {
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

    test('Exception Failure without message', () {
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

    test('Failure message', () {
      final failure = Failure(message: 'Falha Executada');
      expect(
        failure.message,
        'Falha Executada',
      );
    });
  });

  test('Failure without message', () {
    final failure = Failure();
    expect(
      failure.message,
      '',
    );
  });
}
