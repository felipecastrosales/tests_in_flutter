import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unitary_tests/pages/home_page.dart';
import 'package:unitary_tests/pages/operation_page.dart';

void main() {
  testWidgets('Test initial state', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
    await tester.pump();

    expect(find.text('Saldo disponível'), findsOneWidget);
    expect(
      find.byKey(
        const Key('BalanceKey'),
      ),
      findsOneWidget,
    );
    expect(find.text('Depositar'), findsOneWidget);
    expect(find.text('Sacar'), findsOneWidget);
    expect(find.text('Nenhuma operação recente.'), findsOneWidget);
  });

  testWidgets('Test deposit action', (tester) async {
    // render widget
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
    await tester.pump();

    // found the deposit button
    final depositButton = find.text('Depositar');
    // tap action
    await tester.tap(depositButton);
    await tester.pumpAndSettle();
    // showed bottomSheet
    expect(find.byType(OperationPage), findsOneWidget);
    // sound text box
    final operationValue = find.byKey(
      const Key('OperationValueKey'),
    );
    // typed 100
    await tester.enterText(operationValue, '100');
    // waited animation
    await tester.pumpAndSettle();
    final operationContinue = find.byKey(
      const Key('OperationContinue'),
    );
    // clicked on 'Continue'
    await tester.tap(operationContinue);
    // waited animation
    await tester.pumpAndSettle();
    // success confirm with snackBar
    expect(find.text('Depósito realizado com sucesso'), findsOneWidget);
  });
}
