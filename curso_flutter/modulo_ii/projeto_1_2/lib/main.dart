// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:modulo_ii/componentes/chart.dart';
import 'package:modulo_ii/componentes/transaction_forme.dart';
import 'dart:math';
import '../transaction.dart';
import './componentes/transaction_list.dart';

void main(List<String> args) {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.amber,
        ),
        fontFamily: "Roboto",
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = <Transaction>[];

  List<Transaction> get _recenteTransaction {
    return _transactions.where((tr) {
      return tr.data.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _transactionAdicionar(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      data: date,
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  deleteTransaction(String id) {
    setState(
      () {
        _transactions.removeWhere(
          (tr) {
            return tr.id == id;
          },
        );
      },
    );
  }

  _opentransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForme(onSubmit: _transactionAdicionar);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "Despesas pessoais",
        style: TextStyle(
          // Para respomder as fontes de aparelho em percentagem d letras
          height: 0.9 * MediaQuery.of(context).textScaleFactor,
        ),
      ),
      actions: [
        Container(
          child: IconButton(
            onPressed: () => _opentransactionModal(context),
            icon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
          ),
        )
      ],
    );
    final averguarAlutura = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            // ignore: prefer_const_constructors
            height: averguarAlutura * 0.30,
            child: Chart(_recenteTransaction),
          ),
          Container(
            height: averguarAlutura * 0.70,
            child: Trasaction_List(
                onDeletar: deleteTransaction, transaction: _transactions),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _opentransactionModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
