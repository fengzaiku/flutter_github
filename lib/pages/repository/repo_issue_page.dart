import 'package:flutter/material.dart';
import 'package:flutter_github/widget/search_input.dart';

class RepositionIssuePageWidget extends StatefulWidget {
  @override
  _RepositionIssuePageWidgetState createState() => _RepositionIssuePageWidgetState();
}

class _RepositionIssuePageWidgetState extends State<RepositionIssuePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        flexibleSpace: SearchInputWidget(),
        backgroundColor: Colors.white70,
      ),
      body: Text("深刻理解电话反馈及时答复"),
    );
  }
}
