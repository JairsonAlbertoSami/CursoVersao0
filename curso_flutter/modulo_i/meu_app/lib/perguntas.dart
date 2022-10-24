import 'package:flutter/material.dart';
import './tecldo.dart';

class Perguntas extends StatelessWidget {
  List lista;
  int incremetar;
  Function(int) indexar;

  Perguntas({
    super.key,
    required this.incremetar,
    required this.indexar,
    required this.lista,
  });

  bool get limitadador {
    return incremetar < lista.length;
  }

  @override
  Widget build(BuildContext context) {
    var listarpergutnas =
        limitadador ? lista[incremetar].cast()["resposta"] : [];

    return Column(
      children: [
        Center(
          child: Text(lista[incremetar]["texto1"].toString()),
        ),
        Center(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ...listarpergutnas
                  .map(
                    (resp) => TEeclado(
                      () => indexar(int.parse(resp["nota"].toString())),
                      resp["texto"].toString(),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
