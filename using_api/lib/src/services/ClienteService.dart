import 'dart:convert';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:http/http.dart' as http;


class ClienteService {

  final String baseUrl = "";
  final String username = "recrutamento";
  final String password = "recrutamento";
  late String basicAuth = "Basic " + base64Encode(utf8.encode('$username:$password'));
  
  Future<List<ClienteModel>?> findAll() async{
    var response = await http.get(
      Uri.parse("http://localhost:8080/cliente/listar"),
      headers: {
        "authorization" : basicAuth,
      }
      );
    
    if(response.statusCode == 200) {
      List<ClienteModel> model = clienteModelFromJson(response.body);
      return model;
    } 

    }

    Future<ClienteModel> create(String nome, String login, String senha) async {

      final body = {
        "nome" : nome,
        "login": login,
        "senha":senha
      };

      var response = await http.post(Uri.parse("http://localhost:8080/cliente/gravar"),
      headers: {
        "authorization": basicAuth,
        "Content-Type": "application/json"
      },
      body: jsonEncode(body));

      if(response.statusCode == 201) {
        print(response.body);
        return ClienteModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Erro ao criar");
      }

    }

    Future<ClienteModel> findById(int id) async{
      var response = await http.get(Uri.parse("http://localhost:8080/cliente/listar/${id}"),
      headers: {
        "authorization": basicAuth
      });

      if(response.statusCode == 200) {
        ClienteModel model = ClienteModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Erro ao pegar cliente");
      }
      
    }

    Future<ClienteModel> update(int id,String nome, String login, String senha) async{

      var body = {
        "id": id,
        "nome": nome,
        "login": login,
        "senha": senha
      };

      var response = await http.put(Uri.parse("http://localhost:8080/cliente/gravar/${id}"),
      headers: {
        "authorization": basicAuth,
        "Content-Type": "application/json"
      },
      body: jsonEncode(body) 
      );
        ClienteModel? model = ClienteModel.fromJson(jsonDecode(response.body));
        return model;

    }

    Future<void> delete(int id) async {
      var response = await http.delete(Uri.parse("http://localhost:8080/cliente/deletar/${id}"),
      headers: {
        "authorization": basicAuth
      });
    }

    Future<void> status(int id) async{

      var response = await http.put(Uri.parse("htpp://localhost:8080/cliente/situacao/${id}"),
      headers: {
        "authorization": basicAuth
      },
      );

      if(response.statusCode != 200) {
       throw Exception("Erro ao atualizar status do cliente");
      }
    }

    Future<ClienteModel> findByNome(String nome) async{
      var response = await http.get(Uri.parse("http://localhost:8080/cliente/listar/nome/${nome}"),
      headers: {
        "authorization": basicAuth
      });

      if(response.statusCode == 200) {
        ClienteModel model = ClienteModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Erro ao buscar cliente pelo nome: " +  nome);
      }

    }

}