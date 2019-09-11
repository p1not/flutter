import 'package:flutter/material.dart';
import 'package:primeiro_app/product_manager.dart';
import 'package:primeiro_app/widgets/products/products.dart';


class ProductsPage extends StatelessWidget {
  final List<Map<String,dynamic>> products;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(        //Scaffold é quem chama uma nova página
      drawer: Drawer(         //menu lateral
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('Escolha'),
              automaticallyImplyLeading: false ,      //desabilita o primeiro icone/função do menu, nesse caso some com o drawer dentro do menu
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Gerenciar Produtos'),
              onTap: () => Navigator.pushReplacementNamed(context, '/admin') ,  //acessando a página através de uma rota definida na Material Dart
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: (){},
          )
        ],
      ),
      body:
          Products(products),
          //ProductManager(products), //passando os dados recebidos no construtor da classe como parâmetro para a outra tela
    );
  }
}
