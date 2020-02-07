import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  static final titleController = TextEditingController();
  static final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

  void submitTransaction() {
    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0) {
      return;
    }

    addNewTransaction(
      inputTitle,
      inputAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitTransaction(),
            ),
            FlatButton(
              onPressed: submitTransaction,
              child: Text('Add Transaction'),
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
