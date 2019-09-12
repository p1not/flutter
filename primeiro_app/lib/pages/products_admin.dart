import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

class ProductsAdminPage extends StatelessWidget {
  //ProductsAdminPage();
  final Function addProduct;
  final Function deleteProduct;

  const ProductsAdminPage(this.addProduct, this.deleteProduct);

  Widget _buildSideDrawer(BuildContext context){
    return Drawer(
            //menu lateral
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text('Escolha'),
                  automaticallyImplyLeading: false, //desabilita o primeiro icone/função do menu, nesse caso some com o drawer dentro do menu
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('Todos os Produtos'),
                  onTap: () => Navigator.pushReplacementNamed(context, '/products')
                )
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,      //quantas abas vão ter
        child: Scaffold(
          drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Gerenciamento de Produtos'),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.create),
              text: 'Criar Produto',
            ),
            Tab(
              icon: Icon(Icons.list),
              text: 'Meus Produtos',
            ),
          ],),
      ),
      body: TabBarView(       //essa classe automaticamente detecta a aba clicada e carrega aqui
        children: <Widget>[
          ProductCreatePage(addProduct),
          ProductListPage(),
        ],
      ),   
    ));
  }
}


/*
Lenght tem que ser igual a quantidade de abas, que é a mesma qtd de Tab()
*/