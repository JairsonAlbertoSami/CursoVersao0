import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionForme extends StatefulWidget {
  Function(String, double, DateTime) onSubmit;

  TransactionForme({
    required this.onSubmit,
  });

  @override
  State<TransactionForme> createState() => _TransactionFormeState();
}

class _TransactionFormeState extends State<TransactionForme> {
  final _titlecontroller = TextEditingController();
  final _valueControoler = TextEditingController();
  DateTime _selecionDate = DateTime.now();

  _submiteForme() {
    final title = _titlecontroller.text;
    final value = double.tryParse(_valueControoler.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selecionDate == null) {
      return;
    }
    widget.onSubmit(title.toLowerCase(), value, _selecionDate!);
  }

//showDatePicker  funcao que seleciona as datas mostrando calendario
  // função then() retorna o futuro oe seja seleciona a entrada
  _showdatepiker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      // ignore: non_constant_identifier_names
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selecionDate == pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            keyboardType: TextInputType.name,
            onSubmitted: (_) => _submiteForme(),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText: "Titulo",
            ),
          ),
          TextField(
            controller: _valueControoler,
            // ignore: prefer_const_constructors
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submiteForme(),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText: "Valor em R\$:",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  _selecionDate == null
                      ? 'Nenhuma data selecionada!'
                      : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selecionDate!)}',
                ),
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 7, 102),
                  ),
                ),
                onPressed: _showdatepiker,
                child: const Text("Selecionar data",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: _submiteForme,
                // ignore: prefer_const_constructors
                child: Text(
                  "adicionar trasações",
                  style: TextStyle(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
