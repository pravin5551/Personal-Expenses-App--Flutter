import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import 'package:personal_expenses/widgets/user_transaction.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.orange,
        secondaryHeaderColor: Colors.red,
        buttonColor:Colors.orange ,
        accentColor: Colors.orange,
        backgroundColor: Colors.orange,
        fontFamily: 'OpenSans',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transaction = [];

  // final titleContrillery = TextEditingController();
  // final amountController = TextEditingController();

  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.69,
    //   dateTime: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'New Book',
    //   amount: 85,
    //   dateTime: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransaction {
    return _userTransaction.where(
      (element) => element.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      ),
    ).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: chosenDate);

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransaction.removeWhere((ts){
        return ts.id == id;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(_userTransaction, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}

//
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         title: Text(widget.title),
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           Container(
//             height: 100,
//             child: Text('Item 1'),
//             color: Colors.red,
//           ),
//           Flexible(
//             fit: FlexFit.tight,
//             flex: 2,
//             // fit: FlexFit.tight,
//             child: Container(
//               height: 100,
//
//               child: Text('Item 2'),
//               color: Colors.blue,
//             ),
//           ),
//           Flexible(
//             flex: 2,
//             fit: FlexFit.tight,
//             child: Container(
//               height: 100,
//               child: Text('Item 3'),
//               color: Colors.orange,
//             ),
//           ),
//         ],
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
