import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final entredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || entredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      entredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (lol){
                //   titleInout =lol;
                // },
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (lol){
                //   amountInput =lol;
                // },
                controller: amountController,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: () {
                  // addTx(titleController.text,
                  //     double.parse(amountController.text));
                  submitData();
                },
                child: Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 *  TextField(
    autofocus: true,
    decoration: InputDecoration(labelText: 'Title'),
    // onChanged: (lol){
    //   titleInout =lol;
    // },
    controller: titleController,
    ),
    TextField(
    decoration: InputDecoration(labelText: 'Amount'),
    // onChanged: (lol){
    //   amountInput =lol;
    // },
    controller: amountController,
    keyboardType: TextInputType.number,
    // onSubmitted: (_) => submitData,
    ),
 */
