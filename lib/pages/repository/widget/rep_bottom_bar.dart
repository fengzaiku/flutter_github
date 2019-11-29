import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/widget/icon_text.dart';

class RepositoryDetailBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconTextWidget(
              icon: FgIcons.star,
              iconSize: 18,
              iconSpace: 10,
              text: "Start",
            ),
            SizedBox(
              width: 20,
            ),
            IconTextWidget(
              icon: FgIcons.watcher,
              iconSize: 18,
              iconSpace: 10,
              text: "Watch",
            ),
            SizedBox(
              width: 20,
            ),
            IconTextWidget(
              icon: FgIcons.dynamic,
              iconSize: 18,
              iconSpace: 10,
              text: "Fork",
            ),
          ],
        ),
      ),
    );
  }
}
