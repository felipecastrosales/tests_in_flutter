import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:tests_in_flutter/models/models.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.user,
    required this.onDeposit,
    required this.onWithdraw,
  });

  final User user;
  final Function() onDeposit;
  final Function() onWithdraw;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'pt_br', symbol: 'R\$');
    final value = formatter.format(user.balance);

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Saldo disponível',
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              value,
              key: const Key('BalanceKey'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 16,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              GestureDetector(
                key: const Key('DepositButton'),
                onTap: onDeposit,
                child: Chip(
                  backgroundColor: Colors.grey[200],
                  label: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Depositar',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                key: const Key('WithdrawButton'),
                onTap: onWithdraw,
                child: Chip(
                  backgroundColor: Colors.grey[200],
                  label: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Sacar',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Divider(
          height: 1,
          color: Colors.grey[300],
        ),
        const SizedBox(
          height: 16,
          width: double.infinity,
        ),
      ],
    );
  }
}
