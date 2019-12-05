import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/pages/push/push_detail_page.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/user_icon.dart';

class AuthorPushItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      padding: EdgeInsets.all(10),
      child: FlatButton(
        onPressed: () {
          print("不要点击我");
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => PushDetailPageWidget()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UserIconWidget(
                  onPressed: () {
                    print("什么情况");
                  },
                ),
                Text("与在校"),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(" 天前"),
                  ),
                )
              ],
            ),
            Text("卡技术大会卡机但是空手道解放和看见士大夫")
          ],
        ),
      ),
    );
  }
}
