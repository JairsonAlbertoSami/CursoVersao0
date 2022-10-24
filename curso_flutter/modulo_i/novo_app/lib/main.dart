import 'package:flutter/material.dart';
import 'package:novo_app/mostraResultado.dart';
import 'package:novo_app/teclado.dart';
import './perguntas.dart';

void main(List<String> args) {
  runApp(Myplicativo());
}

class Myplicativo extends StatefulWidget {
  @override
  State<Myplicativo> createState() => _MyplicativoState();
}

class _MyplicativoState extends State<Myplicativo> {
  var lista = [
    {
      "texto": "você é de país?",
      "resposta": [
        {"texto": "Guine", "nota": 10},
        {"texto": "Angola", "nota": 10},
        {"texto": "Moçambique", "nota": 10},
        {"texto": "Brasil", "nota": 10}
      ]
    },
    {
      "texto": "Qual é a sua cor favorita?",
      "resposta": [
        {"texto": "rosa", "nota": 10},
        {"texto": "branca", "nota": 10},
        {"texto": "majenta", "nota": 10},
        {"texto": "vermelho", "nota": 1}
      ]
    },
    {
      "texto": "Qal é o seu número de sorte?",
      "resposta": [
        {"texto": "1", "nota": 10},
        {"texto": "2", "nota": 10},
        {"texto": "9", "nota": 10},
        {"texto": "10", "nota": 10},
      ]
    }
  ];

  bool get controladores {
    return indice < lista.length;
  }

  int resultado = 0;
  int indice = 0;

  incrementar(int pontuacao) {
    setState(() {
      indice++;
      resultado += pontuacao;
      ;
    });
  }

  String printar() {
    return """
    A Pontuacao $resultado""";
  }

  zerar() {
    setState(() {
      indice = 0;
      resultado = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MyAplicativo"),
        ),
        body: controladores
            ? Column(
                children: [
                  Pergutas(
                      incrementar: incrementar, indice: indice, lista: lista),
                  ElevatedButton(onPressed: zerar, child: Text("parar jogo"))
                ],
              )
            : Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Teclado(zerar, "reiniciar"),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: MostrarResutado("PARABÉNS"),
                    ),
                    Text(
                      printar(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
