import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:using_api/src/models/cliente_model.dart';


class ApiService {
  
  final String username = 'recrutamento';
  final String password = '123';
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


}