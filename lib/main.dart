import 'package:expense/models/transaction.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:expense/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '23fjslq',
      title: 'New shoes',
      amount: 3490,
      date: DateTime.now(),
    ),
    Transaction(
      id: '22fjslq',
      title: 'weekly groceries',
      amount: 1009,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction({String title, double amount}) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void startNewAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // below uses named arguments
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expense tracker'),
            actions: <Widget>[
              Builder(
                builder: (bCtx) => IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => startNewAddTransaction(bCtx),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Card(
                    child: Text('Chart'),
                    elevation: 5,
                    color: Colors.blue,
                  ),
                  width: double.infinity,
                ),
                UserTransactions(
                  addNewTransaction: _addNewTransaction,
                  userTransactions: _userTransactions,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(builder: (bCtx) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => startNewAddTransaction(bCtx),
            );
          })),
    );
  }
}
