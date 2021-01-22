import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal_enfermeiros/Custom%20Widgets/passwordWidget.dart';

class RegisterCredentials extends StatefulWidget {
  RegisterCredentials({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterCredentials createState() => _RegisterCredentials();
}

class _RegisterCredentials extends State<RegisterCredentials> {
  final _formKey = GlobalKey<FormState>();

  void next() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterCredentials()),
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
                        if (!value.contains('@')) {
                          return 'Email não é válido';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    PasswordWidget(label: 'Senha'),
                    PasswordWidget(label: 'Confirmar senha')
                  ],
                ))));
  }
}
