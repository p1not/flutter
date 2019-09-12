import 'package:flutter/material.dart';
// import 'package:primeiro_app/pages/products.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  //construtor para inicializar
  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  } //o conteúdo vai sofrer mudanças internas
}






class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.0;

  Widget _buildTitleTextField() {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration(labelText: 'Descrição do Produto'),
      onChanged: (String value) {
        setState(() {
          _descriptionValue =
              value; //a cada letra digitada muda o campo
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      textCapitalization:
          TextCapitalization.sentences, //coloca as primeiras letras maiúsculas
      decoration: InputDecoration(labelText: 'Titulo do Produto'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value; //a cada letra digitada muda o campo
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Valor do Produto'),
      onChanged: (String value) {
        setState(() {
          _priceValue =
              double.parse(value); //a cada letra digitada muda o campo
        });
      },
    );
  }

  void _submitForm(){
     final Map<String, dynamic> product = {
       'title': _titleValue,
       'description': _descriptionValue,
       'price': _priceValue,
       'image': 'assets/food.jpg'
     };
     widget.addProduct(product);
     Navigator.pushReplacementNamed(context,'/products'); //pushreplacement troca de página sem opção de voltar para a anterior
  }


  //é boa prática ter o mínimo de lógica no método build, por isso é chamado outros construtores dentro dele e não em seu corpo
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            SizedBox(
              //sizedBox não redenriza nenhum conetúdo, ele só ocupa um espaço, para afastar o botão do TextField
              height: 10,
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.orangeAccent, //usando da classe colors, se eu mudar o thema esse botão não muda a cor
              child: Text('Salvar'),
              onPressed: _submitForm, //não chamar a função (), só apontar a referência
              //   () {
              //   final Map<String, dynamic> product = {
              //     'title': _titleValue,
              //     'description': _descriptionValue,
              //     'price': _priceValue,
              //     'image': 'assets/food.jpg'
              //   };
              //   widget.addProduct(product);
              //   Navigator.pushReplacementNamed(context,
              //       '/products'); //pushreplacement troca de página sem opção de voltar para a anterior
              // },
            )
          ],
        ));
  }
}
