import 'package:flutter/material.dart';

import 'package:unitary_tests/models/user.dart';
import 'history_item_widget.dart';

class HistoryListWidget extends StatelessWidget {
  const HistoryListWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          user.history.isNotEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Histórico',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              : Container(),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          Expanded(
            child: user.history.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(height: 1);
                    },
                    itemCount: user.history.length,
                    itemBuilder: (_, index) {
                      return HistoryItemWidget(
                        history: user.history[index],
                        index: index,
                      );
                    },
                  )
                : const Text(
                    'Nenhuma operação recente.',
                    key: Key('HistoryEmpty'),
                  ),
          ),
        ],
      ),
    );
  }
}
