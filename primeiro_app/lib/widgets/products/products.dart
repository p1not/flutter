import 'package:flutter/material.dart';
//import './price_tags.dart';
import './product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>>
      products; //o valor da lista não vai mudar, é substituido e depois recriado

  Products(this.products) {
    //define um array vazio como padrão caso não seja passao um array de produtos na chamda desse widget
    print('produtos widget - constructor()');
  }

/*
  A navegação no Flutter funciona como um pilha(stack), sempre vejo o que está no topo, por isso uso push() para navegar entre as páginas
  colocando a nova no topo da pilha. para voltar removo da pilha
*/
  //comentado pois antes o produto era carregado aqui, mas agora está em um widget separado
  /*
   Widget _buildProductItem(BuildContext context, int index) {     //o context é o escopo do Navigation()
     return Card(
      child: Column(            //centraliza na vertical
        children: <Widget>[     //array de widgets, um elemento abaixo do outro na coluna
          Image.asset(product['image']),
          Container(            //posso usar classe Padding também mas popriedade margin != padding
            margin: EdgeInsets.only(top: 10, bottom: 2),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //Expanded() pode ser usado em coluna ou linha para que o elemento filho ocupe o maior tamanho possível do widget
                //Flexibe() parece com expanded mas não necessáriamente vai ocupar todo o espaço, pode ser configurado to fit
                // Flexible(
                //   fit: FlexFit.tight,
                //   flex: 10,
                //   child: 
                  Text(
                    product['title'],
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily:
                            'Oswald' //oswald é uma fonte importada na pubspec.yaml
                        ),
                  ),
                //),
                SizedBox(
                  width: 8.0,
                ),
                // Expanded(
                //   flex: 10,
                //   child: 
                PriceTag(product['price'].toString()),  
                // )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text('Rio de Janeiro, RJ')
          ),
          /* //o modo com DecoratedBox é menos performático e mais hierárquico, com container fica mais flexível
          DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(6.0),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Rio de Janeiro, RJ'),
              )
          ),
          */
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton( //FlatButton é um botão sem fundo, só texto. Substituí por IconButton
                //child: Text('Detalhes'),
                icon: Icon(Icons.info),
                iconSize: 50,
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString()),
              ),
              IconButton( 
                icon: Icon(Icons.favorite_border),
                iconSize: 50,
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString()),
              )
            ],
          )
        ],
      ),
    );    */
  // }

  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        // itemBuilder: _buildProductItem,
        itemBuilder: (BuildContext context, int index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productCards =
          Container(); //quando não quero renderizar nada, em vez de null uso um container vazio
      //productCards = Center( child: Text('Nenhum produto encontado, por favor adicione produtos.') );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('produtos widget - build()');
    return _buildProductList();
  }
}

/*
    return ListView(
      children: products.map(           //map permite transformar cada elemento da lista em um novo elemento
        (element) => Card(
          child: Column(
            children: <Widget>[         //array de widgets, cada um será uma coluna
              Image.asset('assets/food.jpg',
                          width: 600,            
                          height: 240,            
                          fit: BoxFit.cover),
              Text(element),
            ],
          ),
        ),
      ).toList(),
    );
*/
