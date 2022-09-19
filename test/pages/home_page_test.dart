import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tests_in_flutter/pages/pages.dart';

void main() {
  testWidgets('Test initial state', (tester) async {
    await _createWidget(
      tester: tester,
      widget: const HomePage(),
    );

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
    await _createWidget(
      tester: tester,
      widget: const HomePage(),
    );

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

// widget renderized in test with pump
Future<void> _createWidget({
  required WidgetTester tester,
  required Widget widget,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: widget,
    ),
  );
  await tester.pump();
}
