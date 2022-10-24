import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChartBar extends StatelessWidget {
  final String? labelLinhaBaixo;
  final double? value;
  final double? percentage;

  ChartBar({
    this.labelLinhaBaixo,
    this.percentage,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // FittedBox diminuir o tamanho de numero para caber linha
        Container(
            height: 20,
            child: FittedBox(child: Text("${value?.toStringAsFixed(2)}"))),
        SizedBox(height: 5),
        Container(
          height: 50,
          width: 10,
          child: Stack(
            //inverter a bara de percentagens
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(labelLinhaBaixo!),
      ],
    );
  }
}
