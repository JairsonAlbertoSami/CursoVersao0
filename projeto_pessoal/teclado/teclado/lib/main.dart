// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    String funcaoNumero(tecldos) {
      return "${tecldos}";
    }

    tecldos(String texto, Function(int) pressionarNumeros) {
      return Expanded(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () => pressionarNumeros(int.parse(texto)),
                    child: Text(
                      texto,
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 190, 179, 179),
        appBar: AppBar(
          title: const Text("Telefone"),
        ),
        body: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 26, 57, 194),
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 9),
              child: Row(
                children: [
                  Text(
                    "funcaoNumero(tecldos)",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    tecldos("1", (voi) => funcaoNumero),
                    tecldos("2", (int) => funcaoNumero),
                    tecldos("3", (int) => funcaoNumero),
                  ],
                ),
                Row(
                  children: [
                    tecldos("4", (int) => funcaoNumero),
                    tecldos("5", (int) => funcaoNumero),
                    tecldos("6", (int) => funcaoNumero),
                  ],
                ),
                Row(
                  children: [
                    tecldos("7", (int) => funcaoNumero),
                    tecldos("8", (int) => funcaoNumero),
                    tecldos("9", (int) => funcaoNumero),
                  ],
                ),
                Row(
                  children: [
                    tecldos("*", (int) => funcaoNumero),
                    tecldos("0", (int) => funcaoNumero),
                    tecldos("#", (int) => funcaoNumero),
                  ],
                )
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.call,
                    size: 50,
                    color: Colors.blue,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
