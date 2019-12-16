import 'package:flutter/material.dart';
import 'package:flutter_github/model/User.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';

class CenterItemSelectWidget extends StatelessWidget {
  final ValueChanged  onPressed;
  final double        radius;
  final User          userInfo;
  final int           started;

  CenterItemSelectWidget({Key key,this.onPressed, this.radius,this.userInfo, this.started}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RowSelectDividerListWidget(
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius))),
      boxHeight: 50,
      items: [
        RowSelectItem(
            selectKey: 'warehouse', selectValue: (userInfo?.publicRepos ?? 0).toString(), selectName: "仓库"),
        RowSelectItem(selectKey: 'fans', selectValue: (userInfo?.followers ?? 0).toString(), selectName: "粉丝"),
        RowSelectItem(
            selectKey: 'attention', selectValue: (userInfo?.following ?? 0).toString(), selectName: "关注"),
        RowSelectItem(selectKey: 'star', selectValue: (userInfo?.starred ?? 0).toString(), selectName: "星标"),
        RowSelectItem(selectKey: 'glory', selectValue: started.toString(), selectName: "荣耀"),
      ],
      builder: (RowSelectItem item, int index) {
        return Expanded(
          child: FlatButton(
            onPressed: () {
              onPressed?.call(item.selectKey);
              print(item.selectKey);
            },
            child: Column(
              children: <Widget>[
                Text(
                  item.selectName,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  item.selectValue,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
