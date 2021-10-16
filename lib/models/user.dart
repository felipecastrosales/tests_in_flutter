import 'history.dart';

// User Class

class User {
  User({
    required this.balance,
    this.history = const <History>[],
  });

  final double balance;
  final List<History> history;

  User update({
    double? balance,
    History? history,
  }) {
    // Get the current list
    final list = this.history;
    if (history != null) {
      // Add new operation to list
      list.add(history);
    }
    // Sorts the list from newest to oldest
    this.history.sort(
          (a, b) => b.dateTime.compareTo(a.dateTime),
        );
    // Create a new user with updated data
    return User(
      balance: balance ?? this.balance,
      history: list,
    );
  }
}
