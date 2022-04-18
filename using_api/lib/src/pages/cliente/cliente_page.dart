import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/services/ClienteService.dart';

class ClientePage extends StatelessWidget {
  const ClientePage({ Key? key }) : super(key: key);

  static const String routeName = '/cliente';
  
  @override
  Widget build(BuildContext context) { 

  late final id = ModalRoute.of(context)!.settings.arguments as Argumentos;   

  Future<ClienteModel> _getDados() async{
      Future<ClienteModel> cliente = ClienteService().findById(id.id);
      return cliente;
  }

  int idCliente = id.id;
  TextEditingController idController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Cliente'),
      ),
      body: Container(
        height: double.infinity,
        child: Center(
           child: FutureBuilder<ClienteModel>(
             future: _getDados(),
             builder: (context, snapshot) {
               if(snapshot.hasData) {
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       TextField(
                         decoration: InputDecoration(
                           helperText: "Nome do cliente",
                           hintText: snapshot.data!.nome,
                         ),
                         controller: nomeController,
                       ),
                       TextField(
                         decoration: InputDecoration(
                           helperText: "Login do cliente",
                           hintText: snapshot.data!.login,
                         ),
                         controller: loginController,
                       ),
                       TextField(
                         decoration: InputDecoration(
                           helperText: "Senha do cliente",
                           hintText: snapshot.data!.senha,
                         ),
                         controller: senhaController,
                       ),
                       TextButton(
                         onPressed: () {
                          final String nome = nomeController.text;
                          final String login = loginController.text;
                          final String senha = senhaController.text;

                          ClienteService().update(idCliente, nome, login, senha); 

                          Navigator.of(context).pushNamed('/');

                         }, 
                         child: Text("Atualizar Cliente")
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