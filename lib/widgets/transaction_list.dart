import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList({
    this.userTransactions,
    this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userTransactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transaction yet',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, idx) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: Text('\$${userTransactions[idx].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      '${userTransactions[idx].title}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTransactions[idx].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? FlatButton.icon(
                            onPressed: () {
                              deleteTransaction(userTransactions[idx].id);
                            },
                            icon: Icon(Icons.delete),
                            label: Text(
                              'Delete',
                            ),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteTransaction(userTransactions[idx].id);
                            },
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}