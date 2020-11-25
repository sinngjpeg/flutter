import 'package:flutter/material.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(home: ListaDeTransferencia()));
  }
}

///////// FORMULARIO DE TRANSFERENCIA
class FormularioDeTransferencia extends StatelessWidget {

  final TextEditingController controladorDoCampoConta = TextEditingController();
  final TextEditingController controladorDoCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferencia'),
      ),
      body: Column(
        children: [
          CampoTexto(controladorDoCampoConta, 'Número da conta', '0000'),
          CampoTexto(controladorDoCampoValor, 'Valor', '0.00', icone: Icons.monetization_on),

          RaisedButton(
            onPressed: () => criaTransferencia(),
              child: Text('Adicionar'),
          )
        ],
      ),
    );
  } //Build

  void criaTransferencia(BuildContext context){
    debugPrint('Clicou em ADICIONAR');

    int conta = int.tryParse(controladorDoCampoConta.text);
    double valor = double.tryParse(controladorDoCampoValor.text);

    if (conta != null && valor != null) {
    final transferenciaCriada = Transferencia(conta, valor);
    debugPrint('Transferencia Criada: $transferenciaCriada');
    Navigator.pop(context, transferenciaCriada);
    }
  }
}


class CampoTexto extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  CampoTexto(this.controlador, this.rotulo, this.dica, {this.icone});


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontSize: 24.8),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica
        ),
      ),
    );
  }
}
class ItemDeTransferencia extends StatelessWidget {
  Transferencia transferencia;

  ItemDeTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.conta.toString()),
      ),
    );
  }
}

class ListaDeTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Esqueci'),
      ),
      body: Column(
      children: [
        ItemDeTransferencia(Transferencia(456 - 9, 1500.0)),
        ItemDeTransferencia(Transferencia(3545 - 0, 2500.0)),
        ItemDeTransferencia(Transferencia(7852 - 0, 1200.0)),

      ],
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
         final Future<Transferencia> future  = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioDeTransferencia();
        }));
         future.then((transferenciaRecebida) {
           debugPrint('chegou no then do future');
           debugPrint('$transferenciaRecebida');
         });
      },
      ),
    );
  }
}

class Transferencia {
  int conta;
  double valor;
  Transferencia(this.conta, this.valor);

  @override
  String toString() {
    return 'Transferencia{conta: $conta, valor: $valor}';
  }
}
