import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.69,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Book',
      amount: 85,
      dateTime: DateTime.now(),
    ),
  ];
  // String titleInout;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Card(
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
                      onPressed: () {},
                      child: Text('Add Transaction'),

                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: transaction
                .map((tx) => Card(
                      color: Colors.white,
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          subtitle:
                              Text(DateFormat.yMMMd().format(tx.dateTime)),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
