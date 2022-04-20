import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/services/ClienteService.dart';
import 'package:using_api/src/services/ProdutoService.dart';

class AdicionarProduto extends StatelessWidget {
  const AdicionarProduto({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController valorController = TextEditingController();
  final TextEditingController descontoController = TextEditingController();
  final TextEditingController estoqueController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar produto'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nome do Produto'
                ),
                controller: nomeController,
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Estoque do produto'
                ),
                controller: estoqueController,
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Valor do produto'
                ),
                controller: valorController,
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Desconto do produto'
                ),
                controller: descontoController,
              ),
            )
          ),
          TextButton(
            onPressed: () {
              final String nome = nomeController.text;
              final double valor = double.parse(valorController.text);
              final double desconto = double.parse(descontoController.text);
              final int estoque = int.parse(estoqueController.value.text);

              final erro = SnackBar(
                  content: Text("Erro ao salvar produto"),  
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: 'OK',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listar_produto');
                    },
                    ),
                );

                final sucesso = SnackBar(
                content: Text("Cadastrado com sucesso"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  textColor: Colors.white,
                  label: 'OK',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/listar_produto');
                  },
                ),
                );

                salvarDados() async{
                try{
                  bool produto = await ProdutoService().create(nome, valor, desconto, estoque);
                  print(produto);
                  if(produto == true) {
                    ScaffoldMessenger.of(context).showSnackBar(sucesso);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(erro);
                  }
                } catch(e) {
                  print('Erro');
                } 
              }

              salvarDados();

            },
             child: Text('Enviar'))
        ],
        ),
    );
  }
}