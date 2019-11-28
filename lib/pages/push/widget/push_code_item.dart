import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/code/code_detail.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';

class PushCodeItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "lib/widget/push_code_header.dart",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        FgCardItemWidget(padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 15),
          child: ListTile(
            leading: Icon(FgIcons.code),
            title: Text(
              "大海啊啊啊",
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
//              print("点击代码列表了");
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => CodeDetailPageWidget()));
            },
          ),
        ),
      ],
    );
  }
}
