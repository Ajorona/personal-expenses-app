import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  static final titleController = TextEditingController();
  static final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);

  void submitTransaction(BuildContext context) {
    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0) {
      return;
    }

    addNewTransaction(
      inputTitle,
      inputAmount,
    );

    // dismiss the BottomSheet modal
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => submitTransaction(context),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitTransaction(context),
          ),
          FlatButton(
            onPressed: () => submitTransaction(context),
            child: Text('Add Transaction'),
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
