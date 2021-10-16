import 'package:flutter/material.dart';

import 'package:unitary_tests/models/operation.dart';
import 'package:unitary_tests/models/user.dart';
import 'operation_page.dart';
import 'widgets/header_widget.dart';
import 'widgets/history_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User _user = User(balance: 0, history: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              user: _user,
              onDeposit: () => _toOperationPage(OperationType.deposit),
              onWithdraw: () => _toOperationPage(OperationType.withdraw),
            ),
            HistoryListWidget(
              user: _user
            ),
          ],
        ),
      ),
    );
  }

  // Go to the operation page according to the type of operation
  Future<void> _toOperationPage(OperationType type) async {
    final response = await showModalBottomSheet<User>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      enableDrag: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 48,
          child: OperationPage(
            operationType: type,
            user: _user,
            // Shows the successful snackbar if the operation is completed
            onSuccess: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                ),
              );
            },
            // Displays an error dialog if validation fails to 
            // perform the operation
            onError: (error) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Ops...'),
                    content: Text(error.message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Ok'),
                      )
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    );

    // If everything works out, the new data is returned
    if (response != null) {
      setState(() {
        // User receives the user with the new data and the screen is updated
        _user = response;
      });
    }
  }
}
