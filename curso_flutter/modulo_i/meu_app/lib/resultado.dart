import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  Function() reiniciarResultado;
  Function() mostrarResultado;

  Resultado(this.pontuacao, this.reiniciarResultado, this.mostrarResultado,
      {super.key});

  get resutado1 {
    if (pontuacao > 0) {
      return """
Parabéns!!!
Pontuação: ${pontuacao}
"""
          .toUpperCase();
    } else if (pontuacao == 10) {
      return "numero de sorte";
    } else {
      return """
Péssimo!!!
A sua Pontuação: $pontuacao
"""
          .toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              resutado1.toUpperCase(), textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                backgroundColor: Colors.amber,
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: reiniciarResultado,
            child: Text(
              "REINICIAR??".toLowerCase(),
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
