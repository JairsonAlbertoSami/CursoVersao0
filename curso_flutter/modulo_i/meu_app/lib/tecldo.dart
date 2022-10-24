import 'package:flutter/material.dart';

class TEeclado extends StatelessWidget {
  Function() tecla;
  String nomeBotao;
  TEeclado(this.tecla, this.nomeBotao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      color: Colors.amber,
      child: ElevatedButton(
        onPressed: tecla,
        child: Text(
          nomeBotao,
        ),
      ),
    );
  }
}
