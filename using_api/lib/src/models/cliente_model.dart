// To parse this JSON data, do
//
//     final ClienteModel = ClienteModelFromJson(jsonString);

import 'dart:convert';

List<ClienteModel> clienteModelFromJson(String str) => List<ClienteModel>.from(json.decode(str).map((x) => ClienteModel.fromJson(x)));

String clienteModelToJson(List<ClienteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClienteModel {
    ClienteModel({
       required this.id,
       required this.nome,
       required this.login,
       required this.senha,
       required this.situacao,
       required this.venda,
    });

    int id;
    String nome;
    String login;
    String senha;
    String situacao;
    dynamic venda;

    factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        id: json["id"],
        nome: json["nome"],
        login: json["login"],
        senha: json["senha"],
        situacao: json["situacao"],
        venda: json["venda"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "login": login,
        "senha": senha,
        "situacao": situacao,
        "venda": venda,
    };
}
