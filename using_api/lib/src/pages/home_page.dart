import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/pages/cliente/cliente_page.dart';
import 'package:using_api/src/pages/cliente/clientes_busca_nome.dart';
import 'package:using_api/src/services/ClienteService.dart';
import 'package:using_api/src/templates/drawer_template.dart';

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

    late TextEditingController nomeBuscaController = TextEditingController();

    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBar(
        title: Text('Recrutamento'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar por nome',
                  suffixIcon:  Icon(Icons.search),
                ),
                controller: nomeBuscaController,
                onSubmitted: (text) {
                   final String nome = nomeBuscaController.text;
                  Navigator.of(context).pushNamed('/clienteNome', arguments: ArgumentosNome(nome));
                },
              ),
            ),
            Expanded(
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
                        alignment: WrapAlignment.spaceAround,
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
            ),
          ],
        ),
      )
        );
  }
  
}