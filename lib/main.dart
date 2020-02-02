import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './constants/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static final uuid = new Uuid();

  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Card'),
                elevation: 5,
              ),
            ),
            Text(
              'Hello World',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
