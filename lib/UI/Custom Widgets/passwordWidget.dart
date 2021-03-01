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
  PasswordWidget(
      {this.label, this.validator, this.onChanged, this.initialValue});

  final String label;
  final String initialValue;
  final Function(String) validator;
  final Function(String) onChanged;

  _PasswordWidget createState() => _PasswordWidget(
      label: label,
      validator: validator,
      initialValue: initialValue,
      onChanged: onChanged);
}

class _PasswordWidget extends State<PasswordWidget> {
  _PasswordWidget(
      {String label,
      String initialValue,
      Function(String) validator,
      Function(String) onChanged}) {
    this.label = label;
    this.initialValue = initialValue;
    this.validator = validator;
    this.onChanged = onChanged;
  }

  bool _passwordVisible = false;
  Function(String) validator;
  Function(String) onChanged;
  String label;
  String initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      //controller: _userPasswordController,
      obscureText: !_passwordVisible,
      initialValue: initialValue,
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
      validator: (value) {
        if (value.length < 6) {
          return 'Senha deve ter ao menos 6 caracteres.';
        }
        if (RegExp('\.').allMatches(value).map((e) => e[0]).toSet().length <
            3) {
          return 'A senha deve conter pelo menos 3 caracteres diferentes.';
        }
        if (validator != null) return validator(value);
        // if (RegExp('^[0-9]+\$').hasMatch(value)) {
        //   return 'A senha não pode conter somente números.';
        // }
        // if (!RegExp('[^a-z]').hasMatch(value)) {
        //   return 'Senha deve conter números, caracteres especiais ou letras maiúsculas.';
        // }
        return null;
      },
      onChanged: onChanged,
      //autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
