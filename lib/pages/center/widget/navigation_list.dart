import 'package:flutter/material.dart';
import 'package:flutter_github/widget/flutter_github_common_widget.dart';

class NavigationListWidget extends StatefulWidget {
  final VoidCallback onPressed;

  NavigationListWidget({Key key, @required this.onPressed}) : super(key: key);

  @override
  _NavigationListWidgetState createState() => _NavigationListWidgetState();
}

class _NavigationListWidgetState extends State<NavigationListWidget> {
  Map itemListMap = <String, Map>{
    "warehouse": {"name": "仓库", "value": 12},
    "fans": {"name": "粉丝", "value": 2},
    "attention": {"name": "关注", "value": 0},
    "star": {"name": "星标", "value": 2},
    "glory": {"name": "荣耀", "value": 9},
  };

  List<Widget> _getItemList() {
    List itemList = List<Widget>();
    List<String> keysList = List.from(itemListMap.keys);
    String lastElement = keysList.removeLast();

    itemListMap.forEach((name, item) {
      itemList.add(FlutterGithubColumnFlatButtonWidget(
        onPressed: widget.onPressed,
        children: <Widget>[
          Text(item["name"], style: TextStyle(color: Colors.white)),
          Text("${item["value"]}", style: TextStyle(color: Colors.white))
        ],
      ));
      if (lastElement != name) {
        itemList.add(VerticalDivider(
          color: Colors.white30,
          thickness: 1,
        ));
      }
    });
    return itemList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        children: _getItemList(),
      ),
    );
  }
}
