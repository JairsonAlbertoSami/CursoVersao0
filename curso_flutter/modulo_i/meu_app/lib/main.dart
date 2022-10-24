import 'package:flutter/material.dart';
import 'package:meu_app/perguntas.dart';
import 'package:meu_app/resultado.dart';

void main(List<String> args) => runApp(Aplicativo());

class Aplicativo extends StatefulWidget {
  const Aplicativo({super.key});

  @override
  State<Aplicativo> createState() => _AplicativoState();
}

class _AplicativoState extends State<Aplicativo> {
  var incremetar = 0;
  var pontuacaoTotal = 0;

  var lista = const [
    {
      "texto1": "você é de país?",
      "resposta": [
        {"texto": "Guine", "nota": 10},
        {"texto": "Angola", "nota": 4},
        {"texto": "Moçambique", "nota": 1},
        {"texto": "Brasil", "nota": 5},
      ]
    },
    {
      "texto1": "Qual é a sua cor favorita?",
      "resposta": [
        {"texto": "rosa", "nota": 10},
        {"texto": "branco", "nota": 4},
        {"texto": "majenta", "nota": 1},
        {"texto": "vermelho", "nota": 5},
      ],
    },
    {
      "texto1": "Qal é o seu número de sorte?",
      "resposta": [
        {"texto": "1", "nota": 10},
        {"texto": "2", "nota": 10},
        {"texto": "9", "nota": 10},
        {"texto": "10", "nota": 10},
      ]
    },
  ];

  String mostrarRelutado() {
    return "$pontuacaoTotal";
  }

  bool get limitadador {
    return incremetar < lista.length;
  }

  void reiniciarQueteonarios() {
    setState(() {
      incremetar = 0;
      pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    void indexar(int potuacao) {
      setState(() {
        if (incremetar < lista.length) {
          incremetar++;
          pontuacaoTotal += potuacao;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 222, 222, 231),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 202, 20, 163),
          // ignore: prefer_const_constructors
          title: Center(
            // ignore: prefer_const_constructors
            child: Text(
              "App_Questionários",
              selectionColor: Colors.amber,
              // ignore: prefer_const_constructors
              style: TextStyle(
                backgroundColor: Colors.black,
              ),
            ),
          ),
        ),
        body: limitadador
            ? Perguntas(incremetar: incremetar, indexar: indexar, lista: lista)
            : Resultado(pontuacaoTotal, reiniciarQueteonarios, mostrarRelutado),
      ),
    );
  }
}
