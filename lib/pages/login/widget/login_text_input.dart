import 'package:flutter/material.dart';

typedef void LoginInputValueChanged<String>(String name, String value);
//typedef LoginInputValueChanged = void Function(String name, String value);

class LoginTextInput extends StatelessWidget {
  final TextEditingController           controller;
  final LoginInputValueChanged<String>  onChanged;
  final IconData                        icon;
  final String                          name;
  final String                          hintText;
  final bool                            obscureText;
  LoginTextInput({
    Key key,
    this.icon,
    this.name,
    this.hintText,
    this.onChanged,
    this.controller,
    this.obscureText = false
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText : obscureText,
      controller  : controller,
      onChanged   : (value){
        onChanged?.call(name,value);
      },
      decoration  : InputDecoration(
          icon    : Icon(icon),
          hintText: hintText
      ),
    );
  }
}
