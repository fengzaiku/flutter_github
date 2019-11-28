import 'package:flutter/material.dart';
import 'package:flutter_github/widget/tabar_widget.dart';

class RepositionDetailPageWidget extends StatefulWidget {
  @override
  _RepositionDetailPageWidgetState createState() => _RepositionDetailPageWidgetState();
}

class _RepositionDetailPageWidgetState extends State<RepositionDetailPageWidget> {
  @override
  Widget build(BuildContext context) {
    return TabarPageWidget(
      title: Text("仓库详情"),
    );
  }
}
