import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


Main() async{
  
  final String username = 'recrutamento';
  final String password = '123';
  final String basicAuth = 'Basic ' + base64Encode(utf8.encode("$username:$password"));


  Future<List> listAll() async{
  var url = await Uri.parse('http://localhost:8080/cliente/listar');
    var response = await http.get(url,
      headers: {
        "authorization": basicAuth
      },
    );

  var json = jsonDecode(response.body);

  return await json;

  }

  Future findById(int id) async{
    var url = await Uri.parse('http://localhost:8080/cliente/listar/$id');
    var response = await http.get(url,
      headers: {
        "authorization": basicAuth
      },
    );

    var json = jsonDecode(response.body);
    
    print(json);

    return await json;

  }


}