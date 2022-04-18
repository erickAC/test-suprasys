import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/models/produto_model.dart';
import 'package:using_api/src/services/ProdutoService.dart';

class ProdutoPage extends StatelessWidget {
  const ProdutoPage({ Key? key }) : super(key: key);

  static const String routeName = '/venda';
  
  @override
  Widget build(BuildContext context) { 

  late final id = ModalRoute.of(context)!.settings.arguments as Argumentos;   

  Future<ProdutoModel> _getDados() async{
      Future<ProdutoModel> produto = ProdutoService().findById(id.id);
      return produto;
  }

  int idProduto = id.id;
  TextEditingController idController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController descontoController = TextEditingController();
  TextEditingController estoqueController = TextEditingController();

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Produto'),
      ),
      body: Container(
        height: double.infinity,
        child: Center(
           child: FutureBuilder<ProdutoModel>(
             future: _getDados(),
             builder: (context, snapshot) {
               if(snapshot.hasData) {
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       TextField(
                         decoration: InputDecoration(
                           helperText: "Nome do Produto",
                           hintText: snapshot.data!.nome,
                         ),
                         controller: nomeController,
                       ),
                       TextField(
                         decoration: InputDecoration(
                           helperText: "Valor do Produto",
                           hintText: snapshot.data!.valor.toString(),
                         ),
                         controller: valorController,
                       ),
                       TextField(
                         decoration: InputDecoration(
                           helperText: "Desconto do Produto",
                           hintText: snapshot.data!.desconto.toString(),
                         ),
                         controller: descontoController,
                       ),
                       TextField(
                         decoration: InputDecoration(
                           helperText: "Estoque do Produto",
                           hintText: snapshot.data!.estoque.toString(),
                         ),
                         controller: estoqueController,
                       ),
                       TextButton(
                         onPressed: () {
                          final String nome = nomeController.text;
                          final double valor = double.parse(valorController.text);
                          final double desconto = double.parse(descontoController.text);
                          final int estoque = int.parse(estoqueController.text);

                          ProdutoService().update(idProduto, nome, valor, desconto, estoque); 

                          Navigator.of(context).pushNamed('/listar_produto');

                         }, 
                         child: Text("Atualizar Produto")
                         ),
                     ],
                     ),
                 );
               } else {
                 return Text('Carregando dados');
               }
             },
           )
             ),
      ),
    );
  }
}

class Argumentos {
  final int id;
  Argumentos(this.id);
}