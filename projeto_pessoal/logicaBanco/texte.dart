import './mani.dart';

void main(List<String> args) {
  var jairson = Banco(10, 0);
  var ussumane = Banco(10, 100);
  var bacar = Banco(10, 5000);
  bacar.depositar(10);
  var anarela = Banco();
  anarela.nome = "Anarela";
  anarela.sacar(40);
  anarela.limiteConta(300);

  bacar.sacar(200);
  bacar.tranferencia(jairson, 200);

  jairson.depositar(20);
  jairson.tranferencia(ussumane, 50);
  jairson.sacar(890);
  jairson.sacar(-10);
  jairson.depositar(-10);
  jairson.sacar(-600);
  ussumane.nome = "Ussumane";
  print(jairson.printar());
  print(ussumane.printar());
  print(bacar.printar());
  print(anarela.printar());
}
