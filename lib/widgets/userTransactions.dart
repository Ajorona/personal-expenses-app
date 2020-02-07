import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/transaction.dart';
import './newTransaction.dart';
import './transactionList.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  static final uuid = new Uuid();
  static final List<Transaction> _userTransactions = [
    Transaction(
        id: uuid.v1(),
        title: 'Shoes',
        amount: 59.99,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Transaction(
        id: uuid.v1(),
        title: 'Groceries',
        amount: 102.99,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Transaction(
        id: uuid.v1(),
        title: 'Light Bill',
        amount: 1.99,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
  ];

  void _addNewTransaction(String newTitle, double newAmount) {
    final newTransaction = Transaction(
        title: newTitle,
        amount: newAmount,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: uuid.v1());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
