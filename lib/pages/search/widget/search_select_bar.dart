import 'package:flutter/material.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';
import 'package:flutter_github/utils/widget_standard.dart';

class SearchSelectListWidget extends StatefulWidget {

  SearchSelectListWidget({Key key}) : super(key: key);

  @override
  _SearchSelectListWidgetState createState() => _SearchSelectListWidgetState();
}

class _SearchSelectListWidgetState extends State<SearchSelectListWidget> {
  @override
  Widget build(BuildContext context) {
    return RowSelectDividerListWidget(
      ratio: 0,
      items: [
        RowSelectItem(selectKey: 'reposition', selectValue: "仓库"),
        RowSelectItem(selectKey: 'user', selectValue: "用户"),
      ],
      builder: (RowSelectItem item, int index) {
        return Expanded(
          child: FlatButton(
            onPressed: () {
              print(item.selectKey);
            },
            child: Center(
              child: Text(
                item.selectValue,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
