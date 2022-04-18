import 'package:flutter/material.dart';
import 'package:using_api/src/models/venda_model.dart';
import 'package:using_api/src/pages/produto/produto_page.dart';
import 'package:using_api/src/services/VendaService.dart';
import 'package:using_api/src/templates/drawer_template.dart';

class VendasPage extends StatefulWidget {
  const VendasPage({ Key? key }) : super(key: key);

  @override
  State<VendasPage> createState() => _VendasPageState();
  
}

class _VendasPageState extends State<VendasPage> {

  late List<VendaModel>? _vendaPage = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }
  void _getData() async {
    _vendaPage = (await VendaService().findAll())!; 
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerTemplate(),
      appBar: AppBar(
        title: Text('Recrutamento SupraSys'),
      ),
      body: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            addAutomaticKeepAlives: true,
            itemCount: _vendaPage!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Venda: " + _vendaPage![index].id.toString()),
                leading: Icon(Icons.people),
                hoverColor: Colors.lightBlue,
                trailing: Wrap(
                  alignment: WrapAlignment.spaceAround
                  ,
                  
                  children: [
                SizedBox(width: 10,),
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                    VendaService().delete(_vendaPage![index].id);
                  },
                  child: Text('Excluir'),
                ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/venda', arguments: Argumentos(_vendaPage![index].id));
                  
                },
              );
            },)
        ),
      )
        );
  }
  
}