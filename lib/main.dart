import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './models/transaction.dart';

import './widgets/transactionList.dart';
import './widgets/newTransaction.dart';
import './utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: defaultTheme,
        fontFamily: 'SourceSansPro',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final uuid = new Uuid();
  static final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: uuid.v1(),
    //     title: 'Shoes',
    //     amount: 59.99,
    //     createdAt: DateTime.now(),
    //     updatedAt: DateTime.now()),
    // Transaction(
    //     id: uuid.v1(),
    //     title: 'Groceries',
    //     amount: 102.99,
    //     createdAt: DateTime.now(),
    //     updatedAt: DateTime.now()),
    // Transaction(
    //     id: uuid.v1(),
    //     title: 'Light Bill',
    //     amount: 1.99,
    //     createdAt: DateTime.now(),
    //     updatedAt: DateTime.now()),
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Card'),
                  elevation: 5,
                ),
              ),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
