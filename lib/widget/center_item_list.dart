import 'package:flutter/material.dart';
import 'package:flutter_github/widget/flutter_github_common_widget.dart';

class CenterItemListWidget extends StatefulWidget {
  final VoidCallback onPressed;

  CenterItemListWidget({Key key, @required this.onPressed}) : super(key: key);

  @override
  _CenterItemListWidgetState createState() => _CenterItemListWidgetState();
}

class _CenterItemListWidgetState extends State<CenterItemListWidget> {
  Map itemListMap = <String, Map>{
    "warehouse":{
      "name": "仓库",
      "value": 12
    },
    "fans":{
      "name": "粉丝",
      "value": 2
    },
    "attention":{
      "name": "关注",
      "value": 0
    },
    "star":{
      "name": "星标",
      "value": 2
    },
    "glory":{
      "name": "荣耀",
      "value": 9
    },
  };

  List<Widget> _getItemList() {
    List itemList = List<Widget>();
//    List keysList = itemListMap.keys;
//    print("${keysList}");
    itemListMap.forEach((name,item) {

      itemList.add(FlutterGithubColumnFlatButtonWidget(
        onPressed: widget.onPressed,
        children: <Widget>[
          Text(item["name"], style: TextStyle(color: Colors.white)),
          Text("${item["value"]}", style: TextStyle(color: Colors.white))
        ],
      ));
      itemList.add(VerticalDivider(width: 1, color: Colors.grey, thickness: 1));
    });
    return itemList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        children: _getItemList(),
//        children: <Widget>[
//          FlutterGithubColumnFlatButtonWidget(
//            onPressed: widget.onPressed,
//            children: <Widget>[
//              Text("仓库", style: TextStyle(color: Colors.white)),
//              Text("22", style: TextStyle(color: Colors.white))
//            ],
//          ),
//          VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
//          FlutterGithubColumnFlatButtonWidget(
//            onPressed: widget.onPressed,
//            children: <Widget>[
//              Text("粉丝", style: TextStyle(color: Colors.white)),
//              Text("2", style: TextStyle(color: Colors.white))
//            ],
//          ),
//          VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
//          FlutterGithubColumnFlatButtonWidget(
//            onPressed: widget.onPressed,
//            children: <Widget>[
//              Text("关注", style: TextStyle(color: Colors.white)),
//              Text("0", style: TextStyle(color: Colors.white))
//            ],
//          ),
//          VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
//          FlutterGithubColumnFlatButtonWidget(
//            onPressed: widget.onPressed,
//            children: <Widget>[
//              Text("星标", style: TextStyle(color: Colors.white)),
//              Text("16", style: TextStyle(color: Colors.white))
//            ],
//          ),
//          VerticalDivider(width: 1, color: Colors.grey, thickness: 1),
//          FlutterGithubColumnFlatButtonWidget(
//            onPressed: widget.onPressed,
//            children: <Widget>[
//              Text("荣耀", style: TextStyle(color: Colors.white)),
//              Text("0", style: TextStyle(color: Colors.white))
//            ],
//          ),
//        ],
      ),
    );
  }
}
