import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';
import './transaction_list.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //this commit will be required for future help
        // NewTransaction(_addNewTransaction),
        // TransactionList(_userTransaction),
      ],
    );
  }
}
