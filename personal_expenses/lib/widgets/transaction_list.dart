import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function dateTx;

  TransactionList(this._userTransaction, this.dateTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: _userTransaction.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text('No transaction added yet..!'),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/image/waiting.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )
          : ListView(
              children: _userTransaction
                  .map(
                    (tx) => Card(
                      color: Colors.white,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.green,
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: ListTile(
                          title: Text(tx.title,
                              style: TextStyle(fontFamily: 'OpenSans')),
                          leading: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.attach_money,
                            ),
                          ),
                          // trailing: Text(
                          //   'Amount : \$${tx.amount.toString()}',
                          //   style: TextStyle(color: Colors.black, fontSize: 15),
                          // ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: (){
                              dateTx(tx.id);
                            },
                          ),

                          subtitle: Text(
                            DateFormat.yMMMd().format(tx.dateTime),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
