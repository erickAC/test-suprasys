// To parse this JSON data, do
//
//     final ProdutoModel = ProdutoModelFromJson(jsonString);

import 'dart:convert';

List<ProdutoModel> produtoModelFromJson(String str) => List<ProdutoModel>.from(json.decode(str).map((x) => ProdutoModel.fromJson(x)));

String produtoModelToJson(List<ProdutoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProdutoModel {
    ProdutoModel({
        required this.id,
        required this.nome,
        required this.estoque,
        required this.valor,
        required this.desconto,
    });

    int id;
    String nome;
    int estoque;
    int valor;
    int desconto;

    factory ProdutoModel.fromJson(Map<String, dynamic> json) => ProdutoModel(
        id: json["id"],
        nome: json["nome"],
        estoque: json["estoque"],
        valor: json["valor"],
        desconto: json["desconto"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "estoque": estoque,
        "valor": valor,
        "desconto": desconto,
    };
}
