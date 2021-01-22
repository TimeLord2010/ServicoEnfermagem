import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_enfermeiros/Register/registerCredentials.dart';

class WelcomePage extends StatefulWidget {

  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Welcome createState () => _Welcome();
}

class _Welcome extends State<WelcomePage> {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seja bem vindo'),
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: SizedBox(
              child: Text('Imagem Logo'),
              height: 200,
              width: 200,
            ),
            margin: EdgeInsets.all(30.0),
            color: Colors.grey,
            ),
            Container(
              child: SizedBox(
                child: Text('Legenda'),
                width:  80,
                height: 50,
              ),
              color: Colors.yellow,
            ),
            Container(
              child: RaisedButton(
                child: Text('Registrar'),
                color: Colors.blueAccent,
                padding: EdgeInsets.all(8.0),  
                splashColor: Colors.grey,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterCredentials()),
                  )
                }
              ),
              margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 30.0),
            ),
            Container(
              child: FlatButton(
                child: Text(
                  'Já se registrou? Tente Logar', 
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                color: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => {},
              ),
              margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0), 
            )
          ],
        ),
      ),
    );
  }
}