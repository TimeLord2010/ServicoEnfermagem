import 'package:flutter/material.dart';

class CheckEmail extends StatefulWidget {
  @override
  _CheckEmail createState() => _CheckEmail();
}

class _CheckEmail extends State<CheckEmail> {
  void next() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckEmail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cheque seu email'),
        centerTitle: true,
        actions: [
          FlatButton(
            textColor: Colors.white,
            onPressed: next,
            child: Text("Próximo"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Text(
            "Cheque sua caixa de email para a confirmação. Caso não encontre, verifique a lixeira e caixa de spam."),
      ),
    );
  }
}
