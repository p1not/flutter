import 'package:flutter/material.dart';


class PriceTag extends StatelessWidget{
  final String price;

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      //o ${} diz ao dart que vou concatenar uma string com essa. Se não a string a concaternar n for um caracter reservado posso optar pelo +
                      //como o $ é reservado, tenho de usar o \$ para exibir só $
                      'valor: ' +
                          'R\$$price', //tem que converter poque é double
                      style: TextStyle(color: Colors.white),
                    ),
                  );
  }

  
}