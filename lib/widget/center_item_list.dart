import 'package:flutter/material.dart';
import 'package:flutter_github/widget/flutter_github_common_widget.dart';

class CenterItemListWidget extends StatefulWidget {
  final VoidCallback onPressed;

  CenterItemListWidget({Key key, @required this.onPressed}) : super(key: key);

  @override
  _CenterItemListWidgetState createState() => _CenterItemListWidgetState();
}

class _CenterItemListWidgetState extends State<CenterItemListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        children: <Widget>[
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[Text("仓库"), Text("22")],
          ),
          VerticalDivider(width: 1, color: Colors.white, thickness: 1),
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[Text("粉丝"), Text("2")],
          ),
          VerticalDivider(width: 1, color: Colors.white, thickness: 1),
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[Text("关注"), Text("0")],
          ),
          VerticalDivider(width: 1, color: Colors.white, thickness: 1),
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[Text("星标", style: TextStyle(color: Colors.white)), Text("16", style: TextStyle(color: Colors.white))],
          ),
          VerticalDivider(width: 1, color: Colors.white, thickness: 1),
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[
              Text("荣耀"),
              Text("0")
            ],
          ),
        ],
      ),
    );
  }
}
