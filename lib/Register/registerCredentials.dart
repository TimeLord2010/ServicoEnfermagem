import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_enfermeiros/Custom%20Widgets/passwordWidget.dart';
import 'package:toast/toast.dart';

import 'checkEmail.dart';

class RegisterCredentials extends StatefulWidget {
  RegisterCredentials({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterCredentials createState() => _RegisterCredentials();
}

class _RegisterCredentials extends State<RegisterCredentials> {

  final _formKey = GlobalKey<FormState>();
  String email;
  String pwd;

  void next() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckEmail()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro'),
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
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'meuemail@empresa.com',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email não pode ser vazio';
                        }
                        // # !value.contains('@') && !value.contains('.')
                        if (!RegExp('^.+@.+\\\..+\$').hasMatch(value)) {
                          return 'Email não é válido';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        email = value;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    PasswordWidget(label: 'Senha', onChanged: (v) => pwd = v,),
                    PasswordWidget(label: 'Confirmar senha', validator: (v) {
                      //Toast.show(pwd, context, gravity: Toast.CENTER, duration: Toast.LENGTH_SHORT);
                      if (v != pwd) {
                        return "As senha não são iguais.";
                      }
                    })
                  ],
                ))));
  }
}
