// ignore_for_file: prefer_const_constructors

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../transaction.dart';

class Trasaction_List extends StatelessWidget {
  final List<Transaction> transaction;
  final Function(String) onDeletar;

  const Trasaction_List(
      {super.key, required this.transaction, required this.onDeletar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: transaction.isEmpty
          ? Column(
              children: [
                const SizedBox(width: 10),
                Center(
                  child: Text(
                    "Nenhuma Transação cadastrada!!",
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: Image.asset(
                    "asserts/images/lula.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                final tr = transaction[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  //ListTile  passar como nomeados
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            "R\$${tr.value}",
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "${tr.title}",
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                    ),
                    subtitle: Text(
                      DateFormat('EEE, M/d/y').format(tr.data),
                    ),
                    trailing: IconButton(
                      onPressed: () => onDeletar(tr.id),
                      icon: Icon(Icons.delete_forever, color: Colors.red),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
