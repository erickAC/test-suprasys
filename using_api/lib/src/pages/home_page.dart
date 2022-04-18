import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/pages/cliente/cliente_page.dart';
import 'package:using_api/src/services/ClienteService.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  late List<ClienteModel>? _clienteModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }
  void _getData() async {
    _clienteModel = (await ClienteService().findAll())!; 
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
             TextButton(
           onPressed: () {
             Navigator.of(context).pushNamed('/listar_produto',);
           },
           child: Text('Listar Produto'), 
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
            itemCount: _clienteModel!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_clienteModel![index].nome),
                leading: Icon(Icons.people),
                hoverColor: Colors.lightBlue,
                trailing: Wrap(
                  alignment: WrapAlignment.spaceAround
                  ,
                  
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                    ClienteService().status(_clienteModel![index].id);
                  },
                  child: Text('Status'),
                ),
                SizedBox(width: 10,),
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                    ClienteService().delete(_clienteModel![index].id);
                  },
                  child: Text('Excluir'),
                ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/cliente', arguments: Argumentos(_clienteModel![index].id));
                  
                },
              );
            },)
        ),
      )
        );
  }
  
}