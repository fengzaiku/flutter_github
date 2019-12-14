import 'package:flutter/material.dart';

class PageRouter {  
  static replaceHome(BuildContext context){
    Navigator.pushReplacementNamed(context, 'home_page');
  }
}