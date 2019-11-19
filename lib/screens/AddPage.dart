import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:listadecompras/blocs/ProdutoListBloc.dart';
import 'package:listadecompras/models/Produto.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  
  var bloc = BlocProvider.getBloc<ProdutoListBloc>();

  TextEditingController produtoController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  _formField(text,controll,icon,type){
    return TextFormField(
      decoration: InputDecoration(
        icon: icon,
        border: UnderlineInputBorder(),
        hintText: text,
      ),
      controller: controll,
      keyboardType: type,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add_shopping_cart),
        title: Text("Add Produto"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _formField("Nome",produtoController,Icon(Icons.create),TextInputType.text),
            _formField("Preço",precoController,Icon(Icons.attach_money),TextInputType.number),
            _formField("Quantidade",quantidadeController,Icon(Icons.plus_one),TextInputType.number),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          var nome = produtoController.text;
          var preco = double.parse(precoController.text);
          var quantidade = int.parse(quantidadeController.text);
          
          bloc.addProduto(Produto(nome: nome,preco: preco,quantidade: quantidade));
        },
      ),
    );
  }
}