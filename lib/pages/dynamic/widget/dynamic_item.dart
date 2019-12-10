import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github/pages/push/push_detail_page.dart';
import 'package:flutter_github/widget/flutter_github_card.dart';
import 'package:flutter_github/widget/user_icon.dart';

class DynamicItemWidget extends StatelessWidget {
  final bool needUserIcon;

  DynamicItemWidget({
    Key key,
    this.needUserIcon = true,
  }) : super(key: key);

  Widget _renderDynamicHeader(){
    return needUserIcon ? Row(
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
    ) : Row(
      children: <Widget>[
        Text("与在校"),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Text(" 天前"),
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return FgCardItemWidget(
//      padding: EdgeInsets.all(10),
      child: FlatButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => PushDetailPageWidget()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _renderDynamicHeader(),
            Text("卡技术大会卡机但是空手道解放和看见士大夫"),
            SizedBox(
              height: 5,
            ),
            Text(
              "slkdfj螺丝扣搭街坊立刻撒旦解放善良的开房纪录时刻提防螺丝扣搭街坊立刻撒旦解放螺丝钉咖啡碱流口水的份螺丝钉咖啡碱老师肯定dslkfjkfjsljdflskjdflksldfjsdlkfjlskdflkj空手道解放和快速搭建",
              maxLines: 3,
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
