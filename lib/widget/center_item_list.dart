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
            children: <Widget>[
              Text("仓库", style: TextStyle(color: Colors.white)),
              Text("22", style: TextStyle(color: Colors.white))
            ],
          ),
          VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[
              Text("粉丝", style: TextStyle(color: Colors.white)),
              Text("2", style: TextStyle(color: Colors.white))
            ],
          ),
          VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[
              Text("关注", style: TextStyle(color: Colors.white)),
              Text("0", style: TextStyle(color: Colors.white))
            ],
          ),
          VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[
              Text("星标", style: TextStyle(color: Colors.white)),
              Text("16", style: TextStyle(color: Colors.white))
            ],
          ),
          VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
          FlutterGithubColumnFlatButtonWidget(
            onPressed: widget.onPressed,
            children: <Widget>[
              Text("荣耀", style: TextStyle(color: Colors.white)),
              Text("0", style: TextStyle(color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}
