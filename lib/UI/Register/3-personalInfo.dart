import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfo createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  void next() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonalInfo()),
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
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nome'),
            validator: (value) {
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'CPF'),
            validator: (value) {
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          )
        ]),
      ),
    );
  }
}
