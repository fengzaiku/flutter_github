import 'package:flutter/material.dart';
import 'package:flutter_github/utils/widget_standard.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';

class CenterItemSelectWidget extends StatelessWidget {
  final ValueChanged onPressed;
  final double radius;

  CenterItemSelectWidget({Key key,this.onPressed, this.radius}) : super(key: key);
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
            selectKey: 'warehouse', selectValue: "12", selectName: "仓库"),
        RowSelectItem(selectKey: 'fans', selectValue: "2", selectName: "粉丝"),
        RowSelectItem(
            selectKey: 'attention', selectValue: "0", selectName: "关注"),
        RowSelectItem(selectKey: 'star', selectValue: "1", selectName: "星标"),
        RowSelectItem(selectKey: 'glory', selectValue: "9", selectName: "荣耀"),
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
