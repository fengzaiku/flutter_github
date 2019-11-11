import 'package:flutter/material.dart';

class MyCenterPageWidget extends StatefulWidget {
  MyCenterPageWidget({Key key}) : super(key: key);

  @override
  _MyCenterPageWidgetState createState() => _MyCenterPageWidgetState();
}

class _MyCenterPageWidgetState extends State<MyCenterPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("center"),
    );
  }
}