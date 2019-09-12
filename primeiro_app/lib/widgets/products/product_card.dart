import 'package:flutter/material.dart';
import 'package:primeiro_app/widgets/products/price_tags.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget{
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow(){
    return Container(            //posso usar classe Padding também mas popriedade margin != padding
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
            // Text(      //modulei, como sofrera atualizações criei um widget TitleDefault só pra ele pra atualizar mais fácil
            //   product['title'],
            //   style: TextStyle(
            //       fontSize: 26.0,
            //       fontWeight: FontWeight.bold,
            //       fontFamily:
            //           'Oswald' //oswald é uma fonte importada na pubspec.yaml
            //       ),
            // ),
          //),
          TitleDefault(product['title']),
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
    );
  }

  Widget _buildActionButtons(BuildContext context){
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton( //FlatButton é um botão sem fundo, só texto. Substituí por IconButton
          //child: Text('Detalhes'),
          icon: Icon(Icons.info),
          iconSize: 50,
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(context, '/product/' + productIndex.toString()),
        ),
        IconButton( 
          icon: Icon(Icons.favorite_border),
          iconSize: 50,
          color: Colors.red,
          onPressed: () => Navigator.pushNamed<bool>(context, '/product/' + productIndex.toString()),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Card(
      child: Column(            //centraliza na vertical
        children: <Widget>[     //array de widgets, um elemento abaixo do outro na coluna
          Image.asset(product['image']),
          _buildTitlePriceRow(),
          AddressTag('Rio de janeiro, RJ'),
          _buildActionButtons(context),
          // Container(   //criei um widget AdressTag pra atualizar mais fácil o endereço
          //     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
          //     decoration: BoxDecoration(
          //       border: Border.all(color: Colors.grey, width: 1.0),
          //       borderRadius: BorderRadius.circular(6.0),
          //     ),
          //     child: Text('Rio de Janeiro, RJ')
          // ),
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
        ],
      ),
    );
  }
}