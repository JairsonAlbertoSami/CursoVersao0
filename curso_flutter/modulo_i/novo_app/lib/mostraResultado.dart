import 'package:flutter/material.dart';
import './teclado.dart';
import 'main.dart';

class MostrarResutado extends StatelessWidget {
  String texto;

  MostrarResutado(this.texto);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto.toUpperCase(),
      style: TextStyle(fontSize: 20),
    );
  }
}
