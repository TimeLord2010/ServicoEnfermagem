import 'package:flutter/material.dart';
import 'package:portal_enfermeiros/UI/Custom%20Widgets/passwordWidget.dart';
import 'package:portal_enfermeiros/UI/mainScreen.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String email;
  String pwd;

  void login(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainWindow()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cheque seu email'),
        centerTitle: true,
        actions: [],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            TextFormField(
              initialValue: 'myemail@gmail.com',
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
            PasswordWidget(
              label: 'Senha',
              onChanged: (v) {
                pwd = v;
              },
            ),
            Container(
              child: RaisedButton(
                  child: Text('Login'),
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(15.0),
                  splashColor: Colors.blue[600],
                  onPressed: () => login(context)),
              margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 30.0),
            )
          ],
        ),
      ),
    );
  }
}
