import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/services/api_service.dart';

class Argumentos {
  final int id;
  Argumentos(this.id);
}

class ClientePage extends StatelessWidget {
  
  static const routeName = '/cliente';

  const ClientePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;

    late List<ClienteModel> _clienteModel = [];

    void _getData() async {
    _clienteModel = (await ApiService().findById(argumentos.id));
    }

    if(argumentos.id == null) {
      
    }

    print(argumentos.id);

    return Container(
      child: Scaffold(
        body: ListView.builder(
          itemCount: _clienteModel.length,
          itemBuilder: (context, index) {
            return Text("Nome:" + _clienteModel[index].nome);
          },
          )
        ),
    );
  }
}