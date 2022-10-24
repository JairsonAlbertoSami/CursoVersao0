import 'package:flutter/material.dart';

class Teclado extends StatelessWidget {
  Function() tecla;
  String texto;

  Teclado(this.tecla, this.texto);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: tecla,
            child: Text(texto),
          ),
        ),
      ),
    );
  }
}
