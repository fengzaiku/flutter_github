import 'package:flutter/material.dart';
import 'package:flutter_github/widget/flutter_github_common_widget.dart';

class NavigationListItemWidget extends StatelessWidget {

  final ValueChanged<String> onPressed;
  final Map<String, Map> itemListMap;
  NavigationListItemWidget({Key key, @required this.onPressed, this.itemListMap}) : super(key: key);

  List<Widget> _getItemList() {
    List itemList = List<Widget>();
    List<String> keysList = List.from(itemListMap.keys);
    String lastElement = keysList.removeLast();

    itemListMap.forEach((name, item) {
      itemList.add(FlutterGithubColumnFlatButtonWidget(
        onPressed: (){
          onPressed?.call(name);
        },
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
