import 'package:flutter/material.dart';

class DrawerTemplate extends StatelessWidget {
  const DrawerTemplate({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: Container(
         height: MediaQuery.of(context).size.height,
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             TextButton(
             onPressed: () {
               Navigator.of(context).pushNamed('/');
             },
             child: Text('Listar clientes'), 
               ),
             TextButton(
             onPressed: () {
               Navigator.of(context).pushNamed('/adicionar_cliente');
             },
             child: Text('Adicionar Cliente'), 
               ),
            TextButton(
             onPressed: () {
               Navigator.of(context).pushNamed('/listar_produto',);
             },
             child: Text('Listar Produto'), 
               ),
               TextButton(
             onPressed: () {
               Navigator.of(context).pushNamed('/adicionar_produto',);
             },
             child: Text('Adicionar Produto'), 
               ),
           ]
         ),
       ),
      );
  }
}