import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

///import 'package:audioplayers/audioplayers.dart';

main() {
  runApp(Piano());
}

class Piano extends StatefulWidget {
  @override
  State<Piano> createState() => _PianoState();s
}

class _PianoState extends State<Piano> {
  Teclado(int numero, Color cor) {
    return Expanded(
      child: Container(
        color: cor,
        child: TextButton(
          onPressed: () {
            setState(() {
              final player = AudioPlayer();
              player.play(AssetSource("assets_nota$numero.wav"));
            });
          },
          child: Text(""),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Piano"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Teclado(1, Colors.black),
          Teclado(2, Color.fromARGB(255, 175, 8, 8)),
          Teclado(3, Color.fromARGB(255, 62, 14, 175)),
          Teclado(5, Colors.black),
          Teclado(6, Color.fromARGB(255, 173, 170, 201)),
        ]),
      ),
    );
  }
}
