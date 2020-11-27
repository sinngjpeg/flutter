import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      body: ListaTransferencia(),
      appBar: AppBar(
        title: Text('Transferencia'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    )));

/////////////////// LISTA DE TRANSFERENCIA

class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        item_tranferencia(Transferencia(1000, 1010)),
        item_tranferencia(Transferencia(2000, 1020)),
        item_tranferencia(Transferencia(3000, 1030)),
      ],
    );
  }
}

//////////////ITEM TRANSFERENCIA

class item_tranferencia extends StatelessWidget {
  final Transferencia transferencia;

  item_tranferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

//////////// TRANSFERENCIA

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);


}
