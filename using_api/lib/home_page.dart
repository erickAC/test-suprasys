import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:using_api/src/cliente_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  radius: 2.0,
                  child: Image.network('https://scontent.fsjp3-1.fna.fbcdn.net/v/t1.6435-1/199373138_3786464788147305_7513211597548583798_n.jpg?stp=dst-jpg_p160x160&_nc_cat=105&ccb=1-5&_nc_sid=dbb9e7&_nc_ohc=ZEFqhjWBDIYAX_ogYEo&_nc_ht=scontent.fsjp3-1.fna&oh=00_AT8gvFsIEQ3_qG3TsFSpHUu-rNUgB5eYx2aGB8L4AVYA4Q&oe=6278C591'),
                  backgroundColor: Colors.amber,
                  
                  ),
                 arrowColor: Colors.black,
                accountName: Text('Erick'),
                accountEmail: Text('cerickandrade@gmail.com'),
                
                ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app, color: Colors.white,
                ),
              title: Text('Sair do sistema', style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
          ),
        ) ,
      appBar: AppBar(
        title: Text('Recrutamento SupraSys'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.blue,
                            alignment: Alignment.center,
                            child: 
                            Padding(

                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    child:
                                     Icon(Icons.people, color: Colors.white), 
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    child: Text('Clientes', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                      ),
                                      ),
                                  )
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]
            ),
        ),
      )
    );
  }
}