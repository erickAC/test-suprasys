import 'package:flutter/material.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/services/ClienteService.dart';

class ClienteAdd extends StatelessWidget {
  const ClienteAdd({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar cliente'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Nome do Cliente'
              ),
              controller: nomeController,
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Login do Cliente'
              ),
              controller: loginController,
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha do Cliente'
              ),
              controller: senhaController,
            )
          ),
          TextButton(
            onPressed: () {
              final String nome = nomeController.text;
              final String login = loginController.text;
              final String senha = senhaController.text;

              final erro = SnackBar(
                  content: Text("Erro ao salvar cliente"),  
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
                content: Text("Cadastrado com sucesso"),
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

              salvarDados() async{
                try{
                  bool cliente = await ClienteService().create(nome, login, senha);
                  print(cliente);
                  if(cliente == true) {
                    ScaffoldMessenger.of(context).showSnackBar(sucesso);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(erro);
                  }
                } catch(e) {
                  print('Erro');
                } 
              }
              print(salvarDados());

            },
             child: const Text('Enviar'))
        ],
        ),
    );
  }
}