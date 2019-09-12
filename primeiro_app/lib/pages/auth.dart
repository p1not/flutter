import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  //var authPage;

  //AuthPage(this.authPage);

  DecorationImage _buildBackgroundImage(){
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.5), 
        BlendMode.dstATop
      ),
      image: AssetImage('assets/background.jpg') //sempre q adicionar uma nova imagem, declarar no pubspec.yaml
    );
  }

  Widget _buildEmailTextField(){
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value; //coloco o valor digitado na variável
        });
      },
    );
  }

  Widget _buildAcceptSwitch(){
    return SwitchListTile(
      title: Text('Termos de Aceite'),
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField(){
    return TextField(
      textInputAction: TextInputAction.send,  //troca o botão Done do teclado por Send
      //decoration: null remove underline do campo, ou:  decoration: InputDecoration.collapsed(hintText: "")
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Senha',
        //helperText: "Digite sua senha",     //msg persistente
        filled: true, 
        fillColor: Colors.white
      ),
      obscureText: true, //para não exibir a senha
      onChanged: (String value) {
        setState(() {
          _passwordValue = value; //coloco o valor digitado na variável
        });
      },
    );
  }

  void _submitForm(){
    print(_emailValue);
    print(_passwordValue);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        //margin: EdgeInsets.all(10),   //usar margin para espaço cresça dentro do box e padding para add expaço externo ao box
        padding: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(   //Era ListView - troquei para SingleChildScrollView para centralizar e ao subir o teclado empurrar widget
            child: Column(children: <Widget>[
              _buildEmailTextField(),
              SizedBox(height: 10,),
              _buildPasswordTextField(),
              _buildAcceptSwitch(),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: _submitForm,     //não chama o métododo com (), passa só a referência para ele
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
