import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateTime.day == weekDay.day &&
            recentTransactions[i].dateTime.month == weekDay.month &&
            recentTransactions[i].dateTime.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': 9.99
      };
    });
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValues.map(
            (data) {
              return Flexible(

                fit: FlexFit.tight,
                child: ChartBar(
                  'T', 0.5,0.5
                  // data['day'],
                  // data['amount'],

                  // totalSpending==0.0?0.0 :(data['amount'] as double) / totalSpending,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
