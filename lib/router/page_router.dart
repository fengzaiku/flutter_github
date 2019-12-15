import 'package:flutter/material.dart';

class PageRouter {

  static replaceHome(BuildContext context){
    Navigator.pushReplacementNamed(context, 'home_page');
  }

  static replaceLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, 'login_page');
  }
}