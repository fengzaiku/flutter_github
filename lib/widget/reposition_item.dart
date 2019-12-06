import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/common/iconfont.dart';
import 'package:flutter_github/pages/repository/repo_detail.dart';
import 'package:flutter_github/widget/user_icon.dart';
import 'package:flutter_github/widget/icon_text.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';

class RepositionItemWidget extends StatelessWidget {
  Widget _renderButtomItem(BuildContext context, IconData icon, String text,
      {int flex = 0}) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerRight,
        child: IconTextWidget(
          icon: icon,
          text: text,
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UserIconWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "大海2",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    IconTextWidget(
                      key: ValueKey("FgIcons.community_dynamics"),
                      icon: FgIcons.community_dynamics,
                      text: '作者',
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text("大海看见好卡"),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 6, bottom: 2),
              alignment: Alignment.topLeft,
              child: Text(
                "大口径哈萨克大家",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _renderButtomItem(context, FgIcons.star, '12312312312312'),
                _renderButtomItem(context, FgIcons.dynamic, 'werwerwe'),
                _renderButtomItem(context, FgIcons.point, 'asdasdasdasdasd',
                    flex: 4),
              ],
            )
          ],
        ),
        onTap: () {
          print("点击了");
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => RepositionDetailPageWidget()));
        },
      ),
    );
  }
}
