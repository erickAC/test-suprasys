import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/cliente_page.dart';
import 'package:using_api/src/models/cliente_model.dart';
import 'package:using_api/src/services/api_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<ClienteModel>? _clienteModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _clienteModel = (await ApiService().listAll())!; 
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        
        backgroundColor: Colors.lightBlue,
        child: ListView(
          children: [
            DrawerHeader(
              
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child:Icon(Icons.people_alt_outlined, color: Colors.amber,),
                  ),
                currentAccountPictureSize: Size.square(50),
                arrowColor: Colors.black,
                accountName: Text('Erick'),
                accountEmail: Text('cerickandrade@gmail.com'),
                
                ),
            ),
            ListTile(
              leading: Icon(
                Icons.add, color: Colors.white,
                ),
              title: Text('Adicionar Cliente', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.of(context).pushNamed("/adicionar_cliente");
              },
            )
          ],
          ),
        ) ,
      appBar: AppBar(
        title: Text('Recrutamento SupraSys'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _clienteModel!.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(Icons.people),                          
                hoverColor: Colors.blue,
                title: Text(_clienteModel![index].nome),
                trailing: ElevatedButton(
                  child: Text('Ver Página'),
                  onPressed: () {
                      Navigator.pushNamed(context, '/cliente', arguments: Argumentos(_clienteModel![index].id));
                  },
                  ),
            );
            }
            ),
              ),
              );

  }
}