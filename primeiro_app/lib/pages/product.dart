import 'package:flutter/material.dart';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  final double price;

  ProductPage(this.title, this.description,this.price, this.imageUrl); //colocar o preço

  /*
  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tem certeza?'),
            content: Text('Essa ação não pode ser desfeita.'),
            actions: <Widget>[
              //botões que quero colocar para o alert
              FlatButton(
                child: Text('SIM'),
                onPressed: () {
                  Navigator.pop(context); //isso fecha a caixa de dialogo
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text('CANCELAR'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
  */
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        //defino um método padrão para ser chamado quando tentar sair da página (pelo botão fisico ou do app)
        print('botão de voltar pressionado');
        Navigator.pop(context, false); //saio mas passando uma informação
        return Future.value(false); //se true posso sair até do principal e ai fica sem nd, erro.
      },
      child: Scaffold(                              //Scaffold é quem chama uma nova página
        appBar: AppBar(
          title: Text(title), //colocando o titulo passado por parametro na construção do widget
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(4),
                child: Image.asset(imageUrl),       //A imagem é como um widgetText(description),
              ),
               Container(
                 margin: EdgeInsets.only(top: 8, bottom: 2),
                 color: Colors.red,
                 child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: TitleDefault(title)
                      // Text(
                      //   title,
                      //   style: TextStyle(
                      //     fontSize: 26.0,
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily:'Oswald'         //oswald é uma fonte importada na pubspec.yaml
                      //   ),
                      // ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Text('Rio de Janeiro, RJ')
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        //o ${} diz ao dart que vou concatenar uma string com essa. Se não a string a concaternar n for um caracter reservado posso optar pelo +
                        //como o $ é reservado, tenho de usar o \$ para exibir só $
                        'valor: R\$ '+price.toString(), //tem que converter poque é double
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   child: RaisedButton(
              //     color: Theme.of(context).accentColor,
              //     child: Text('DELETE'),
              //     onPressed: () => _showWarningDialog(context)    //função anonima pois quero q seja executada na hora
              //   ),
              // ),
              
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 2),
                color: Colors.red[100],
                padding: EdgeInsets.all(10),
                child: Text(description, textAlign: TextAlign.center,),
              ),
            ],
          )
        )
      )
    );
  }
}
