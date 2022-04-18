import 'package:flutter/material.dart';
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

              ClienteService().create(nome, login, senha);

              Navigator.of(context).pushNamed('/');

            },
             child: const Text('Enviar'))
        ],
        ),
    );
  }
}