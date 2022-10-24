import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';

main() {
  runApp(Calculadora());
}

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    Widget textoUnidades(String unidade) {
      return Container(
        width: 40,
        height: 20,
        child: Text(
          unidade,
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 13,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget espacamentoPadrao() {
      return SizedBox(height: 10, width: 10);
    }

    textoEntradas(String testoEndadas) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 200,
            height: 20,
            child: Text(
              testoEndadas,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
          SizedBox(height: 1, width: 1),
          Container(
            margin: EdgeInsets.only(),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: 100,
            height: 30,
            child: TextField(
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 1, width: 3),
        ],
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      textoEntradas("Ponto de Monitoramento"),
                      textoEntradas("Data")
                    ],
                  )
                ],
              ),
              espacamentoPadrao(),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          textoEntradas(
                              "Altura de Onda de Arrebentamento (HB)"),
                          textoUnidades("m")
                        ],
                      ),
                      Row(
                        children: [
                          textoEntradas(
                              "Período de onda de Arrebentamento (t)"),
                          textoUnidades("um*")
                        ],
                      ),
                      Row(
                        children: [
                          textoEntradas("Diãmetro Mediano do Grau (D50)"),
                          textoUnidades("um*")
                        ],
                      ),
                      Row(
                        children: [
                          textoEntradas("Amplitude de Maré (AM)"),
                          textoUnidades("m")
                        ],
                      ),
                      espacamentoPadrao(),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  textoEntradas(
                                      "Direção de Propação de Onda (*)"),
                                  textoUnidades("graus")
                                ],
                              ),
                              Row(
                                children: [
                                  textoEntradas("Direção de face da Praia (*)"),
                                  textoUnidades("graus")
                                ],
                              ),
                              espacamentoPadrao(),
                              Row(
                                children: [
                                  textoEntradas(
                                      "Tempo de Espraiamento (Tesp*)"),
                                  textoUnidades("seg")
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
