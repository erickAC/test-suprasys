import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/models/produto_model.dart';
import 'package:using_api/src/pages/cliente/cliente_page.dart';
import 'package:using_api/src/services/ClienteService.dart';
import 'package:using_api/src/services/ProdutoService.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({ Key? key }) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
  
}

class _ProdutosPageState extends State<ProdutosPage> {

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
      drawer: Drawer(
       child: ListView(
         children: [
           TextButton(
           onPressed: () {
             Navigator.of(context).pushNamed('/adicionar_cliente');
           },
           child: Text('Adicionar Cliente'), 
             ),
             TextButton(
           onPressed: () {
             Navigator.of(context).pushNamed('/adicionar_produto',);
           },
           child: Text('Adicionar Produto'), 
             ),
         ]
       ),
      ),
      appBar: AppBar(
        title: Text('Recrutamento SupraSys'),
      ),
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            addAutomaticKeepAlives: true,
            itemCount: _produtoPage!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_produtoPage![index].nome),
                leading: Icon(Icons.people),
                hoverColor: Colors.lightBlue,
                trailing: Wrap(
                  alignment: WrapAlignment.spaceAround
                  ,
                  
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                    ClienteService().status(_produtoPage![index].id);
                  },
                  child: Text('Status'),
                ),
                SizedBox(width: 10,),
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                    ProdutoService().delete(_produtoPage![index].id);
                  },
                  child: Text('Excluir'),
                ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/produto', arguments: Argumentos(_produtoPage![index].id));
                  
                },
              );
            },)
        ),
      )
        );
  }
  
}