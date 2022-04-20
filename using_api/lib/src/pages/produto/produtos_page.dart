import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:using_api/src/models/produto_model.dart';
import 'package:using_api/src/pages/produto/produto_busca_nome.dart';
import 'package:using_api/src/pages/produto/produto_page.dart';
import 'package:using_api/src/services/ProdutoService.dart';
import 'package:using_api/src/templates/drawer_template.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({Key? key}) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  TextEditingController nomeBuscaController = TextEditingController();

  late List<ProdutoModel>? _produtoPage = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _produtoPage = (await ProdutoService().findAll())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerTemplate(),
        appBar: AppBar(
          title: const Text('Recrutamento SupraSys'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Procurar por nome',
                suffixIcon: Icon(Icons.search),
              ),
              controller: nomeBuscaController,
              onSubmitted: (text) {
                final String nome = nomeBuscaController.text;
                Navigator.of(context).pushNamed('/produtosNome', arguments: ArgumentosNome(nome));
              },
            ),
            Expanded(
              child: ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: _produtoPage!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_produtoPage![index].nome),
                    leading: const Icon(Icons.people),
                    hoverColor: Colors.lightBlue,
                    trailing: Wrap(
                      alignment: WrapAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {
                            ProdutoService()
                                .delete(_produtoPage![index].id);
                          },
                          child: const Text('Excluir'),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/produto',
                          arguments:
                              Argumentos(_produtoPage![index].id));
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
