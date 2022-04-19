import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/pages/cliente/cliente_page.dart';
import 'package:using_api/src/services/ClienteService.dart';
import 'package:using_api/src/templates/drawer_template.dart';

class ClienteBuscaNome extends StatelessWidget {
  const ClienteBuscaNome({ Key? key }) : super(key: key);

  static const String routeName = '/clienteNome';


  @override
  Widget build(BuildContext context) {

    late final nome = ModalRoute.of(context)!.settings.arguments as ArgumentosNome;

    print(nome.nome);

    Future<ClienteModel?> _getDados() async{
      Future<ClienteModel?> cliente = ClienteService().findByNome(nome.nome.toString());
      return cliente;
    }

    print(_getDados());

    return Scaffold(
      drawer: const DrawerTemplate(),
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
           child: FutureBuilder<ClienteModel?>(
             future: _getDados(),
             builder: (context, snapshot) {
               if(snapshot.hasData) {
                 return Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Nome: " + snapshot.data!.nome),
                     SizedBox(height: 10,),
                     Text("Situação: " + snapshot.data!.situacao),
                     TextButton(
                       onPressed: () {
                         Navigator.of(context).pushNamed('/cliente', arguments: Argumentos(snapshot.data!.id));
                       },
                       child: Text("Editar"),
                       )
                   ],
                   );
               } else {
                 return const Text('Carregando dados');
               }
             },
           )
             ),
      ),
    );
  }
}

class ArgumentosNome {
  String nome;
  ArgumentosNome(this.nome);
}