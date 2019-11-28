import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/user_icon.dart';

class PushCodeHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      color: Colors.black87,
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserIconWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconTextWidget(
                      icon: FgIcons.edit,
                      iconColor: Colors.white,
                      text: '7',
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconTextWidget(
                      icon: FgIcons.add,
                      iconColor: Colors.white,
                      text: '80',
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconTextWidget(
                      icon: FgIcons.reduce,
//                      iconSize: 12,
                      iconColor: Colors.white,
                      text: '9',
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    text: '70',
                    style: TextStyle(color: Colors.white),
                    children: <TextSpan>[TextSpan(text: '小时')],
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Push at 修改",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
    );
  }
}