import 'package:expense/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // below uses named arguments
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expense tracker'),
          ),
          body: Column(
            children: <Widget>[
              Container(
                child: Card(
                  child: Text('Chart'),
                  elevation: 5,
                  color: Colors.blue,
                ),
                width: double.infinity,
              ),
              UserTransactions()
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
          )),
    );
  }
}
