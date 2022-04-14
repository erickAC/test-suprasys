import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:using_api/src/models/cliente_model.dart';


class ApiService {
  
  final String username = 'recrutamento';
  final String password = 'recrutamento';
  late String basicAuth = 'Basic ' + base64Encode(utf8.encode("$username:$password"));

  Future<List<ClienteModel>?> listAll() async{
    try{
  var url = await Uri.parse('http://localhost:8080/cliente/listar');
    var response = await http.get(url,
      headers: {
        "authorization": basicAuth
      },
    );

  if(response.statusCode == 200) {
    List<ClienteModel> _model  = clienteModelFromJson(response.body);
    return _model;
  }}catch(e) {
    e.toString();
  }
  }

  Future<List<ClienteModel>> post(String nome, String login, String senha) async{
    var url = await Uri.parse('http://localhost:8080/cliente/gravar');

    final body = {
        "nome": nome,
        "login": login,
        "senha": senha
    };

    var response = await http.post(url,
      headers: {
        "authorization": basicAuth,
        "Content-Type": "application/json"
      },
      body: jsonEncode(body));

    if(response.statusCode == 201) {
      final String json = response.body;

      return jsonDecode(json);
    } else {
      return List.empty();
    }

  }

  Future<List<ClienteModel>> findById(int id) async {
  var url = await Uri.parse('http://localhost:8080/cliente/listar/${id}');


    var response = await http.get(url,
      headers: {
        "authorization": basicAuth,
        "Content-Type": "application/json"
      });

    return clienteModelFromJson(response.body);
  }


}