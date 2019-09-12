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
    final double deviceWidth =  MediaQuery.of(context).size.width;  //.orientation
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;  //se.. então.. se não..
    final double targetPadding = deviceWidth - targetWidth;
    
    return Container(
      width: targetWidth,
      margin: EdgeInsets.all(10.0),
      child: ListView(    //Os filhos do ListView por default ocupam sempre todo o espaço horizontal disponível da vertical
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),   //garanto q mesmo em modo paisagem não ocupa toda a largura
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            //sizedBox não redenriza nenhum conetúdo, ele só ocupa um espaço, para afastar o botão do TextField
            height: 10,
          ),
          // GestureDetector(      //funciona como um listener 
          //   onTap: _submitForm,    //há vários tipos de comandos para escutar
          //   child: Container(
          //     padding: EdgeInsets.all(5),
          //     color: Colors.green,
          //     child: Text("Botão Customizado"),
          //   ),
          // ),
          RaisedButton(
            textColor: Colors.orangeAccent, //Aida não é possível mudar a cor do botão pelo thema, só direto no botão
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
      )
    );
  }
}
