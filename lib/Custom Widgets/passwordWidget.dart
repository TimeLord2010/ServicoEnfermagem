// TextFormField(
//               keyboardType: TextInputType.text,
//               //controller: _userPasswordController,
//               obscureText: !_passwordVisible,
//               decoration: InputDecoration(
//                 labelText: 'Senha',
//                 hintText: '******',
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _passwordVisible ? Icons.visibility : Icons.visibility_off,
//                     color: Theme.of(context).primaryColorDark,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _passwordVisible = !_passwordVisible;
//                     });
//                   },
//                 ),
//               ),
//             ),

import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {

  PasswordWidget({this.label});
  
  final String label;

  _PasswordWidget createState() => _PasswordWidget(label);

}

class _PasswordWidget extends State<PasswordWidget> {
  _PasswordWidget(String label) {
    this.label = label;
  }

  bool _passwordVisible = false;
  String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      //controller: _userPasswordController,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        labelText: label,
        hintText: '******',
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
