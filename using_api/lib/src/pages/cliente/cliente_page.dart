import 'package:flutter/material.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/services/ClienteService.dart';
import 'package:using_api/src/templates/drawer_template.dart';

class ClientePage extends StatelessWidget {
  const ClientePage({Key? key}) : super(key: key);

  static const String routeName = '/cliente';

  @override
  Widget build(BuildContext context) {
    late final id = ModalRoute.of(context)!.settings.arguments as Argumentos;

    Future<ClienteModel> _getDados() async {
      Future<ClienteModel> cliente = ClienteService().findById(id.id);
      return cliente;
    }

    int idCliente = id.id;
    TextEditingController nomeController = TextEditingController();
    TextEditingController loginController = TextEditingController();
    TextEditingController senhaController = TextEditingController();

    return Scaffold(
      drawer: const DrawerTemplate(),
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: FutureBuilder<ClienteModel>(
          future: _getDados(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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

                          final erro = SnackBar(
                            content: Text("Erro ao alterar cliente"),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              textColor: Colors.white,
                              label: 'OK',
                              onPressed: () {
                                Navigator.of(context).pushNamed('/');
                              },
                            ),
                          );

                          final sucesso = SnackBar(
                            content: Text("Alterado com sucesso"),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              textColor: Colors.white,
                              label: 'OK',
                              onPressed: () {
                                Navigator.of(context).pushNamed('/');
                              },
                            ),
                          );

                          salvarDados() async {
                            try {
                              bool cliente = await 
                                ClienteService()
                                    .update(idCliente, nome, login, senha);

                              print(cliente);
                              if (cliente == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(sucesso);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(erro);
                              }
                            } catch (e) {
                              print('Erro');
                            }
                          }

                          print(salvarDados());

                        },
                        child: const Text("Atualizar Cliente")),
                  ],
                ),
              );
            } else {
              return const Text('Carregando dados');
            }
          },
        )),
      ),
    );
  }
}

class Argumentos {
  final int id;
  Argumentos(this.id);
}
