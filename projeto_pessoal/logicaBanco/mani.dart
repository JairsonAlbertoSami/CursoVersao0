class Banco {
  int? conta = 123;
  String? nome = "Paula";
  double _saldo;
  double _limite;

  Banco([this._limite = 10, this._saldo = 10]);

  @override
  String get nomeBnaco {
    return "0001";
  }

  limiteConta(double limite) {
    if (limite > 0 && limite <= 300) {
      _limite = limite;
    }
  }

  num moStrasaldo() {
    var mostrado = this._saldo + this._limite;
    return mostrado;
  }

  depositar(double saldo) {
    if (saldo > 0) {
      this._saldo += saldo;
    } else {
      return print("Não aceitamos depósito negativo R\$: $saldo");
    }
  }

  sacar(double valor) {
    if ((this._saldo + this._limite) >= valor &&
        (this._saldo + this._limite) > 0 &&
        valor > 0) {
      return this._saldo -= valor;
    } else if (valor < 0) {
      return print("Não aceitamos saque negativo R\$: $valor");
    } else {
      return print("impossivel de sacar R\$: $valor");
    }
  }

  void tranferencia(Banco conta, double credito) {
    if (this._saldo >= credito && credito > 0) {
      conta.depositar(credito);
      sacar(credito);
    } else {
      return print("impossivel de transferir R\$: $credito");
    }
  }

  final datas = DateTime.now();

  String printar() {
    return """
    impressso em: ${datas}

    Numrero Banco: ${nomeBnaco}
    nome:$nome
    conta:$conta
    saldo: R\$:$_saldo
    saldo: R\$:$_limite 
    saldo + limite: ${moStrasaldo()}
    """
        .toUpperCase();
  }
}
