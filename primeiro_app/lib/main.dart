import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/auth.dart';
import 'package:primeiro_app/pages/product.dart';
import 'package:primeiro_app/pages/products.dart';
import 'package:primeiro_app/pages/products_admin.dart';
//import 'package:flutter/rendering.dart';

//Utilizar o máximo de stateless widget possível, apenas alguns stateful widget para gerenciar o conteúdo

void main() {
  //primeiro método que o flutter vai procurar
  //debugPaintSizeEnabled = true;
  //debugPaintBaseLinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(MyApp());
}

//mesmo que...
//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //StatefulWidget porque vou ter que gerenciar aqui os produtos
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  //melhor ter os metodos na main porque ela não se desfaz
  void _addProduct(Map<String, dynamic> product) {
    //tipo da chave e tipo do valor
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    //o flutter sempre vai buscar o build de cada classe
    print('main widget - build()');
    return MaterialApp(
      //Um widget sempre retorna outr widget. Na nova versão do dart não precisa dar new
      //debugShowMaterialGrid: true, //apenas no modo de desenvolvimento
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange, //usado para definir uma cor e a partir dela é definida as demais
        accentColor: Colors.deepPurple,
        buttonColor: Colors.deepPurple,
      ),
      //home: AuthPage(),
      //aqui dentro do MaterialApp, o maior widget do sistema, vou definir todas as rotas para as páginas do sistema
      routes: {
        //essa é a rota padrão, a home do sistema. Ou uso ela ou defino com a propriedade home: do MaterialApp
        '/': (BuildContext context) => AuthPage(), //ProductsPage(_products),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductsAdminPage( _addProduct, _deleteProduct),
      },
      // onGenerateRoute: é usado para definir rotas dinâmicas, que não estão definidas na routes:
      onGenerateRoute: (RouteSettings settings) {
        //executado quando navego para uma rota não registrada
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null; //significa que falhou
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            //retorna um booleano
            builder: (BuildContext context) => ProductPage(
              _products[index]['title'],
              _products[index]['description'],
              _products[index]['price'],
              _products[index]['image']
            ),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products)
        );
      },
    );
  }
}
