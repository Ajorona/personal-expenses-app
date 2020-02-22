import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(DateTime.daysPerWeek, (index) {
      // gets the weekday using the List index as a key
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var lastTransactions = 0.00;

      recentTransactions.forEach((item) {
        if (item.createdAt.day == weekDay.day) {
          lastTransactions += item.amount;
        }
      });

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': lastTransactions
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Container();
  }
}
