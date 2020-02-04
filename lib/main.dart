import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import './constants/transaction.dart';

import './utils/Intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Card'),
                elevation: 5,
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Title')),
                  TextField(decoration: InputDecoration(labelText: 'Amount')),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Add Transaction'),
                    textColor: Colors.black,
                  )
                ],
              ),
            ),
            Column(
              children: transactions.map((transaction) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      width: 120,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        'R\$ ${transaction.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(transaction.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          formatDate(transaction.createdAt),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
