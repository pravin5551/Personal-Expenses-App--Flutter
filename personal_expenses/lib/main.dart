import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
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
                          trailing: Text('Amount : \$${tx.amount.toString()}', style: TextStyle(color: Colors.black, fontSize: 15),),
                          subtitle: Text(tx.dateTime.toString()),
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
