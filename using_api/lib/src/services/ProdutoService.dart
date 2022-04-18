import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:using_api/src/models/produto_model.dart';


class ProdutoService {

  final String baseUrl = "";
  final String username = "recrutamento";
  final String password = "recrutamento";
  late String basicAuth = "Basic " + base64Encode(utf8.encode('$username:$password'));
  
  Future<List<ProdutoModel>?> findAll() async{
    var response = await http.get(
      Uri.parse("http://localhost:8080/produto/listar"),
      headers: {
        "authorization" : basicAuth,
      }
      );
    
    if(response.statusCode == 200) {
      List<ProdutoModel> model = produtoModelFromJson(response.body);
      return model;
    } 

    }

    Future<ProdutoModel> create(String nome, double valor, double desconto, int estoque) async {

      final body = {
        "nome": nome,
        "valor": valor,
        "desconto": desconto,
        "estoque": estoque
      };

      var response = await http.post(Uri.parse("http://localhost:8080/produto/gravar"),
      headers: {
        "authorization": basicAuth,
        "Content-Type": "application/json"
      },
      body: jsonEncode(body));

      if(response.statusCode == 201) {
        print(response.body);
        return ProdutoModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Erro ao criar");
      }

    }

    Future<ProdutoModel> findById(int id) async{
      var response = await http.get(Uri.parse("http://localhost:8080/produto/listar/${id}"),
      headers: {
        "authorization": basicAuth
      });

      if(response.statusCode == 200) {
        ProdutoModel model = ProdutoModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Erro ao pegar produto");
      }
      
    }

    Future<ProdutoModel> update(int id,String nome, double valor, double desconto, int estoque) async{

      var body = {
        "id": id,
        "nome": nome,
        "valor": valor,
        "desconto": desconto,
        "estoque": estoque
      };

      var response = await http.put(Uri.parse("http://localhost:8080/produto/gravar/${id}"),
      headers: {
        "authorization": basicAuth,
        "Content-Type": "application/json"
      },
      body: jsonEncode(body) 
      );
        ProdutoModel? model = ProdutoModel.fromJson(jsonDecode(response.body));
        return model;

    }

    Future<void> delete(int id) async {
      var response = await http.delete(Uri.parse("http://localhost:8080/produto/deletar/${id}"),
      headers: {
        "authorization": basicAuth
      });

      if(response.statusCode == 200) {
        print("Sucesso");
      }

    }

}