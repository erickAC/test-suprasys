// To parse this JSON data, do
//
//     final VendaModel = VendaModelFromJson(jsonString);

import 'dart:convert';

List<VendaModel> vendaModelFromJson(String str) => List<VendaModel>.from(json.decode(str).map((x) => VendaModel.fromJson(x)));

String vendaModelToJson(List<VendaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VendaModel {
    VendaModel({
        required this.id,
        required this.vendaProduto,
        required this.data,
        required this.valor,
        required this.desconto,
        required this.total,
    });

    int id;
    List<VendaProduto> vendaProduto;
    String data;
    int valor;
    int desconto;
    int total;

    factory VendaModel.fromJson(Map<String, dynamic> json) => VendaModel(
        id: json["id"],
        vendaProduto: List<VendaProduto>.from(json["vendaProduto"].map((x) => VendaProduto.fromJson(x))),
        data: json["data"],
        valor: json["valor"],
        desconto: json["desconto"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendaProduto": List<dynamic>.from(vendaProduto.map((x) => x.toJson())),
        "data": data,
        "valor": valor,
        "desconto": desconto,
        "total": total,
    };
}

class VendaProduto {
    VendaProduto({
      required this.id,
      required this.produto,
      required this.quantidade,
      required this.valor,
      required this.desconto,
      required this.total,
    });

    int id;
    Produto produto;
    int quantidade;
    int valor;
    int desconto;
    int total;

    factory VendaProduto.fromJson(Map<String, dynamic> json) => VendaProduto(
        id: json["id"],
        produto: Produto.fromJson(json["produto"]),
        quantidade: json["quantidade"],
        valor: json["valor"],
        desconto: json["desconto"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "produto": produto.toJson(),
        "quantidade": quantidade,
        "valor": valor,
        "desconto": desconto,
        "total": total,
    };
}

class Produto {
    Produto({
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

    factory Produto.fromJson(Map<String, dynamic> json) => Produto(
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
