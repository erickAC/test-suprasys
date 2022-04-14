import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/services/api_service.dart';

class AdicionarCliente extends StatefulWidget {
  const AdicionarCliente({ Key? key }) : super(key: key);

  @override
  State<AdicionarCliente> createState() => _AdicionarClienteState();
}

class _AdicionarClienteState extends State<AdicionarCliente> {

   final TextEditingController nomeController = TextEditingController();
   final TextEditingController loginController = TextEditingController();
   final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Cliente'),
      ),
      body: Center(
        child:Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nome'),
              controller: nomeController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Login'),
              controller: loginController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Senha'),
              controller: senhaController 
           ),
           SizedBox(height: 20),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(
               onPressed: () {
                 final String nome = nomeController.text;
                 final String login = loginController.text;
                 final String senha = senhaController.text;

                  final ApiService apiService = ApiService();
                  apiService.post(nome, login, senha);

                  Navigator.of(context).pushReplacementNamed('/');
               },
               child: Text('Enviar dados'),
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
               )
               ),
           ),
          ],
          ) 
        ),
    );
  }
}