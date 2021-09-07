import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  TransactionList(this._userTransaction);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: _userTransaction
            .map(
              (tx) => Card(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green,
                  ),
                  color: Colors.pinkAccent),
              child: ListTile(
                title: Text(tx.title),
                leading: CircleAvatar(
                  child: Icon(
                    Icons.attach_money,
                  ),
                ),
                trailing: Text(
                  'Amount : \$${tx.amount.toString()}',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                subtitle: Text(DateFormat.yMMMd().format(tx.dateTime)),
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}

