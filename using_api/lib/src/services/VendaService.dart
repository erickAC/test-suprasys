import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:http/http.dart' as http;
import 'package:using_api/src/models/produto_model.dart';
import 'package:using_api/src/models/venda_model.dart';


class VendaService {

  final String baseUrl = "";
  final String username = "recrutamento";
  final String password = "recrutamento";
  late String basicAuth = "Basic " + base64Encode(utf8.encode('$username:$password'));
  
  Future<List<VendaModel>?> findAll() async{
    var response = await http.get(
      Uri.parse("http://localhost:8080/venda/listar"),
      headers: {
        "authorization" : basicAuth,
      }
      );
    
    if(response.statusCode == 200) {
      List<VendaModel> model = vendaModelFromJson(response.body);
      return model;
    } 

    }

    Future<VendaModel> create(String nome, double valor, double desconto, int estoque) async {

      final body = {
        "nome": nome,
        "valor": valor,
        "desconto": desconto,
        "estoque": estoque
      };

      var response = await http.post(Uri.parse("http://localhost:8080/venda/gravar"),
      headers: {
        "authorization": basicAuth,
        "Content-Type": "application/json"
      },
      body: jsonEncode(body));

      if(response.statusCode == 201) {
        print(response.body);
        return VendaModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Erro ao criar");
      }

    }

    Future<VendaModel> findById(int id) async{
      var response = await http.get(Uri.parse("http://localhost:8080/venda/listar/${id}"),
      headers: {
        "authorization": basicAuth
      });

      if(response.statusCode == 200) {
        VendaModel model = VendaModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception("Erro ao pegar produto");
      }
      
    }

    Future<VendaModel> update(int id,String nome, double valor, double desconto, int estoque) async{

      var body = {
        "idProduto": id,
        "nome": nome,
        "valor": valor,
        "desconto": desconto,
        "estoque": estoque
      };

      var response = await http.put(Uri.parse("http://localhost:8080/venda/gravar/${id}"),
      headers: {
        "authorization": basicAuth,
        "Content-Type": "application/json"
      },
      body: jsonEncode(body) 
      );
        VendaModel? model = VendaModel.fromJson(jsonDecode(response.body));
        return model;

    }

    Future<void> delete(int id) async {
      var response = await http.delete(Uri.parse("http://localhost:8080/venda/deletar/${id}"),
      headers: {
        "authorization": basicAuth
      });
    }

}