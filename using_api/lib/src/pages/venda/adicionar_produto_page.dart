import 'package:flutter/material.dart';
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
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Estoque do produto'
              ),
              controller: estoqueController,
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Valor do produto'
              ),
              controller: valorController,
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Desconto do produto'
              ),
              controller: descontoController,
            )
          ),
          TextButton(
            onPressed: () {
              final String nome = nomeController.text;
              final double valor = double.parse(valorController.text);
              final double desconto = double.parse(descontoController.text);
              final int estoque = int.parse(estoqueController.text);

              ProdutoService().create(nome, valor, desconto, estoque);

              Navigator.of(context).pushNamed('/listar_produto');

            },
             child: Text('Enviar'))
        ],
        ),
    );
  }
}