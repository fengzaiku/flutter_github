import 'package:flutter/material.dart';

class DynamicPageWidget extends StatefulWidget {
  DynamicPageWidget({Key key}) : super(key: key);

  @override
  _DynamicPageWidgetState createState() => _DynamicPageWidgetState();
}

class _DynamicPageWidgetState extends State<DynamicPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("dynamic"),
    );
  }
}