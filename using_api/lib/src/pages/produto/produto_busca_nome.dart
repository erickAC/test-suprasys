import 'package:flutter/material.dart';
import 'package:using_api/src/models/produto_model.dart';
import 'package:using_api/src/services/ProdutoService.dart';
import 'package:using_api/src/templates/drawer_template.dart';

class ProdutoBuscaNome extends StatelessWidget {
  const ProdutoBuscaNome({ Key? key }) : super(key: key);

  static const String routeName = '/produtosNome';

  @override
  Widget build(BuildContext context) {

    late final nomeBusca = ModalRoute.of(context)!.settings.arguments as ArgumentosNome;

    void _getDados() async{
      Future<List<ProdutoModel>> list = ProdutoService().findAllByNome(nomeBusca.nome);
    }

    return Scaffold(
      drawer: const DrawerTemplate(),
      appBar: AppBar(
        title: Text('Busca por: ' + nomeBusca.nome),
      ),
      body: Center(
         child:Column(
           children: [
             Row(
               children: [
                 Expanded(
                   child: ListView.builder(
                     shrinkWrap: true,
                     itemCount: list?.length,
                     itemBuilder: (context, index) {
                       return ListTile(
                         title: Text(list[index].nome),
                         trailing: Text("Preço: " + list[index].valor.toString()),
                       );
                     },
                     ),
                 ),
               ],
             ),
           ],
         ),
           ),
    );
  }
}

class ArgumentosNome {
  late String nome;
  ArgumentosNome(this.nome);
}