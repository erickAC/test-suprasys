import 'package:flutter/material.dart';
import 'package:using_api/src/pages/cliente/cliente_page.dart';
import 'package:using_api/src/pages/home_page.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/pages/cliente/adicionar_cliente_page.dart';
import 'package:using_api/src/pages/produto/adicionar_produto_page.dart';
import 'package:using_api/src/pages/produto/produto_page.dart';
import 'package:using_api/src/pages/produto/produtos_page.dart';
import 'package:using_api/src/services/ClienteService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recrutamento SupraSys',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: Locale('pt', 'BR'),
        routes: {
          '/': ((context) => HomePage()),
          '/adicionar_cliente':((context) => ClienteAdd()),
          ClientePage.routeName: (context) => ClientePage(),
          '/adicionar_produto':((context) => AdicionarProduto()),
          '/listar_produto': (((context) => ProdutosPage())),
          ProdutoPage.routeName: (context) => ProdutoPage(),
        },
    );
  }
}