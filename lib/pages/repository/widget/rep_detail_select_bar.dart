import 'package:flutter/material.dart';
import 'package:flutter_github/widget/row_select_divider_list.dart';
import 'package:flutter_github/utils/widget_standard.dart';

class RepositionDetailSelectWidget extends StatefulWidget {
  final double shrinkOffset;

  RepositionDetailSelectWidget(this.shrinkOffset, {Key key}) : super(key: key);

  @override
  _RepositionDetailSelectWidgetState createState() => _RepositionDetailSelectWidgetState();
}

class _RepositionDetailSelectWidgetState extends State<RepositionDetailSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return RowSelectDividerListWidget(
      ratio: (45 - widget.shrinkOffset) / 45,
      items: [
        RowSelectItem(selectKey: 'dynamic', selectValue: "动态"),
        RowSelectItem(selectKey: 'push', selectValue: "提交"),
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
