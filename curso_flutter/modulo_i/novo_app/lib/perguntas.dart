import 'package:flutter/material.dart';
import 'package:novo_app/teclado.dart';

class Pergutas extends StatelessWidget {
  List lista;
  Function(int) incrementar;
  int indice;

  Pergutas(
      {required this.incrementar, required this.indice, required this.lista});
  bool get controladores {
    return indice < lista.length;
  }

  @override
  Widget build(BuildContext context) {
    var listaPergutas = controladores ? lista[indice].cast()["resposta"] : [];
    return Column(
      children: [
        Text(lista[indice]["texto"] as String),
        ...listaPergutas
            .map(
              (resp) => Teclado(
                () => incrementar(
                  int.parse(resp["nota"].toString()),
                ),
                resp["texto"].toString(),
              ),
            )
            .toList()
      ],
    );
  }
}
